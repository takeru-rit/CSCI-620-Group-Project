-- Populate lookup tables
INSERT INTO genders (gender_label)
SELECT DISTINCT gender FROM staging_students
WHERE gender IS NOT NULL AND gender <> ''
ON CONFLICT DO NOTHING;

INSERT INTO races (race_label)
SELECT DISTINCT race FROM staging_students
WHERE race IS NOT NULL AND race <> ''
ON CONFLICT DO NOTHING;

INSERT INTO parental_education (education_level)
SELECT DISTINCT parental_education FROM staging_students
WHERE parental_education IS NOT NULL AND parental_education <> ''
ON CONFLICT DO NOTHING;

INSERT INTO schools (school_type, locale)
SELECT DISTINCT school_type, locale FROM staging_students
WHERE school_type IS NOT NULL AND school_type <> '' AND locale IS NOT NULL AND locale <> ''
ON CONFLICT DO NOTHING;

-- Insert students
WITH numbered_staging AS (
  SELECT *, ROW_NUMBER() OVER () AS rn FROM staging_students
)
INSERT INTO students (
    age, grade, gender_id, race_id, ses_quartile, parental_education_id, school_id,
    internet_access, part_time_job, parent_support, romantic, free_time, go_out
)
SELECT
    s.age,
    s.grade,
    g.id,
    r.id,
    s.ses_quartile,
    p.id,
    sc.id,
    s.internet_access,
    s.part_time_job,
    s.parent_support,
    s.romantic,
    s.free_time,
    s.go_out
FROM numbered_staging s
JOIN genders g ON s.gender = g.gender_label
JOIN races r ON s.race = r.race_label
JOIN parental_education p ON s.parental_education = p.education_level
JOIN schools sc ON s.school_type = sc.school_type AND s.locale = sc.locale
;

-- Insert academic performance
WITH numbered_staging AS (
  SELECT *, ROW_NUMBER() OVER () AS rn FROM staging_students
),
numbered_students AS (
  SELECT id, ROW_NUMBER() OVER () AS rn FROM students
)
INSERT INTO academic_performance (
    student_id, test_score_math, test_score_reading, test_score_science, gpa, attendance_rate, study_hours
)
SELECT
    st.id,
    s.test_score_math,
    s.test_score_reading,
    s.test_score_science,
    s.gpa,
    s.attendance_rate,
    s.study_hours
FROM numbered_staging s
JOIN numbered_students st ON s.rn = st.rn
;

-- Insert extracurriculars
WITH numbered_staging AS (
  SELECT *, ROW_NUMBER() OVER () AS rn FROM staging_students
),
numbered_students AS (
  SELECT id, ROW_NUMBER() OVER () AS rn FROM students
)
INSERT INTO extracurriculars (student_id, activity_name)
SELECT
    st.id,
    s.extracurricular
FROM numbered_staging s
JOIN numbered_students st ON s.rn = st.rn
WHERE s.extracurricular IS NOT NULL AND s.extracurricular <> ''
;

-- Drop the staging table
DROP TABLE IF EXISTS staging_students;