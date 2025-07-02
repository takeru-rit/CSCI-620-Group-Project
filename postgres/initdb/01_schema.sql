CREATE TABLE IF NOT EXISTS genders (
    id SERIAL PRIMARY KEY,
    gender_label VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS races (
    id SERIAL PRIMARY KEY,
    race_label VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS parental_education (
    id SERIAL PRIMARY KEY,
    education_level VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS schools (
    id SERIAL PRIMARY KEY,
    school_type VARCHAR(50),
    locale VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    age INT,
    grade VARCHAR(10),
    gender_id INT REFERENCES genders(id),
    race_id INT REFERENCES races(id),
    ses_quartile SMALLINT,
    parental_education_id INT REFERENCES parental_education(id),
    school_id INT REFERENCES schools(id),
    internet_access BOOLEAN,
    part_time_job BOOLEAN,
    parent_support BOOLEAN,
    romantic BOOLEAN,
    free_time SMALLINT,
    go_out SMALLINT
);

CREATE TABLE IF NOT EXISTS academic_performance (
    student_id INT PRIMARY KEY REFERENCES students(id),
    test_score_math FLOAT,
    test_score_reading FLOAT,
    test_score_science FLOAT,
    gpa FLOAT,
    attendance_rate FLOAT,
    study_hours FLOAT
);

CREATE TABLE IF NOT EXISTS extracurriculars (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    activity_name VARCHAR(100)
);