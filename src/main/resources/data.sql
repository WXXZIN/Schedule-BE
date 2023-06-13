INSERT INTO departments (dept_id, dept_name, parent_dept_id)
SELECT 1, '공학대학', NULL
WHERE NOT EXISTS (SELECT 1 FROM departments WHERE dept_id = 1);

INSERT INTO departments (dept_id, dept_name, parent_dept_id)
SELECT 2, '컴퓨터공학부', 1
WHERE NOT EXISTS (SELECT 1 FROM departments WHERE dept_id = 2);

INSERT INTO departments (dept_id, dept_name, parent_dept_id)
SELECT 3, '자동차공학과', 1
WHERE NOT EXISTS (SELECT 1 FROM departments WHERE dept_id = 3);

INSERT INTO departments (dept_id, dept_name, parent_dept_id)
SELECT 4, '전기전자공학과', 1
WHERE NOT EXISTS (SELECT 1 FROM departments WHERE dept_id = 4);

INSERT INTO departments (dept_id, dept_name, parent_dept_id)
SELECT 5, '기계공학과', 1
WHERE NOT EXISTS (SELECT 1 FROM departments WHERE dept_id = 5);

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '110'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '110');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '113'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '113');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '424'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '424');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '425'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '425');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '440-2'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '440-2');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '442'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '442');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '443'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '443');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '444'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '444');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '445'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '445');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '550'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '550');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '533'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '533');

INSERT INTO buildings (building_name, room_number)
SELECT '국제관', '552'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '국제관' AND room_number = '552');

INSERT INTO buildings (building_name, room_number)
SELECT '종합관', '212'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '종합관' AND room_number = '212');

INSERT INTO buildings (building_name, room_number)
SELECT '종합관', '316'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '종합관' AND room_number = '316');

INSERT INTO buildings (building_name, room_number)
SELECT '종합관', '317'
WHERE NOT EXISTS (SELECT 1 FROM buildings WHERE building_name = '종합관' AND room_number = '317');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '44958', '컴퓨터공학개론', 1, 3, '2023-1', '1'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '44958');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5H479', 'S/W프로그래밍사고', 2, 3, '2023-1', '1'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5H479');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5F727', '웹제작', 2, 3, '2023-1', '1'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5F727');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '21355', '글로벌직업탐구', 1, 2, '2023-1', '1'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '21355');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '10306', '공학적글쓰기', 1, 2, '2023-1', '1'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '10306');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '10292', 'SEP I', 1, 3, '2023-1', '1'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '10292');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '44968', '공업수학', 1, 3, '2023-1', '2'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '44968');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '45543', '컴퓨터구조', 2, 3, '2023-1', '2'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '45543');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5A255', '시스템운영', 2, 3, '2023-1', '2'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5A255');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5D576', 'JAVA프로그래밍 I', 2, 3, '2023-1', '2'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5D576');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5F708', 'C#프로그래밍', 2, 3, '2023-1', '2'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5F708');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '10308', '화랑인문강좌', 1, 2, '2023-1', '2'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '10308');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '44983', '임베디드시스템', 2, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '44983');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '44332', '데이터베이스', 2, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '44332');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '45055', '웹프로그래밍', 2, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '45055');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5F709', '네트워크', 2, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5F709');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5F710', '모바일프로그래밍', 2, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5F710');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5G540', '알고리즘', 2, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5G540');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '21358', '기술트렌드세미나', 1, 3, '2023-1', '3'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '21358');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '46118', 'Lab-scale', 1, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '46118');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5D968', '정보처리특강 I', 2, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5D968');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '5F712', '인공지능', 2, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '5F712');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '45062', 'IoT통신과보안', 7, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '45062');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '45063', 'IoT서비스시스템', 7, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '45063');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '45064', '빅데이터분석', 6, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '45064');

INSERT INTO courses (course_code, course_name, dept_id, credits, semester, target_year)
SELECT '45065', '클라우드가상화', 6, 3, '2023-1', '4'
WHERE NOT EXISTS (SELECT 1 FROM courses WHERE course_code = '45065');

