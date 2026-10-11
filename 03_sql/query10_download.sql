.headers on
.mode line
SELECT d.id, d.target_path, d.received_bytes, d.total_bytes, d.state,
       d.referrer, d.tab_url,
       datetime(d.start_time/1000000 + strftime('%s','1601-01-01'),'unixepoch') AS start_utc,
       datetime(d.end_time/1000000   + strftime('%s','1601-01-01'),'unixepoch') AS end_utc,
       d.last_modified, d.mime_type, d.opened,
       c.chain_index, c.url AS chain_url
FROM downloads d LEFT JOIN downloads_url_chains c ON c.id = d.id;
