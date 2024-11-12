SELECT
    tbl.relname AS "Table",
    idx.relname AS "Index",
    idx.relkind AS "Type",
    col.attname AS "Column"
FROM
    pg_index i
JOIN pg_attribute col ON col.attrelid = i.indrelid AND col.attnum = ANY(i.indkey)
JOIN pg_class idx ON idx.oid = i.indexrelid
JOIN pg_class tbl ON tbl.oid = i.indrelid
WHERE
    tbl.relkind = 'r'
ORDER BY
    "Table", "Index";
    
