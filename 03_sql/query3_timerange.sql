.headers on
.mode column
SELECT datetime(MIN(visit_time)/1000000 + strftime('%s','1601-01-01'),'unixepoch') AS first_utc,
       datetime(MAX(visit_time)/1000000 + strftime('%s','1601-01-01'),'unixepoch') AS last_utc,
       COUNT(*) AS total_visits
FROM visits;
