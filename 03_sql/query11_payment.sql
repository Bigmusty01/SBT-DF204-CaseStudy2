.headers on
.mode column
SELECT v.id AS visit, u.id AS url_id,
       datetime(v.visit_time/1000000 + strftime('%s','1601-01-01'),'unixepoch') AS utc,
       v.from_visit AS from_v, v.opener_visit AS opener,
       (v.transition & 255) AS base,
       round(v.visit_duration/1000000.0, 1) AS secs,
       substr(u.title,1,62) AS title
FROM visits v JOIN urls u ON v.url = u.id
WHERE v.id BETWEEN 51 AND 74
ORDER BY v.visit_time, v.id;
