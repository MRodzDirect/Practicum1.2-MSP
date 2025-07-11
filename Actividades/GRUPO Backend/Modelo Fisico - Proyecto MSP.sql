-- tipos enumerados para campos que tienen valores fijos
CREATE TYPE estado_civil_enum AS ENUM ('Soltero', 'Casado', 'Divorciado', 'Viudo', 'Union libre');
CREATE TYPE grupo_sanguineo_rh_enum AS ENUM ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-');
CREATE TYPE zona_enum AS ENUM ('Urbana', 'Rural');
CREATE TYPE forma_llegada_enum AS ENUM ('Ambulatorio', 'Ambulancia', 'Otro transporte');
CREATE TYPE condicion_llegada_enum AS ENUM ('Estable', 'Inestable', 'Fallecido');

-- tabla provincias, la mas general
CREATE TABLE "Provincia" (
  "id_provincia" SERIAL PRIMARY KEY, -- id autoincremental
  "parroquia" VARCHAR -- nombre de la parroquia? parece raro pero asi estaba
);

-- tabla cantones, depende de provincia
CREATE TABLE "Canton" (
  "id_canton" SERIAL PRIMARY KEY,
  "id_provincia" INT NOT NULL, -- clave foranea a provincia
  "parroquia" VARCHAR, -- nombre parroquia? igual que en provincia
  CONSTRAINT fk_canton_provincia FOREIGN KEY ("id_provincia") REFERENCES "Provincia" ("id_provincia")
);

-- tabla parroquias, depende de canton
CREATE TABLE "Parroquia" (
  "id_parroquia" SERIAL PRIMARY KEY,
  "id_canton" INT NOT NULL, -- clave foranea a canton
  "parroquia" VARCHAR,
  CONSTRAINT fk_parroquia_canton FOREIGN KEY ("id_canton") REFERENCES "Canton" ("id_canton")
);

-- tabla residencia, donde vive el paciente
CREATE TABLE "Residencia" (
  "id_residencia" SERIAL PRIMARY KEY,
  "id_parroquia" INT NOT NULL, -- clave foranea a parroquia
  "barrio" VARCHAR,
  "Zona" zona_enum, -- urbana o rural
  CONSTRAINT fk_residencia_parroquia FOREIGN KEY ("id_parroquia") REFERENCES "Parroquia" ("id_parroquia")
);

-- tabla establecimientos de salud
CREATE TABLE "Establecimiento" (
  "id_establecimiento" SERIAL PRIMARY KEY,
  "id_parroquia" INT, -- clave foranea a parroquia
  "institucion_sistema" VARCHAR,
  "unidad_operativa" VARCHAR,
  "unicodigo" VARCHAR,
  "cod_parroquia" INT,
  CONSTRAINT fk_establecimiento_parroquia FOREIGN KEY ("id_parroquia") REFERENCES "Parroquia" ("id_parroquia")
);

-- tabla pacientes
CREATE TABLE "Paciente" (
  "id_paciente" SERIAL PRIMARY KEY,
  "id_residencia" INT, -- clave foranea a residencia
  "historia_clinica" VARCHAR,
  "primer_apellido" VARCHAR,
  "segundo_apellido" VARCHAR,
  "primer_nombre" VARCHAR,
  "segundo_nombre" VARCHAR,
  "cedula" VARCHAR,
  "direccion_habitual" VARCHAR,
  "telefono" VARCHAR,
  "fecha_nacimiento" DATE,
  "lugar_nacimiento" VARCHAR,
  "nacionalidad" VARCHAR,
  "grupo_cultural" VARCHAR,
  "edad" INT,
  "sexo" CHAR(1),
  "estado_civil" estado_civil_enum,
  "nivel_educacion" VARCHAR,
  "fecha_admision" DATE,
  "ocupacion" VARCHAR,
  "empresa_trabajo" VARCHAR,
  "seguro_salud" VARCHAR,
  "nombre_contacto_emergencia" VARCHAR,
  "parentesco_contacto_emergencia" VARCHAR,
  "direccion_contacto_emergencia" VARCHAR,
  "telefono_contacto_emergencia" VARCHAR,
  "grupo_sanguineo_rh" grupo_sanguineo_rh_enum,
  CONSTRAINT fk_paciente_residencia FOREIGN KEY ("id_residencia") REFERENCES "Residencia" ("id_residencia")
);

-- tabla admisiones, relaciona paciente y establecimiento
CREATE TABLE "Admision" (
  "id_admision" SERIAL PRIMARY KEY,
  "id_paciente" INT,
  "id_establecimiento" INT,
  "historia_clinica" VARCHAR,
  "fecha_admision" DATE,
  "referido" VARCHAR,
  "forma_llegada" forma_llegada_enum,
  "fuente_informacion" VARCHAR,
  "quien_entrega" VARCHAR,
  "telefono_entrega" VARCHAR,
  CONSTRAINT fk_admision_paciente FOREIGN KEY ("id_paciente") REFERENCES "Paciente" ("id_paciente"),
  CONSTRAINT fk_admision_establecimiento FOREIGN KEY ("id_establecimiento") REFERENCES "Establecimiento" ("id_establecimiento")
);

-- tabla atenciones, dentro de una admision
CREATE TABLE "Atencion" (
  "id_atencion" SERIAL PRIMARY KEY,
  "id_admision" INT,
  "fecha" DATE,
  "hora" TIME,
  "condicion_llegada" condicion_llegada_enum,
  "motivo_atencion" VARCHAR,
  CONSTRAINT fk_atencion_admision FOREIGN KEY ("id_admision") REFERENCES "Admision" ("id_admision")
);

-- tabla accidentes, si hubo accidente en la admision
CREATE TABLE "Accidente" (
  "id_accidente" SERIAL PRIMARY KEY,
  "id_admision" INT,
  "fecha" DATE,
  "hora" TIME,
  "lugar" VARCHAR,
  "direccion_evento" VARCHAR,
  "custodia_policial" BOOLEAN,
  "notificacion" BOOLEAN,
  "observaciones" VARCHAR,
  "aliento_alcoholico_sugestivo" BOOLEAN,
  CONSTRAINT fk_accidente_admision FOREIGN KEY ("id_admision") REFERENCES "Admision" ("id_admision")
);

-- detalles extra de accidente
CREATE TABLE "Detalles_accidente" (
  "id_detalles_accidente" SERIAL PRIMARY KEY,
  "id_accidente" INT,
  "detalle" VARCHAR,
  CONSTRAINT fk_detalles_accidente_accidente FOREIGN KEY ("id_accidente") REFERENCES "Accidente" ("id_accidente")
);

-- descripcion de la enfermedad actual del paciente en la admision
CREATE TABLE "EnfermedadActual" (
  "id_enfermedad" SERIAL PRIMARY KEY,
  "id_admision" INT,
  "descripcion" TEXT,
  CONSTRAINT fk_enfermedadactual_admision FOREIGN KEY ("id_admision") REFERENCES "Admision" ("id_admision")
);
