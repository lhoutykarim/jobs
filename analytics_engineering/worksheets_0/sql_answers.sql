-- create table and csv upload

CREATE TABLE IF NOT EXISTS raw_payloads
(
    payloads character(100000)

);




COPY raw_payloads  FROM '/Users/lhoutykarim/Documents/GitHub/jobs/analytics_engineering/data/tracking_payloads_20210603.csv' WITH (FORMAT csv);


-- pour eliminer le header qui s'introduit en ligne

create table raw_payloads_bis as select * from raw_payloads order by payloads desc limit 475;

  -- scrap

  SELECT payloads::json->'action_id' as action_id,
       payloads::json->'anonymous_id' as anonymous_id,
       payloads::json->'timestamp' as timestamp,
       payloads::json->'url' as url
FROM raw_payloads_bis;