INSERT INTO sections (course_id, section_number)
SELECT 1, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 1 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 2, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 2 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 2, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 2 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 3, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 3 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 3, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 3 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 4, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 4 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 5, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 5 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 6, '03'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 6 AND section_number = '03');

INSERT INTO sections (course_id, section_number)
SELECT 7, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 7 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 8, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 8 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 9, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 9 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 9, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 9 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 10, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 10 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 10, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 10 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 11, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 11 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 11, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 11 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 12, '03'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 12 AND section_number = '03');

INSERT INTO sections (course_id, section_number)
SELECT 12, '04'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 12 AND section_number = '04');

INSERT INTO sections (course_id, section_number)
SELECT 13, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 13 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 13, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 13 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 14, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 14 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 14, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 14 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 15, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 15 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 15, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 15 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 16, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 16 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 17, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 17 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 17, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 17 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 18, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 18 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 18, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 18 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 19, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 19 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 20, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 20 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 20, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 20 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 21, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 21 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 21, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 21 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 22, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 22 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 22, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 22 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 23, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 23 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 24, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 24 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 25, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 25 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 25, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 25 AND section_number = '02');

INSERT INTO sections (course_id, section_number)
SELECT 26, '01'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 26 AND section_number = '01');

INSERT INTO sections (course_id, section_number)
SELECT 26, '02'
WHERE NOT EXISTS (SELECT 1 FROM sections WHERE course_id = 26 AND section_number = '02');

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 1, 'Mon', 2, 3, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 1 AND day_of_week = 'Mon' AND start_time = 2 AND end_time = 3 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 1, 'Wed', 4, 4, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 1 AND day_of_week = 'Wed' AND start_time = 4 AND end_time = 4 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 2, 'Tue', 1, 2, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 2 AND day_of_week = 'Tue' AND start_time = 1 AND end_time = 2 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 2, 'Wed', 1, 2, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 2 AND day_of_week = 'Wed' AND start_time = 1 AND end_time = 2 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 3, 'Tue', 3, 4, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 3 AND day_of_week = 'Tue' AND start_time = 3 AND end_time = 4 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 3, 'Wed', 5, 6, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 3 AND day_of_week = 'Wed' AND start_time = 5 AND end_time = 6 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 4, 'Mon', 5, 6, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 4 AND day_of_week = 'Mon' AND start_time = 5 AND end_time = 6 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 4, 'Fri', 7, 8, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 4 AND day_of_week = 'Fri' AND start_time = 7 AND end_time = 8 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 5, 'Mon', 7, 8, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 5 AND day_of_week = 'Mon' AND start_time = 7 AND end_time = 8 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 5, 'Fri', 5, 6, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 5 AND day_of_week = 'Fri' AND start_time = 5 AND end_time = 6 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 6, 'Tue', 5, 6, 4
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 6 AND day_of_week = 'Tue' AND start_time = 5 AND end_time = 6 AND building_id = 4);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 7, 'Thu', 1, 2, 13
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 7 AND day_of_week = 'Thu' AND start_time = 1 AND end_time = 2 AND building_id = 13);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 8, 'Wed', 7, 8, 1
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 8 AND day_of_week = 'Wed' AND start_time = 7 AND end_time = 8 AND building_id = 1);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 8, 'Fri', 3, 4, 2
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 8 AND day_of_week = 'Fri' AND start_time = 3 AND end_time = 4 AND building_id = 2);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 9, 'Fri', 6, 8, 11
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 9 AND day_of_week = 'Fri' AND start_time = 6 AND end_time = 8 AND building_id = 11);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 10, 'Mon', 7, 8, 5
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 10 AND day_of_week = 'Mon' AND start_time = 7 AND end_time = 8 AND building_id = 5);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 10, 'Wed', 1, 1, 5
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 10 AND day_of_week = 'Wed' AND start_time = 1 AND end_time = 1 AND building_id = 5);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 11, 'Mon', 3, 4, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 11 AND day_of_week = 'Mon' AND start_time = 3 AND end_time = 4 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 11, 'Fri', 3, 4, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 11 AND day_of_week = 'Fri' AND start_time = 3 AND end_time = 4 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 12, 'Tue', 9, 10, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 12 AND day_of_week = 'Tue' AND start_time = 9 AND end_time = 10 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 12, 'Wed', 3, 4, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 12 AND day_of_week = 'Wed' AND start_time = 3 AND end_time = 4 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 13, 'Tue', 5, 6, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 13 AND day_of_week = 'Tue' AND start_time = 5 AND end_time = 6 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 13, 'Tue', 7, 8, 10
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 13 AND day_of_week = 'Tue' AND start_time = 7 AND end_time = 8 AND building_id = 10);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 14, 'Tue', 5, 6, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 14 AND day_of_week = 'Tue' AND start_time = 5 AND end_time = 6 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 14, 'Tue', 7, 8, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 14 AND day_of_week = 'Tue' AND start_time = 7 AND end_time = 8 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 15, 'Mon', 5, 6, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 15 AND day_of_week = 'Mon' AND start_time = 5 AND end_time = 6 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 15, 'Fri', 1, 2, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 15 AND day_of_week = 'Fri' AND start_time = 1 AND end_time = 2 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 16, 'Tue', 1, 2, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 16 AND day_of_week = 'Tue' AND start_time = 1 AND end_time = 2 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 16, 'Thu', 2, 3, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 16 AND day_of_week = 'Thu' AND start_time = 2 AND end_time = 3 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 17, 'Wed', 7, 8, 14
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 17 AND day_of_week = 'Wed' AND start_time = 7 AND end_time = 8 AND building_id = 14);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 18, 'Wed', 7, 8, 15
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 18 AND day_of_week = 'Wed' AND start_time = 7 AND end_time = 8 AND building_id = 15);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 19, 'Mon', 5, 6, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 19 AND day_of_week = 'Mon' AND start_time = 5 AND end_time = 6 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 19, 'Wed', 1, 2, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 19 AND day_of_week = 'Wed' AND start_time = 1 AND end_time = 2 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 20, 'Tue', 6, 7, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 20 AND day_of_week = 'Tue' AND start_time = 6 AND end_time = 7 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 20, 'Thu', 3, 4, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 20 AND day_of_week = 'Thu' AND start_time = 3 AND end_time = 4 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 21, 'Mon', 2, 3, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 21 AND day_of_week = 'Mon' AND start_time = 2 AND end_time = 3 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 21, 'Tue', 1, 2, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 21 AND day_of_week = 'Tue' AND start_time = 1 AND end_time = 2 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 22, 'Mon', 2, 3, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 22 AND day_of_week = 'Mon' AND start_time = 2 AND end_time = 3 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 22, 'Tue', 1, 2, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 22 AND day_of_week = 'Tue' AND start_time = 1 AND end_time = 2 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 23, 'Mon', 8, 9, 8
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 23 AND day_of_week = 'Mon' AND start_time = 8 AND end_time = 9 AND building_id = 8);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 23, 'Wed', 3, 4, 8
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 23 AND day_of_week = 'Wed' AND start_time = 3 AND end_time = 4 AND building_id = 8);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 24, 'Tue', 3, 4, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 24 AND day_of_week = 'Tue' AND start_time = 3 AND end_time = 4 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 24, 'Thu', 6, 7, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 24 AND day_of_week = 'Thu' AND start_time = 6 AND end_time = 7 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 25, 'Mon', 7, 7, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 25 AND day_of_week = 'Mon' AND start_time = 7 AND end_time = 7 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 25, 'Tue', 8, 9, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 25 AND day_of_week = 'Tue' AND start_time = 8 AND end_time = 9 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 26, 'Tue', 3, 4, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 26 AND day_of_week = 'Tue' AND start_time = 3 AND end_time = 4 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 26, 'Thu', 4, 5, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 26 AND day_of_week = 'Thu' AND start_time = 4 AND end_time = 5 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 27, 'Mon', 8, 9, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 27 AND day_of_week = 'Mon' AND start_time = 8 AND end_time = 9 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 27, 'Fri', 6, 7, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 27 AND day_of_week = 'Fri' AND start_time = 6 AND end_time = 7 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 28, 'Wed', 6, 7, 11
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 28 AND day_of_week = 'Wed' AND start_time = 6 AND end_time = 7 AND building_id = 11);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 28, 'Thu', 6, 6, 12
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 28 AND day_of_week = 'Thu' AND start_time = 6 AND end_time = 6 AND building_id = 12);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 29, 'Mon', 5, 6, 11
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 29 AND day_of_week = 'Mon' AND start_time = 5 AND end_time = 6 AND building_id = 11);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 29, 'Tue', 8, 8, 11
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 29 AND day_of_week = 'Tue' AND start_time = 8 AND end_time = 8 AND building_id = 11);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 30, 'Fri', 2, 4, 3
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 30 AND day_of_week = 'Fri' AND start_time = 2 AND end_time = 4 AND building_id = 3);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 31, 'Wed', 6, 8, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 31 AND day_of_week = 'Wed' AND start_time = 6 AND end_time = 8 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 32, 'Fri', 1, 3, 9
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 32 AND day_of_week = 'Fri' AND start_time = 1 AND end_time = 3 AND building_id = 9);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 33, 'Wed', 8, 10, 5
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 33 AND day_of_week = 'Wed' AND start_time = 8 AND end_time = 10 AND building_id = 5);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 34, 'Mon', 4, 4, 5
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 34 AND day_of_week = 'Mon' AND start_time = 4 AND end_time = 4 AND building_id = 5);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 34, 'Thu', 6, 7, 5
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 34 AND day_of_week = 'Thu' AND start_time = 6 AND end_time = 7 AND building_id = 5);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 35, 'Tue', 3, 4, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 35 AND day_of_week = 'Tue' AND start_time = 3 AND end_time = 4 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 35, 'Wed', 6, 7, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 35 AND day_of_week = 'Wed' AND start_time = 6 AND end_time = 7 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 36, 'Mon', 2, 3, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 36 AND day_of_week = 'Mon' AND start_time = 2 AND end_time = 3 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 36, 'Tue', 8, 9, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 36 AND day_of_week = 'Tue' AND start_time = 8 AND end_time = 9 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 37, 'Mon', 9, 9, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 37 AND day_of_week = 'Mon' AND start_time = 9 AND end_time = 9 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 37, 'Tue', 6, 7, 6
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 37 AND day_of_week = 'Tue' AND start_time = 6 AND end_time = 7 AND building_id = 6);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 38, 'Mon', 6, 6, 8
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 38 AND day_of_week = 'Mon' AND start_time = 6 AND end_time = 6 AND building_id = 8);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 38, 'Thu', 1, 2, 8
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 38 AND day_of_week = 'Thu' AND start_time = 1 AND end_time = 2 AND building_id = 8);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 39, 'Wed', 3, 4, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 39 AND day_of_week = 'Wed' AND start_time = 3 AND end_time = 4 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 39, 'Thu', 1, 2, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 39 AND day_of_week = 'Thu' AND start_time = 1 AND end_time = 2 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 40, 'Wed', 1, 2, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 40 AND day_of_week = 'Wed' AND start_time = 1 AND end_time = 2 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 40, 'Thu', 3, 4, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 40 AND day_of_week = 'Thu' AND start_time = 3 AND end_time = 4 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 41, 'Mon', 5, 5, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 41 AND day_of_week = 'Mon' AND start_time = 5 AND end_time = 5 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 41, 'Tue', 6, 7, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 41 AND day_of_week = 'Tue' AND start_time = 6 AND end_time = 7 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 42, 'Mon', 6, 7, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 42 AND day_of_week = 'Mon' AND start_time = 6 AND end_time = 7 AND building_id = 7);

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, building_id)
SELECT 42, 'Tue', 5, 5, 7
WHERE NOT EXISTS (SELECT 1 FROM schedules WHERE section_id = 42 AND day_of_week = 'Tue' AND start_time = 5 AND end_time = 5 AND building_id = 7);