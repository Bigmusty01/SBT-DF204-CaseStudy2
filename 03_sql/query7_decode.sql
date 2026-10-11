.headers on
.mode column
SELECT printf('0x%08X', transition & 4294967295) AS hex,
       (transition & 255) AS base,
       CASE transition & 255 WHEN 0 THEN 'LINK' WHEN 1 THEN 'TYPED'
            WHEN 5 THEN 'GENERATED' WHEN 7 THEN 'FORM_SUBMIT' ELSE 'OTHER' END AS base_name,
       (transition & 33554432)   > 0 AS addr_bar,
       (transition & 268435456)  > 0 AS chain_start,
       (transition & 536870912)  > 0 AS chain_end,
       (transition & 1073741824) > 0 AS client_redir,
       (transition & 2147483648) > 0 AS server_redir,
       COUNT(*) AS n
FROM visits GROUP BY transition ORDER BY MIN(id);
