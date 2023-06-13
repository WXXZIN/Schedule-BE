package com.android.schedule.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.android.schedule.dao.ScheduleDAO;
import com.android.schedule.domain.Course;
import com.android.schedule.domain.Schedule;
import com.android.schedule.domain.ScheduleList;

public class ScheduleDAOImpl implements ScheduleDAO {
    private final Connection connection;

    public ScheduleDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void saveSchedule(String studentNumber, List<String> courseCodes, List<String> sectionNumbers) {
        int result = 0;

        String deleteSchedule = "DELETE FROM personal_schedules WHERE student_number = ?";

        String checkDuplicateSchedule = "SELECT COUNT(*) FROM personal_schedules WHERE student_number = ? AND schedule_id = ?";

        String insertSchedule = "INSERT INTO personal_schedules (student_number, schedule_id) " +
                "SELECT ?, s.schedule_id " +
                "FROM schedules s " +
                "JOIN sections sec ON s.section_id = sec.section_id " +
                "JOIN courses c ON sec.course_id = c.course_id " +
                "WHERE c.course_code = ? AND sec.section_number = ?";

        try {
            connection.setAutoCommit(false);

            PreparedStatement deleteScheduleStmt = connection.prepareStatement(deleteSchedule);
            deleteScheduleStmt.setString(1, studentNumber);
            deleteScheduleStmt.executeUpdate();

            if (!courseCodes.isEmpty() && !sectionNumbers.isEmpty()) {
                PreparedStatement checkDuplicateStmt = connection.prepareStatement(checkDuplicateSchedule);
                PreparedStatement insertScheduleStmt = connection.prepareStatement(insertSchedule);

                for (int i = 0; i < courseCodes.size(); i++) {
                    checkDuplicateStmt.setString(1, studentNumber);
                    checkDuplicateStmt.setInt(2, getScheduleId(courseCodes.get(i), sectionNumbers.get(i)));
                    ResultSet rs = checkDuplicateStmt.executeQuery();
                    if (rs.next() && rs.getInt(1) == 0) {  // 중복이 없으면 삽입
                        insertScheduleStmt.setString(1, studentNumber);
                        insertScheduleStmt.setString(2, courseCodes.get(i));
                        insertScheduleStmt.setString(3, sectionNumbers.get(i));
                        result += insertScheduleStmt.executeUpdate();
                    }
                    rs.close();
                }
            }

            connection.commit();

        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
        }
    }

    @Override
    public List<Schedule> getScheduleList() {
        List<Schedule> scheduleList = new ArrayList<>();

        String sql = "SELECT " +
                "s.schedule_id, " +
                "c.course_code, " +
                "sec.section_number, " +
                "c.course_name, " +
                "c.credits, " +
                "s.day_of_week, " +
                "s.start_time, " +
                "s.end_time, " +
                "b.building_name, " +
                "b.room_number " +
                "FROM schedules s " +
                "JOIN sections sec ON s.section_id = sec.section_id " +
                "JOIN courses c ON sec.course_id = c.course_id " +
                "JOIN buildings b ON s.building_id = b.building_id";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course(
                        rs.getString("course_code"),
                        rs.getString("course_name"),
                        rs.getInt("credits")
                );

                Schedule schedule = new Schedule(
                        rs.getLong("schedule_id"),
                        course,
                        rs.getString("section_number"),
                        rs.getString("day_of_week"),
                        rs.getInt("start_time"),
                        rs.getInt("end_time"),
                        rs.getString("building_name"),
                        rs.getString("room_number")
                );

                scheduleList.add(schedule);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return scheduleList;
    }

    @Override
    public List<Schedule> getPersonalSchedule(String studentNumber) {
        List<Schedule> scheduleListList = new ArrayList<>();

        String sql = "SELECT " +
                "s.schedule_id, " +
                "c.course_code, " +
                "sec.section_number, " +
                "c.course_name, " +
                "c.credits, " +
                "s.day_of_week, " +
                "s.start_time, " +
                "s.end_time, " +
                "b.building_name, " +
                "b.room_number " +
                "FROM schedules s " +
                "JOIN sections sec ON s.section_id = sec.section_id " +
                "JOIN courses c ON sec.course_id = c.course_id " +
                "JOIN buildings b ON s.building_id = b.building_id " +
                "JOIN personal_schedules ps ON s.schedule_id = ps.schedule_id " +
                "WHERE ps.student_number = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, studentNumber);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course(
                        rs.getString("course_code"),
                        rs.getString("course_name"),
                        rs.getInt("credits")
                );

                Schedule schedule = new Schedule(
                        rs.getLong("schedule_id"),
                        course,
                        rs.getString("section_number"),
                        rs.getString("day_of_week"),
                        rs.getInt("start_time"),
                        rs.getInt("end_time"),
                        rs.getString("building_name"),
                        rs.getString("room_number")
                );

