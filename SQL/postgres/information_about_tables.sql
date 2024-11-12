SELECT
  relname AS "Table Name",
  pg_size_pretty(pg_relation_size(C.oid)) AS "Size",
  reltuples AS "Rows"
FROM pg_class C
LEFT JOIN pg_namespace N ON N.oid = C.relnamespace
WHERE C.relkind = 'r'
  AND N.nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY C.relname;
