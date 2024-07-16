DROP SCHEMA IF EXISTS SEGURO_G26473471 CASCADE;

CREATE SCHEMA SEGURO_G26473471;

-- Create PRODUCTO table
CREATE TABLE PAIS (
  cod_pais INTEGER,
  nb_pais VARCHAR(255),
  CONSTRAINT pk_pais PRIMARY KEY (cod_pais)
);

CREATE TABLE CIUDAD (
  cod_ciudad INTEGER,
  nb_ciudad VARCHAR(255),
  cod_pais INTEGER,
  CONSTRAINT pk_ciudad PRIMARY KEY (cod_ciudad),
  CONSTRAINT fk_ciudad_pais FOREIGN KEY (cod_pais) REFERENCES PAIS (cod_pais)
);

CREATE TABLE SUCURSAL (
  cod_sucursal INTEGER,
  nb_sucursal VARCHAR(255),
  cod_ciudad INTEGER,
  CONSTRAINT pk_sucursal PRIMARY KEY (cod_sucursal),
  CONSTRAINT fk_sucursal_ciudad FOREIGN KEY (cod_ciudad) REFERENCES CIUDAD (cod_ciudad)
);

CREATE TABLE TIPO_PRODUCTO (
  cod_tipo_producto INTEGER,
  nb_tipo_producto VARCHAR(255),
  CONSTRAINT pk_tipo_producto PRIMARY KEY (cod_tipo_producto)
);

CREATE TABLE PRODUCTO (
  cod_producto INTEGER,
  nb_producto VARCHAR(255),
  descripcion TEXT,
  cod_tipo_producto INTEGER,
  calificacion INTEGER,
  CONSTRAINT pk_producto PRIMARY KEY (cod_producto),
  CONSTRAINT fk_producto_tipo_producto FOREIGN KEY (cod_tipo_producto) REFERENCES TIPO_PRODUCTO (cod_tipo_producto)
);

CREATE TABLE CLIENTE (
  cod_cliente INTEGER,
  nb_cliente VARCHAR(255),
  ci_rif VARCHAR(255),
  telefono VARCHAR(255),
  direccion TEXT,
  sexo CHAR(1),
  email VARCHAR(255),
  cod_sucursal INTEGER,
  CONSTRAINT pk_cliente PRIMARY KEY (cod_cliente),
  CONSTRAINT fk_cliente_sucursal FOREIGN KEY (cod_sucursal) REFERENCES SUCURSAL (cod_sucursal)
);

CREATE TABLE EVALUACION_SERVICIO (
  cod_evaluacion_servicio INTEGER,
  nb_descripcion VARCHAR(255),
  CONSTRAINT pk_evaluacion_servicio PRIMARY KEY (cod_evaluacion_servicio)
);

CREATE TABLE RECOMIENDA (
  cod_cliente INTEGER,
  cod_evaluacion_servicio INTEGER,
  cod_producto INTEGER,
  recomienda_amigo BOOLEAN,
  CONSTRAINT pk_recomienda PRIMARY KEY (cod_cliente, cod_evaluacion_servicio, cod_producto),
  CONSTRAINT fk_recomienda_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTE (cod_cliente),
  CONSTRAINT fk_recomienda_evaluacion FOREIGN KEY (cod_evaluacion_servicio) REFERENCES EVALUACION_SERVICIO (cod_evaluacion_servicio),
  CONSTRAINT fk_recomienda_producto FOREIGN KEY (cod_producto) REFERENCES PRODUCTO (cod_producto)
);

CREATE TABLE CONTRATO (
  nro_contrato SERIAL,
  descrip_contrato TEXT,
  CONSTRAINT pk_contrato PRIMARY KEY (nro_contrato)
);

CREATE TABLE REGISTRO_CONTRATO (
  nro_contrato INTEGER,
  cod_producto INTEGER,
  cod_cliente INTEGER,
  fecha_inicio DATE,
  fecha_fin DATE,
  monto NUMERIC,
  estado_contrato VARCHAR(255),
  CONSTRAINT pk_registro_contrato PRIMARY KEY (nro_contrato, cod_producto, cod_cliente),
  CONSTRAINT fk_registro_contrato_contrato FOREIGN KEY (nro_contrato) REFERENCES CONTRATO (nro_contrato),
  CONSTRAINT fk_registro_contrato_producto FOREIGN KEY (cod_producto) REFERENCES PRODUCTO (cod_producto),
  CONSTRAINT fk_registro_contrato_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTE (cod_cliente)
);

CREATE TABLE REGISTRO_SINIESTRO (
  nro_siniestro SERIAL,
  nro_contrato INTEGER,
  fecha_siniestro DATE,
  fecha_respuesta DATE,
  id_rechazo BOOLEAN,
  monto_reconocido NUMERIC,
  monto_solicitado NUMERIC,
  CONSTRAINT pk_registro_siniestro PRIMARY KEY (nro_siniestro),
  CONSTRAINT fk_registro_siniestro_contrato FOREIGN KEY (nro_contrato) REFERENCES CONTRATO (nro_contrato)
);

CREATE TABLE SINIESTRO (
  nro_siniestro INTEGER,
  descripcion_siniestro TEXT,
  CONSTRAINT pk_siniestro PRIMARY KEY (nro_siniestro),
  CONSTRAINT fk_siniestro_registro_siniestro FOREIGN KEY (nro_siniestro) REFERENCES REGISTRO_SINIESTRO (nro_siniestro)
);