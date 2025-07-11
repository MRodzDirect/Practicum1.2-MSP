CREATE TABLE "Establecimiento" (
  "id_establecimiento" int PRIMARY KEY,
  "id_parroquia" int,
  "institucion_sistema" varchar,
  "unidad_operativa" varchar,
  "unicodigo" varchar,
  "cod_parroquia" int
);

CREATE TABLE "Paciente" (
  "id_paciente" int PRIMARY KEY,
  "id_residencia" int,
  "historia_clinica" varchar,
  "primer_apellido" varchar,
  "segundo_apellido" varchar,
  "primer_nombre" varchar,
  "segundo_nombre" varchar,
  "cedula" varchar,
  "direccion_habitual" varchar,
  "telefono" varchar,
  "fecha_nacimiento" date,
  "lugar_nacimiento" varchar,
  "nacionalidad" varchar,
  "grupo_cultural" varchar,
  "edad" int,
  "sexo" char,
  "estado_civil" "enum(Soltero,Casado,Divorciado,Viudo,Unión libre)",
  "nivel_educacion" varchar,
  "fecha_admision" date,
  "ocupacion" varchar,
  "empresa_trabajo" varchar,
  "seguro_salud" varchar,
  "nombre_contacto_emergencia" varchar,
  "parentesco_contacto_emergencia" varchar,
  "direccion_contacto_emergencia" varchar,
  "telefono_contacto_emergencia" varchar,
  "grupo_sanguineo_rh" "enum(A+,A-,B+,B-,AB+,AB-,O+,O-)"
);

CREATE TABLE "Residencia" (
  "id_residencia" int PRIMARY KEY,
  "id_parroquia" int,
  "barrio" varchar,
  "Zona" "enum(Urbana,Rural)"
);

CREATE TABLE "Parroquia" (
  "id_parroquia" int PRIMARY KEY,
  "id_canton" int,
  "parroquia" varchar
);

CREATE TABLE "Canton" (
  "id_canton" int PRIMARY KEY,
  "id_provincia" int,
  "parroquia" varchar
);

CREATE TABLE "Provincia" (
  "id_provincia" int PRIMARY KEY,
  "parroquia" varchar
);

CREATE TABLE "Admision" (
  "id_admision" int PRIMARY KEY,
  "id_paciente" int,
  "id_establecimiento" int,
  "historia_clinica" varchar,
  "fecha_admision" date,
  "referido" varchar,
  "forma_llegada" "enum(Ambulatorio,Ambulancia,Otro transporte)",
  "fuente_informacion" varchar,
  "quien_entrega" varchar,
  "telefono_entrega" varchar
);

CREATE TABLE "Atencion" (
  "id_atencion" int PRIMARY KEY,
  "id_admision" int,
  "fecha" date,
  "hora" time,
  "condicion_llegada" "enum(Estable,Inestable,Fallecido)",
  "motivo_atencion" varchar
);

CREATE TABLE "Accidente" (
  "id_accidente" int PRIMARY KEY,
  "id_admision" int,
  "fecha" date,
  "hora" time,
  "lugar" varchar,
  "direccion_evento" varchar,
  "custodia_policial" bool,
  "notificacion" boolean,
  "observaciones" varchar,
  "aliento_alcoholico_sugestivo" boolean
);

CREATE TABLE "Detalles_accidente" (
  "id_detalles_accidente" int PRIMARY KEY,
  "id_accidente" int,
  "detalle" varchar
);

CREATE TABLE "EnfermedadActual" (
  "id_enfermedad" int PRIMARY KEY,
  "id_admision" int,
  "descripcion" text
);

ALTER TABLE "Establecimiento" ADD FOREIGN KEY ("id_parroquia") REFERENCES "Parroquia" ("id_parroquia");

ALTER TABLE "Paciente" ADD FOREIGN KEY ("id_residencia") REFERENCES "Residencia" ("id_residencia");

ALTER TABLE "Residencia" ADD FOREIGN KEY ("id_parroquia") REFERENCES "Parroquia" ("id_parroquia");

ALTER TABLE "Parroquia" ADD FOREIGN KEY ("id_canton") REFERENCES "Canton" ("id_canton");

ALTER TABLE "Canton" ADD FOREIGN KEY ("id_provincia") REFERENCES "Provincia" ("id_provincia");

ALTER TABLE "Admision" ADD FOREIGN KEY ("id_paciente") REFERENCES "Paciente" ("id_paciente");

ALTER TABLE "Admision" ADD FOREIGN KEY ("id_establecimiento") REFERENCES "Establecimiento" ("id_establecimiento");

ALTER TABLE "Atencion" ADD FOREIGN KEY ("id_admision") REFERENCES "Admision" ("id_admision");

ALTER TABLE "Accidente" ADD FOREIGN KEY ("id_admision") REFERENCES "Admision" ("id_admision");

ALTER TABLE "Detalles_accidente" ADD FOREIGN KEY ("id_accidente") REFERENCES "Accidente" ("id_accidente");

ALTER TABLE "EnfermedadActual" ADD FOREIGN KEY ("id_admision") REFERENCES "Admision" ("id_admision");
