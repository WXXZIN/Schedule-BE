package com.android.schedule.util;

import java.util.*;

import com.android.schedule.domain.ScheduleList;

public class ScheduleOptimizer {

    public static List<List<ScheduleList>> optimizeSchedule(List<ScheduleList> scheduleList, int numCourses) {
        List<List<ScheduleList>> validCombinations = new ArrayList<>();

        generateValidCombinations(scheduleList, 0, new ArrayList<>(), validCombinations, numCourses);

        return validCombinations.isEmpty() ? new ArrayList<>() : validCombinations.subList(0, Math.min(5, validCombinations.size()));
    }

    private static void generateValidCombinations(List<ScheduleList> scheduleList, int index, List<ScheduleList> currentCombination, List<List<ScheduleList>> validCombinations, int numCourses) {
        if (currentCombination.size() == numCourses) {
            if (isValidCombination(currentCombination)) {
                validCombinations.add(new ArrayList<>(currentCombination));

                if (validCombinations.size() >= 5) {
                    return;
                }
            }
            return;
        }

        if (index == scheduleList.size()) {
            return;
        }

        ScheduleList currentScheduleList = scheduleList.get(index);
        currentCombination.add(currentScheduleList);
        generateValidCombinations(scheduleList, index + 1, currentCombination, validCombinations, numCourses);
        currentCombination.remove(currentCombination.size() - 1);

        generateValidCombinations(scheduleList, index + 1, currentCombination, validCombinations, numCourses);
    }

    public static boolean isValidCombination(List<ScheduleList> combination) {
        Set<String> courseCodeList = new HashSet<>();

        for (ScheduleList scheduleList : combination) {
            String courseKey = scheduleList.getCourse().getCourseCode();

            if (courseCodeList.contains(courseKey)) {
                return false;
            } else {
                courseCodeList.add(courseKey);
            }

            for (ScheduleList other : combination) {
                if (scheduleList != other && isTimeConflict(scheduleList, other)) {
                    return false;
                }
            }
        }
        return true;
    }

    private static boolean isTimeConflict(ScheduleList t1, ScheduleList t2) {
        for (int i = 0; i < t1.getDayOfWeekList().size(); i++) {
            for (int j = 0; j < t2.getDayOfWeekList().size(); j++) {
                if (t1.getDayOfWeekList().get(i).equals(t2.getDayOfWeekList().get(j))) {
                    if (t1.getStartTimeList().get(i) <= t2.getEndTimeList().get(j)
                            && t1.getEndTimeList().get(i) >= t2.getStartTimeList().get(j)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
