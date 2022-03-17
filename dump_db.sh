#!/bin/bash
docker exec -it postgres_cdr /usr/bin/pg_dump --username=postgres cdr > ./sql/cdr.sql
docker exec -it postgres_cdr /usr/bin/pg_dump --username=postgres cdr_sys > ./sql/cdr_sys.sql
