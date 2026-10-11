.headers on
.mode column
SELECT v.id AS visit, v.from_visit AS from_v, v.opener_visit AS opener,
       printf('0x%08X', v.transition & 4294967295) AS hex,
       (v.transition & 255) AS base,
       substr(u.url,1,50) AS url,
       substr(pu.url,1,35) AS came_from
FROM visits v
JOIN urls u ON v.url = u.id
LEFT JOIN visits pv ON v.from_visit = pv.id
LEFT JOIN urls pu ON pv.url = pu.id
ORDER BY v.visit_time, v.id;
