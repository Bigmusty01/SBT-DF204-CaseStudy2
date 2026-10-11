.headers on
.mode column
SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;
PRAGMA table_info(urls);
PRAGMA table_info(visits);
PRAGMA table_info(downloads);
PRAGMA table_info(downloads_url_chains);
PRAGMA integrity_check;
