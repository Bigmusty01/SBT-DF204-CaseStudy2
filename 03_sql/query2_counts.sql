.headers on
.mode column
SELECT 'urls' AS tbl, COUNT(*) AS rows FROM urls
UNION ALL SELECT 'visits', COUNT(*) FROM visits
UNION ALL SELECT 'downloads', COUNT(*) FROM downloads
UNION ALL SELECT 'downloads_url_chains', COUNT(*) FROM downloads_url_chains
UNION ALL SELECT 'keyword_search_terms', COUNT(*) FROM keyword_search_terms;
