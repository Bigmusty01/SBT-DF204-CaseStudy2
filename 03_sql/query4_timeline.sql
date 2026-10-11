.headers on
.mode csv
.output 05_notes/visits_timeline.csv
SELECT v.id AS visit_id, u.id AS url_id,
       datetime(v.visit_time/1000000 + strftime('%s','1601-01-01'),'unixepoch') AS visit_utc,
       v.from_visit, v.opener_visit, v.transition, (v.transition & 255) AS base_type,
       v.visit_duration/1000.0 AS duration_ms, u.title, u.url
FROM visits v JOIN urls u ON v.url = u.id
ORDER BY v.visit_time, v.id;
.output stdout
