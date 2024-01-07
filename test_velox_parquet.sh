CREATE SCHEMA test;
use test;

CREATE TABLE person (
    "name" varchar(25),
    "age" bigint,
    "address" row(city varchar(25), block varchar(25))
 )
 WITH (
    format = 'PARQUET'
 );

insert into person values('james', 10, ('hello', 'world'));
insert into person values('bond', 20, ('shanghai', 'world'));

set session hive.parquet_dereference_pushdown_enabled=true;

