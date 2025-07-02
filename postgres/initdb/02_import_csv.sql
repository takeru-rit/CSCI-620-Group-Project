CREATE TABLE IF NOT EXISTS staging_students (
    age INT,
    grade VARCHAR(10),
    gender VARCHAR(50),
    race VARCHAR(100),
    ses_quartile SMALLINT,
    parental_education VARCHAR(100),
    school_type VARCHAR(50),
    locale VARCHAR(50),
    test_score_math FLOAT,
    test_score_reading FLOAT,
    test_score_science FLOAT,
    gpa FLOAT,
    attendance_rate FLOAT,
    study_hours FLOAT,
    internet_access BOOLEAN,
    extracurricular VARCHAR(100),
    part_time_job BOOLEAN,
    parent_support BOOLEAN,
    romantic BOOLEAN,
    free_time SMALLINT,
    go_out SMALLINT
);

-- Import the CSV into the staging table
COPY staging_students FROM '/docker-entrypoint-initdb.d/synthetic.csv' DELIMITER ',' CSV HEADER;