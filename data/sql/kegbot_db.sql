-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0-beta1
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: keg_bot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS keg_bot CASCADE;
CREATE SCHEMA keg_bot;
-- ddl-end --
ALTER SCHEMA keg_bot OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,keg_bot;
-- ddl-end --

-- object: public.flow | type: TABLE --
-- DROP TABLE IF EXISTS public.flow CASCADE;
CREATE TABLE public.flow(
	id varchar NOT NULL,
	"timestamp" timestamp,
	flow_amount decimal,
	pull_duration decimal,
	rfid varchar,
	rfid_user varchar,
	location_id_location integer
);
-- ddl-end --
ALTER TABLE public.flow OWNER TO postgres;
-- ddl-end --

-- object: public.regulator | type: TABLE --
-- DROP TABLE IF EXISTS public.regulator CASCADE;
CREATE TABLE public.regulator(
	id varchar,
	location_id integer,
	psi decimal,
	location_id_location integer
);
-- ddl-end --
ALTER TABLE public.regulator OWNER TO postgres;
-- ddl-end --

-- object: public.temperature | type: TABLE --
-- DROP TABLE IF EXISTS public.temperature CASCADE;
CREATE TABLE public.temperature(
	sensor_id varchar NOT NULL,
	location_id integer,
	degree decimal,
	location_id_location integer
);
-- ddl-end --
ALTER TABLE public.temperature OWNER TO postgres;
-- ddl-end --

-- object: public."user" | type: TABLE --
-- DROP TABLE IF EXISTS public."user" CASCADE;
CREATE TABLE public."user"(
	id integer NOT NULL,
	name varchar,
	rfid varchar NOT NULL,
	CONSTRAINT pk_rfid PRIMARY KEY (rfid)

);
-- ddl-end --
ALTER TABLE public."user" OWNER TO postgres;
-- ddl-end --

-- object: public.service_history | type: TABLE --
-- DROP TABLE IF EXISTS public.service_history CASCADE;
CREATE TABLE public.service_history(
	beer_id integer,
	keg_id integer,
	location_id integer,
	tapped_date timestamp,
	kicked_date timestamp,
	keg_id_keg integer,
	location_id_location integer
);
-- ddl-end --
ALTER TABLE public.service_history OWNER TO postgres;
-- ddl-end --

-- object: public.beer | type: TABLE --
-- DROP TABLE IF EXISTS public.beer CASCADE;
CREATE TABLE public.beer(
	beer_id integer NOT NULL,
	abv decimal,
	gravity decimal,
	name varchar,
	keg_id_keg integer,
	CONSTRAINT pk_beer_id PRIMARY KEY (beer_id)

);
-- ddl-end --
ALTER TABLE public.beer OWNER TO postgres;
-- ddl-end --

-- object: public.location | type: TABLE --
-- DROP TABLE IF EXISTS public.location CASCADE;
CREATE TABLE public.location(
	location_id integer NOT NULL,
	name varchar,
	CONSTRAINT pk_tap_id PRIMARY KEY (location_id)

);
-- ddl-end --
ALTER TABLE public.location OWNER TO postgres;
-- ddl-end --

-- object: public.keg | type: TABLE --
-- DROP TABLE IF EXISTS public.keg CASCADE;
CREATE TABLE public.keg(
	keg_id integer NOT NULL,
	location_id integer,
	keg_size decimal,
	beer_id smallint,
	CONSTRAINT pk_keg_id PRIMARY KEY (keg_id)

);
-- ddl-end --
ALTER TABLE public.keg OWNER TO postgres;
-- ddl-end --

-- object: location_fk | type: CONSTRAINT --
-- ALTER TABLE public.flow DROP CONSTRAINT IF EXISTS location_fk CASCADE;
ALTER TABLE public.flow ADD CONSTRAINT location_fk FOREIGN KEY (location_id_location)
REFERENCES public.location (location_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: flow_uq | type: CONSTRAINT --
-- ALTER TABLE public.flow DROP CONSTRAINT IF EXISTS flow_uq CASCADE;
ALTER TABLE public.flow ADD CONSTRAINT flow_uq UNIQUE (location_id_location);
-- ddl-end --

-- object: keg_fk | type: CONSTRAINT --
-- ALTER TABLE public.service_history DROP CONSTRAINT IF EXISTS keg_fk CASCADE;
ALTER TABLE public.service_history ADD CONSTRAINT keg_fk FOREIGN KEY (keg_id_keg)
REFERENCES public.keg (keg_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: service_history_uq | type: CONSTRAINT --
-- ALTER TABLE public.service_history DROP CONSTRAINT IF EXISTS service_history_uq CASCADE;
ALTER TABLE public.service_history ADD CONSTRAINT service_history_uq UNIQUE (keg_id_keg);
-- ddl-end --

-- object: keg_fk | type: CONSTRAINT --
-- ALTER TABLE public.beer DROP CONSTRAINT IF EXISTS keg_fk CASCADE;
ALTER TABLE public.beer ADD CONSTRAINT keg_fk FOREIGN KEY (keg_id_keg)
REFERENCES public.keg (keg_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: user_fk | type: CONSTRAINT --
-- ALTER TABLE public.flow DROP CONSTRAINT IF EXISTS user_fk CASCADE;
ALTER TABLE public.flow ADD CONSTRAINT user_fk FOREIGN KEY (rfid_user)
REFERENCES public."user" (rfid) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: flow_uq1 | type: CONSTRAINT --
-- ALTER TABLE public.flow DROP CONSTRAINT IF EXISTS flow_uq1 CASCADE;
ALTER TABLE public.flow ADD CONSTRAINT flow_uq1 UNIQUE (rfid_user);
-- ddl-end --

-- object: location_fk | type: CONSTRAINT --
-- ALTER TABLE public.service_history DROP CONSTRAINT IF EXISTS location_fk CASCADE;
ALTER TABLE public.service_history ADD CONSTRAINT location_fk FOREIGN KEY (location_id_location)
REFERENCES public.location (location_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: location_fk | type: CONSTRAINT --
-- ALTER TABLE public.temperature DROP CONSTRAINT IF EXISTS location_fk CASCADE;
ALTER TABLE public.temperature ADD CONSTRAINT location_fk FOREIGN KEY (location_id_location)
REFERENCES public.location (location_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: location_fk | type: CONSTRAINT --
-- ALTER TABLE public.regulator DROP CONSTRAINT IF EXISTS location_fk CASCADE;
ALTER TABLE public.regulator ADD CONSTRAINT location_fk FOREIGN KEY (location_id_location)
REFERENCES public.location (location_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: regulator_uq | type: CONSTRAINT --
-- ALTER TABLE public.regulator DROP CONSTRAINT IF EXISTS regulator_uq CASCADE;
ALTER TABLE public.regulator ADD CONSTRAINT regulator_uq UNIQUE (location_id_location);
-- ddl-end --


