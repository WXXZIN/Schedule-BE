CREATE TABLE IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    parent_dept_id INT NULL,
    FOREIGN KEY (parent_dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS students (
    student_number VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    grade INT NOT NULL,
    FOREIGN KEY (student_number) REFERENCES users(student_number),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE IF NOT EXISTS buildings (
    building_id INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(100) NOT NULL,
    room_number VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    credits INT NOT NULL,
    semester VARCHAR(7) NOT NULL,
    target_year ENUM('1', '2', '3', '4') NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE IF NOT EXISTS sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    section_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE IF NOT EXISTS schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    section_id INT,
    day_of_week ENUM('Mon', 'Tue', 'Wed', 'Thu', 'Fri') NOT NULL,
    start_time INT NOT NULL,
    end_time INT NOT NULL,
    building_id INT,
    FOREIGN KEY (section_id) REFERENCES sections(section_id),
    FOREIGN KEY (building_id) REFERENCES buildings(building_id)
);

CREATE TABLE IF NOT EXISTS personal_schedules (
    personal_schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(20),
    schedule_id INT,
    FOREIGN KEY (student_number) REFERENCES students(student_number),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id),
    UNIQUE (student_number, schedule_id)
);