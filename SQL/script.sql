
/* =========================================================
   DATABASE CREATION
   ========================================================= */

CREATE DATABASE bellabeat_analysis;


/* =========================================================
   TABLE CREATION
   ========================================================= */

-- Table: Daily Activity

CREATE TABLE daily_activity (
    id BIGINT,
    activitydate DATE,
    totalsteps INT,
    totaldistance FLOAT,
    tracker_distance FLOAT,
    loggedactivitiesdistance FLOAT,
    veryactivedistance FLOAT,
    moderatelyactivedistance FLOAT,
    lightlyactivedistance FLOAT,
    sedentaryactivedistance FLOAT,
    veryactiveminutes INT,
    fairlyactiveminutes INT,
    lightlyactiveminutes INT,
    sedentaryminutes INT,
    calories INT
);


-- Table: Sleep Data

CREATE TABLE sleep_day (
    id BIGINT,
    sleepday TIMESTAMP,
    totalsleeprecords INT,
    totalminutesasleep INT,
    totaltimeinbed INT
);


-- Table: Hourly Steps

CREATE TABLE hourly_steps (
    id BIGINT,
    activityhour TIMESTAMP,
    steptotal INT
);


-- Table: Hourly Calories

CREATE TABLE hourly_calories (
    id BIGINT,
    activityhour TIMESTAMP,
    calories FLOAT
);


-- Table: Hourly Intensities

CREATE TABLE hourly_intensities (
    id BIGINT,
    activityhour TIMESTAMP,
    totalintensity INT,
    averageintensity FLOAT
);


-- Table: Weight Log

CREATE TABLE weight_log (
    id BIGINT,
    date TIMESTAMP,
    weightkg FLOAT,
    weightpounds FLOAT,
    fat FLOAT,
    bmi FLOAT,
    ismanualreport BOOLEAN,
    logid BIGINT
);



/* =========================================================
   DATA VALIDATION
   ========================================================= */

-- Check number of rows in each table

SELECT COUNT(*) FROM daily_activity;
SELECT COUNT(*) FROM sleep_day;
SELECT COUNT(*) FROM hourly_steps;
SELECT COUNT(*) FROM hourly_calories;
SELECT COUNT(*) FROM hourly_intensities;
SELECT COUNT(*) FROM weight_log;



/* =========================================================
    DATA CLEANING
   ========================================================= */

-- Check duplicate activity records

SELECT id, activitydate, COUNT(*)
FROM daily_activity
GROUP BY id, activitydate
HAVING COUNT(*) > 1;


-- Check for missing step values

SELECT *
FROM daily_activity
WHERE totalsteps IS NULL;


-- Check users with zero steps (possible inactivity)

SELECT *
FROM daily_activity
WHERE totalsteps = 0;


/* =========================================================
   QUERY 1: TOTAL NUMBER OF USERS
   ========================================================= */

SELECT COUNT(DISTINCT id) AS total_users
FROM daily_activity;


/* =========================================================
   QUERY 2: AVERAGE DAILY STEPS
   ========================================================= */

SELECT ROUND(AVG(totalsteps),2) AS avg_daily_steps
FROM daily_activity;


/* =========================================================
   QUERY 3: AVERAGE CALORIES BURNED
   ========================================================= */

SELECT ROUND(AVG(calories),2) AS avg_calories
FROM daily_activity;


/* =========================================================
   QUERY 4: ACTIVITY MINUTES DISTRIBUTION
   ========================================================= */

SELECT
ROUND(AVG(veryactiveminutes),2) AS very_active_minutes,
ROUND(AVG(fairlyactiveminutes),2) AS fairly_active_minutes,
ROUND(AVG(lightlyactiveminutes),2) AS lightly_active_minutes,
ROUND(AVG(sedentaryminutes),2) AS sedentary_minutes
FROM daily_activity;


/* =========================================================
   QUERY 5: TOP 10 MOST ACTIVE USERS
   ========================================================= */

SELECT
id,
AVG(totalsteps) AS avg_steps
FROM daily_activity
GROUP BY id
ORDER BY avg_steps DESC
LIMIT 10;


/* =========================================================
   QUERY 6: TOP 10 LEAST ACTIVE USERS
   ========================================================= */

SELECT
id,
AVG(totalsteps) AS avg_steps
FROM daily_activity
GROUP BY id
ORDER BY avg_steps ASC
LIMIT 10;


/* =========================================================
   QUERY 7: DAILY ACTIVITY TREND
   ========================================================= */

SELECT
activitydate,
AVG(totalsteps) AS avg_steps
FROM daily_activity
GROUP BY activitydate
ORDER BY activitydate;


/* =========================================================
   QUERY 8: STEPS VS CALORIES RELATIONSHIP
   ========================================================= */

SELECT
totalsteps,
calories
FROM daily_activity
ORDER BY totalsteps DESC;


/* =========================================================
   QUERY 9: AVERAGE SLEEP DURATION
   ========================================================= */

SELECT
ROUND(AVG(totalminutesasleep)/60,2) AS avg_sleep_hours
FROM sleep_day;


/* =========================================================
   QUERY 10: SLEEP VS ACTIVITY ANALYSIS
   ========================================================= */

SELECT
a.id,
AVG(a.totalsteps) AS avg_steps,
AVG(s.totalminutesasleep) AS avg_sleep_minutes
FROM daily_activity a
JOIN sleep_day s
ON a.id = s.id
GROUP BY a.id
ORDER BY avg_steps DESC;


/* =========================================================
   QUERY 11: MOST ACTIVE HOURS OF THE DAY
   ========================================================= */

SELECT
EXTRACT(HOUR FROM activityhour) AS hour,
AVG(steptotal) AS avg_steps
FROM hourly_steps
GROUP BY hour
ORDER BY avg_steps DESC;


/* =========================================================
   QUERY 12: HOURLY CALORIE BURN PATTERN
   ========================================================= */

SELECT
EXTRACT(HOUR FROM activityhour) AS hour,
AVG(calories) AS avg_calories
FROM hourly_calories
GROUP BY hour
ORDER BY hour;


/* =========================================================
   QUERY 13: USER ACTIVITY CATEGORY
   ========================================================= */

SELECT
CASE
WHEN totalsteps < 5000 THEN 'Sedentary'
WHEN totalsteps BETWEEN 5000 AND 9999 THEN 'Moderately Active'
WHEN totalsteps >= 10000 THEN 'Active'
END AS activity_level,
COUNT(*) AS user_days
FROM daily_activity
GROUP BY activity_level;


/* =========================================================
   QUERY 14: AVERAGE BMI
   ========================================================= */

SELECT
ROUND(AVG(bmi),2) AS avg_bmi
FROM weight_log;


/* =========================================================
   QUERY 15: STEPS VS ACTIVITY MINUTES
   ========================================================= */

SELECT
totalsteps,
veryactiveminutes,
fairlyactiveminutes,
lightlyactiveminutes
FROM daily_activity
ORDER BY totalsteps DESC;