                scheduleListList.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return scheduleListList;
    }

    @Override
    public List<ScheduleList> generateSchedule(List<String> courseCodes) {
        List<ScheduleList> scheduleList = new ArrayList<>();

        String sql = "SELECT " +
                "s.schedule_id, " +
                "c.course_code, " +
                "sec.section_number, " +
                "c.course_name, " +
                "c.credits, " +
                "s.day_of_week, " +
                "s.start_time, " +
                "s.end_time, " +
                "b.building_name, " +
                "b.room_number " +
                "FROM schedules s " +
                "JOIN sections sec ON s.section_id = sec.section_id " +
                "JOIN courses c ON sec.course_id = c.course_id " +
                "JOIN buildings b ON s.building_id = b.building_id " +
                "WHERE c.course_code IN (" + generateInClause(courseCodes.size(), 1) + ")";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            for (int i = 0; i < courseCodes.size(); i++) {
                pstmt.setString(i + 1, courseCodes.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course(
                        rs.getString("course_code"),
                        rs.getString("course_name"),
                        rs.getInt("credits")
                );

                ScheduleList scheduleListDO = new ScheduleList(
                        rs.getLong("schedule_id"),
                        course,
                        rs.getString("section_number"),
                        rs.getString("day_of_week"),
                        rs.getInt("start_time"),
                        rs.getInt("end_time"),
                        rs.getString("building_name"),
                        rs.getString("room_number")
                );

                scheduleList.add(scheduleListDO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return scheduleList;
    }

    @Override
    public List<ScheduleList> generateSchedule(List<String> courseCodes, List<String> sectionNumbers) {
        Map<String, ScheduleList> scheduleMap = new HashMap<>();

        String sql = "SELECT " +
                "s.schedule_id, " +
                "c.course_code, " +
                "sec.section_number, " +
                "c.course_name, " +
                "c.credits, " +
                "s.day_of_week, " +
                "s.start_time, " +
                "s.end_time, " +
                "b.building_name, " +
                "b.room_number " +
                "FROM schedules s " +
                "JOIN sections sec ON s.section_id = sec.section_id " +
                "JOIN courses c ON sec.course_id = c.course_id " +
                "JOIN buildings b ON s.building_id = b.building_id " +
                "WHERE (c.course_code, sec.section_number) IN (" + generateInClause(courseCodes.size(), 2) + ")";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            int index = 1;
            for (int i = 0; i < courseCodes.size(); i++) {
                pstmt.setString(index++, courseCodes.get(i));
                pstmt.setString(index++, sectionNumbers.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String courseCode = rs.getString("course_code");
                String sectionNumber = rs.getString("section_number");
                String courseKey = courseCode + "-" + sectionNumber;

                ScheduleList scheduleListDO = scheduleMap.get(courseKey);

                if (scheduleListDO == null) {
                    Course course = new Course(
                            courseCode,
                            rs.getString("course_name"),
                            rs.getInt("credits")
                    );

                    scheduleListDO = new ScheduleList(
                            rs.getLong("schedule_id"),
                            course,
                            sectionNumber,
                            rs.getString("day_of_week"),
                            rs.getInt("start_time"),
                            rs.getInt("end_time"),
                            rs.getString("building_name"),
                            rs.getString("room_number")
                    );

                    scheduleMap.put(courseKey, scheduleListDO);
                } else {
                    ScheduleList newSchedule = new ScheduleList(
                            rs.getLong("schedule_id"),
                            scheduleListDO.getCourse(),
                            sectionNumber,
                            rs.getString("day_of_week"),
                            rs.getInt("start_time"),
                            rs.getInt("end_time"),
                            rs.getString("building_name"),
                            rs.getString("room_number")
                    );
                    scheduleListDO.addTimetableList(newSchedule);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(scheduleMap.values());
    }

    private int getScheduleId(String courseCode, String sectionNumber) throws SQLException {
        String query = "SELECT s.schedule_id " +
                "FROM schedules s " +
                "JOIN sections sec ON s.section_id = sec.section_id " +
                "JOIN courses c ON sec.course_id = c.course_id " +
                "WHERE c.course_code = ? AND sec.section_number = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, courseCode);
            stmt.setString(2, sectionNumber);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("schedule_id");
                } else {
                    throw new SQLException("Schedule not found for courseCode: " + courseCode + " and sectionNumber: " + sectionNumber);
                }
            }
        }
    }


    private String generateInClause(int size, int paramsPerItem) {
        StringBuilder inClause = new StringBuilder();
        for (int i = 0; i < size; i++) {
            inClause.append("(");
            for (int j = 0; j < paramsPerItem; j++) {
                inClause.append("?");
                if (j < paramsPerItem - 1) {
                    inClause.append(", ");
                }
            }
            inClause.append(")");
            if (i < size - 1) {
                inClause.append(", ");
            }
        }
        return inClause.toString();
    }
}
