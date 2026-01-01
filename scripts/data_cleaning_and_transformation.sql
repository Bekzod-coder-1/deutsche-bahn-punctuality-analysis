-- ############################################################################
-- PROJEKT: Analyse der Pünktlichkeit der Deutschen Bahn
-- SCHRITT: Data Cleaning & Transformation (Process Phase)
-- TOOL: Google BigQuery (SQL)
-- ############################################################################

-- 1. REINIGUNG DER STAMMDATEN (train_stops)
-- Ziel: Eindeutige IDs, saubere Namen und korrekte Geodaten.
CREATE OR REPLACE TABLE `trains-db-481922.trains_and_delays.cleaned_stops` AS
SELECT DISTINCT 
    CAST(eva_nr AS INT64) AS eva_nr, 
    TRIM(station) AS station_name,
    state,
    city,
    CAST(lat AS FLOAT64) AS lat,
    CAST(long AS FLOAT64) AS long
FROM 
    `trains-db-481922.trains_and_delays.train_stops`
WHERE 
    eva_nr IS NOT NULL;

-- 2. REINIGUNG DER VERSÖTUNGSDATEN (train_delays)
-- Ziel: Zeitformate konvertieren und Verspätung in Minuten berechnen.
CREATE OR REPLACE TABLE `trains-db-481922.trains_and_delays.cleaned_delays` AS
SELECT DISTINCT
    TRIM(Hbf) AS station_name,
    train_model,
    PARSE_TIME('%H:%M', scheduled_time) AS scheduled_time,
    PARSE_TIME('%H:%M', expected_time) AS expected_time,
    -- Berechnung der Differenz in Minuten
    TIME_DIFF(PARSE_TIME('%H:%M', expected_time), PARSE_TIME('%H:%M', scheduled_time), MINUTE) AS delay_minutes,
    has_delay,
    date
FROM 
    `trains-db-481922.trains_and_delays.train_delays`
WHERE 
    Hbf IS NOT NULL 
    AND scheduled_time IS NOT NULL;

-- 3. MASTER-JOIN
-- Zusammenführung der Standortdaten mit den Verspätungswerten.
CREATE OR REPLACE TABLE `trains-db-481922.trains_and_delays.final_bahn_analysis` AS
SELECT 
    s.eva_nr,
    s.station_name,
    s.state,
    s.city,
    s.lat,
    s.long,
    d.train_model,
    d.delay_minutes,
    d.date
FROM 
    `trains-db-481922.trains_and_delays.cleaned_stops` AS s
INNER JOIN 
    `trains-db-481922.trains_and_delays.cleaned_delays` AS d
ON 
    s.station_name = d.station_name;
