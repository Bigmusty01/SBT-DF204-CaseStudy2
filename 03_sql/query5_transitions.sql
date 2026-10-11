.headers on
.mode column
SELECT transition,
       printf('0x%08X', transition & 4294967295) AS hex,
       (transition & 255) AS base_type,
       COUNT(*) AS n,
       GROUP_CONCAT(id) AS visit_ids
FROM visits GROUP BY transition ORDER BY MIN(id);
