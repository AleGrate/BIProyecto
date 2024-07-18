FROM postgres:16.0

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD sys64738
ENV POSTGRES_DB Proyecto_BI

EXPOSE 5432

COPY INITIAL_LOAD/01_SETUP.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/02_PAIS.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/03_CIUDAD.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/04_SUCURSAL.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/05_CLIENTE.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/06_EVALUACION_SERVICIO.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/07_TIPO_PRODUCTO.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/08_PRODUCTO.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/09_RECOMIENDA.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/10_CONTRATO.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/11_REGISTRO_CONTRATO.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/12_REGISTRO_SINIESTRO.sql /docker-entrypoint-initdb.d/
COPY INITIAL_LOAD/13_SINIESTRO.sql /docker-entrypoint-initdb.d/