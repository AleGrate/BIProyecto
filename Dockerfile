FROM postgres:16.0

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD sys64738
ENV POSTGRES_DB haccdb

EXPOSE 5432

COPY INITIAL_LOAD/01_SETUP_HACCSEC.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/02_SETUP_HACC.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/03_ALTER_HACC.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/04_INSERT_HACC.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/05_REPORT_HACC.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/06_DASHBOARD2_HACC.sql /docker-entrypoint-initdb.d/