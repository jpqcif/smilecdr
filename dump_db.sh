#!/bin/bash
cd /home/ubuntu/smilecdr_repo
docker exec -it postgres_cdr /usr/bin/pg_dump --username=postgres cdr > /home/ubuntu/smilecdr_repo/sql/cdr.sql
docker exec -it postgres_cdr /usr/bin/pg_dump --username=postgres cdr_sys > /home/ubuntu/smilecdr_repo/sql/cdr_sys.sql
