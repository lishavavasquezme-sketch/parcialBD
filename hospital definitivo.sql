--
-- PostgreSQL database dump
--

\restrict QwJBTHh8S7i0jGbdwf76eYwXrd12FLJ25nvEzQbfXz7s47Fb5Rg4uEWIZYmNiAW

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

-- Started on 2026-05-21 10:11:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 280 (class 1255 OID 16684)
-- Name: registrar_auditoria(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.registrar_auditoria() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

INSERT INTO auditoria(tabla_afectada, accion)
VALUES ('cita', 'INSERT');

RETURN NEW;

END;
$$;


ALTER FUNCTION public.registrar_auditoria() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16648)
-- Name: auditoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditoria (
    id_auditoria integer NOT NULL,
    tabla_afectada character varying(100),
    accion character varying(50),
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.auditoria OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16647)
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auditoria_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 223
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNED BY public.auditoria.id_auditoria;


--
-- TOC entry 272 (class 1259 OID 17046)
-- Name: cama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cama (
    id_cama integer NOT NULL,
    numero_cama character varying(20),
    id_habitacion integer,
    id_estado integer
);


ALTER TABLE public.cama OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17045)
-- Name: cama_id_cama_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cama_id_cama_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cama_id_cama_seq OWNER TO postgres;

--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 271
-- Name: cama_id_cama_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cama_id_cama_seq OWNED BY public.cama.id_cama;


--
-- TOC entry 220 (class 1259 OID 16624)
-- Name: cita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    fecha_cita date,
    hora_cita time without time zone,
    estado_cita character varying(50),
    id_paciente integer,
    id_medico integer,
    id_motivo_cita integer
);


ALTER TABLE public.cita OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16623)
-- Name: cita_id_cita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cita_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cita_id_cita_seq OWNER TO postgres;

--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 219
-- Name: cita_id_cita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cita_id_cita_seq OWNED BY public.cita.id_cita;


--
-- TOC entry 245 (class 1259 OID 16767)
-- Name: consulta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta (
    id_consulta integer NOT NULL,
    motivo text,
    observaciones text,
    fecha date,
    id_paciente integer,
    id_medico integer
);


ALTER TABLE public.consulta OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16766)
-- Name: consulta_id_consulta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consulta_id_consulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consulta_id_consulta_seq OWNER TO postgres;

--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 244
-- Name: consulta_id_consulta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consulta_id_consulta_seq OWNED BY public.consulta.id_consulta;


--
-- TOC entry 241 (class 1259 OID 16748)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    id_departamento integer NOT NULL,
    nombre character varying(100),
    ubicacion character varying(100)
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16747)
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamento_id_departamento_seq OWNER TO postgres;

--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 240
-- Name: departamento_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamento_id_departamento_seq OWNED BY public.departamento.id_departamento;


--
-- TOC entry 237 (class 1259 OID 16724)
-- Name: detalle_receta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_receta (
    id_detalle integer NOT NULL,
    cantidad integer,
    dosis character varying(100),
    id_receta integer,
    id_medicamento integer,
    cantidad_dias integer,
    cantidad_medicamento integer,
    observaciones_detalle text,
    id_frecuencia integer
);


ALTER TABLE public.detalle_receta OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16723)
-- Name: detalle_receta_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_receta_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_receta_id_detalle_seq OWNER TO postgres;

--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 236
-- Name: detalle_receta_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_receta_id_detalle_seq OWNED BY public.detalle_receta.id_detalle;


--
-- TOC entry 243 (class 1259 OID 16755)
-- Name: empleado_administrativo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado_administrativo (
    id_empleado integer NOT NULL,
    nombre character varying(100),
    cargo character varying(100),
    id_departamento integer,
    id_tipo_documento integer,
    documento_empleado character varying(20),
    apellido_empleado character varying(50),
    telefono_empleado character varying(20),
    correo_empleado character varying(100),
    id_rol_hospital integer,
    fecha_ingreso_empleado date,
    estado_empleado boolean DEFAULT true
);


ALTER TABLE public.empleado_administrativo OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16754)
-- Name: empleado_administrativo_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_administrativo_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleado_administrativo_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 242
-- Name: empleado_administrativo_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_administrativo_id_empleado_seq OWNED BY public.empleado_administrativo.id_empleado;


--
-- TOC entry 263 (class 1259 OID 16948)
-- Name: enfermedad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enfermedad (
    id_enfermedad integer NOT NULL,
    nombre_enfermedad character varying(100) NOT NULL,
    tipo_enfermedad character varying(50),
    descripcion_enfermedad text,
    estado_enfermedad boolean DEFAULT true
);


ALTER TABLE public.enfermedad OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16947)
-- Name: enfermedad_id_enfermedad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enfermedad_id_enfermedad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enfermedad_id_enfermedad_seq OWNER TO postgres;

--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 262
-- Name: enfermedad_id_enfermedad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enfermedad_id_enfermedad_seq OWNED BY public.enfermedad.id_enfermedad;


--
-- TOC entry 257 (class 1259 OID 16882)
-- Name: enfermero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enfermero (
    id_enfermero integer NOT NULL,
    id_tipo_documento integer NOT NULL,
    documento_enfermero character varying(20) NOT NULL,
    nombre_enfermero character varying(50) NOT NULL,
    apellido_enfermero character varying(50) NOT NULL,
    telefono_enfermero character varying(20),
    correo_enfermero character varying(100),
    id_turno integer,
    id_departamento integer,
    fecha_ingreso_enfermero date,
    estado_enfermero boolean DEFAULT true
);


ALTER TABLE public.enfermero OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16881)
-- Name: enfermero_id_enfermero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enfermero_id_enfermero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enfermero_id_enfermero_seq OWNER TO postgres;

--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 256
-- Name: enfermero_id_enfermero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enfermero_id_enfermero_seq OWNED BY public.enfermero.id_enfermero;


--
-- TOC entry 239 (class 1259 OID 16741)
-- Name: eps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eps (
    id_eps integer NOT NULL,
    nombre character varying(100),
    telefono character varying(20)
);


ALTER TABLE public.eps OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16740)
-- Name: eps_id_eps_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eps_id_eps_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eps_id_eps_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 238
-- Name: eps_id_eps_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eps_id_eps_seq OWNED BY public.eps.id_eps;


--
-- TOC entry 255 (class 1259 OID 16824)
-- Name: especialidad_medica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidad_medica (
    id_especialidad integer NOT NULL,
    nombre_especialidad character varying(100) NOT NULL,
    descripcion_especialidad text,
    estado_especialidad boolean DEFAULT true
);


ALTER TABLE public.especialidad_medica OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16823)
-- Name: especialidad_medica_id_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidad_medica_id_especialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.especialidad_medica_id_especialidad_seq OWNER TO postgres;

--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 254
-- Name: especialidad_medica_id_especialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidad_medica_id_especialidad_seq OWNED BY public.especialidad_medica.id_especialidad;


--
-- TOC entry 251 (class 1259 OID 16808)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id_estado integer NOT NULL,
    nombre_estado character varying(50) NOT NULL,
    tipo_estado character varying(50) NOT NULL,
    descripcion_estado character varying(150),
    estado_activo character varying(20) DEFAULT true
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16807)
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_id_estado_seq OWNER TO postgres;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 250
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_id_estado_seq OWNED BY public.estado.id_estado;


--
-- TOC entry 228 (class 1259 OID 16670)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    fecha date,
    total numeric(10,2),
    estado_pago character varying(50),
    id_paciente integer
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16669)
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factura_id_factura_seq OWNER TO postgres;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 227
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factura_id_factura_seq OWNED BY public.factura.id_factura;


--
-- TOC entry 267 (class 1259 OID 16979)
-- Name: frecuencia_medicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.frecuencia_medicamento (
    id_frecuencia integer NOT NULL,
    descripcion_frecuencia character varying(100),
    cantidad_horas integer,
    estado_frecuencia boolean DEFAULT true
);


ALTER TABLE public.frecuencia_medicamento OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 16978)
-- Name: frecuencia_medicamento_id_frecuencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.frecuencia_medicamento_id_frecuencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.frecuencia_medicamento_id_frecuencia_seq OWNER TO postgres;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 266
-- Name: frecuencia_medicamento_id_frecuencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.frecuencia_medicamento_id_frecuencia_seq OWNED BY public.frecuencia_medicamento.id_frecuencia;


--
-- TOC entry 270 (class 1259 OID 17032)
-- Name: habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion (
    id_habitacion integer NOT NULL,
    numero_habitacion character varying(20),
    piso_habitacion integer,
    tipo_habitacion character varying(50),
    capacidad_habitacion integer,
    id_estado integer
);


ALTER TABLE public.habitacion OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 17031)
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitacion_id_habitacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNER TO postgres;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 269
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNED BY public.habitacion.id_habitacion;


--
-- TOC entry 226 (class 1259 OID 16656)
-- Name: historia_clinica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historia_clinica (
    id_historia integer NOT NULL,
    diagnostico text,
    tratamiento text,
    fecha date,
    id_paciente integer
);


ALTER TABLE public.historia_clinica OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16655)
-- Name: historia_clinica_id_historia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historia_clinica_id_historia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historia_clinica_id_historia_seq OWNER TO postgres;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 225
-- Name: historia_clinica_id_historia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historia_clinica_id_historia_seq OWNED BY public.historia_clinica.id_historia;


--
-- TOC entry 274 (class 1259 OID 17063)
-- Name: hospitalizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospitalizacion (
    id_hospitalizacion integer NOT NULL,
    fecha_ingreso timestamp without time zone NOT NULL,
    fecha_salida timestamp without time zone,
    motivo_hospitalizacion text,
    id_estado integer,
    id_paciente integer,
    id_cama integer
);


ALTER TABLE public.hospitalizacion OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 17062)
-- Name: hospitalizacion_id_hospitalizacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospitalizacion_id_hospitalizacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hospitalizacion_id_hospitalizacion_seq OWNER TO postgres;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 273
-- Name: hospitalizacion_id_hospitalizacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospitalizacion_id_hospitalizacion_seq OWNED BY public.hospitalizacion.id_hospitalizacion;


--
-- TOC entry 233 (class 1259 OID 16703)
-- Name: medicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicamento (
    id_medicamento integer NOT NULL,
    nombre character varying(100),
    descripcion text,
    stock integer,
    codigo_medicamento character varying(30),
    fecha_vencimiento_medicamento date,
    precio_medicamento numeric(10,2),
    estado_medicamento character varying(20) DEFAULT true
);


ALTER TABLE public.medicamento OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16702)
-- Name: medicamento_id_medicamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicamento_id_medicamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicamento_id_medicamento_seq OWNER TO postgres;

--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 232
-- Name: medicamento_id_medicamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicamento_id_medicamento_seq OWNED BY public.medicamento.id_medicamento;


--
-- TOC entry 218 (class 1259 OID 16616)
-- Name: medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medico (
    id_medico integer NOT NULL,
    nombre_medico character varying(100),
    especialidad character varying(100),
    telefono_medico character varying(20),
    id_tipo_documento integer,
    documento_medico character varying(20),
    apellido_medico character varying(50),
    correo_medico character varying(100),
    numero_licencia_medico character varying(50),
    id_especialidad integer,
    id_departamento integer,
    fecha_ingreso_medico date,
    estado_medico character varying(20) DEFAULT true
);


ALTER TABLE public.medico OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16615)
-- Name: medico_id_medico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medico_id_medico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medico_id_medico_seq OWNER TO postgres;

--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 217
-- Name: medico_id_medico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medico_id_medico_seq OWNED BY public.medico.id_medico;


--
-- TOC entry 261 (class 1259 OID 16933)
-- Name: motivo_cita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.motivo_cita (
    id_motivo_cita integer NOT NULL,
    nombre_motivo_cita character varying(100) NOT NULL,
    descripcion_motivo_cita text,
    prioridad_motivo character varying(20),
    estado_motivo boolean DEFAULT true
);


ALTER TABLE public.motivo_cita OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16932)
-- Name: motivo_cita_id_motivo_cita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.motivo_cita_id_motivo_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.motivo_cita_id_motivo_cita_seq OWNER TO postgres;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 260
-- Name: motivo_cita_id_motivo_cita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motivo_cita_id_motivo_cita_seq OWNED BY public.motivo_cita.id_motivo_cita;


--
-- TOC entry 216 (class 1259 OID 16609)
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    nombre_paciente character varying(100),
    apellido_paciente character varying(100),
    telefono_paciente character varying(20),
    correo_paciente character varying(100),
    fecha_nacimiento_paciente date,
    id_tipo_documento integer,
    documento_paciente character varying(20),
    genero_paciente character varying(20),
    direccion_paciente character varying(150),
    tipo_sangre_paciente character varying(10),
    fecha_registro_paciente timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_eps integer,
    estado_paciente character varying(20) DEFAULT true
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16958)
-- Name: paciente_enfermedad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente_enfermedad (
    id_paciente_enfermedad integer NOT NULL,
    fecha_diagnostico date,
    observacion_enfermedad text,
    estado_tratamiento boolean DEFAULT true,
    id_paciente integer,
    id_enfermedad integer
);


ALTER TABLE public.paciente_enfermedad OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 16957)
-- Name: paciente_enfermedad_id_paciente_enfermedad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_enfermedad_id_paciente_enfermedad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paciente_enfermedad_id_paciente_enfermedad_seq OWNER TO postgres;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 264
-- Name: paciente_enfermedad_id_paciente_enfermedad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_enfermedad_id_paciente_enfermedad_seq OWNED BY public.paciente_enfermedad.id_paciente_enfermedad;


--
-- TOC entry 215 (class 1259 OID 16608)
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paciente_id_paciente_seq OWNER TO postgres;

--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 215
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;


--
-- TOC entry 231 (class 1259 OID 16691)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    metodo_pago character varying(50),
    fecha_pago date,
    monto numeric(10,2),
    id_factura integer
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16690)
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_pago_seq OWNER TO postgres;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 230
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;


--
-- TOC entry 235 (class 1259 OID 16712)
-- Name: receta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receta (
    id_receta integer NOT NULL,
    fecha date,
    id_paciente integer,
    indicaciones_receta text,
    estado_receta character varying(20) DEFAULT true,
    id_consulta integer
);


ALTER TABLE public.receta OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16711)
-- Name: receta_id_receta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receta_id_receta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.receta_id_receta_seq OWNER TO postgres;

--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 234
-- Name: receta_id_receta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receta_id_receta_seq OWNED BY public.receta.id_receta;


--
-- TOC entry 253 (class 1259 OID 16816)
-- Name: rol_hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol_hospital (
    id_rol_hospital integer NOT NULL,
    nombre_rol_hospital character varying(50) NOT NULL,
    descripcion_rol_hospital character varying(150),
    nivel_acceso integer,
    estado_rol boolean DEFAULT true
);


ALTER TABLE public.rol_hospital OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16815)
-- Name: rol_hospital_id_rol_hospital_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_hospital_id_rol_hospital_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rol_hospital_id_rol_hospital_seq OWNER TO postgres;

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 252
-- Name: rol_hospital_id_rol_hospital_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_hospital_id_rol_hospital_seq OWNED BY public.rol_hospital.id_rol_hospital;


--
-- TOC entry 276 (class 1259 OID 17087)
-- Name: salario_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salario_personal (
    id_salario integer NOT NULL,
    tipo_personal character varying(50) NOT NULL,
    id_personal integer NOT NULL,
    salario numeric(12,2) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    estado_salario boolean DEFAULT true
);


ALTER TABLE public.salario_personal OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17086)
-- Name: salario_personal_id_salario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salario_personal_id_salario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salario_personal_id_salario_seq OWNER TO postgres;

--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 275
-- Name: salario_personal_id_salario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salario_personal_id_salario_seq OWNED BY public.salario_personal.id_salario;


--
-- TOC entry 247 (class 1259 OID 16790)
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_documento (
    id_tipo_documento integer NOT NULL,
    codigo_tipo_documento character varying(10) NOT NULL,
    nombre_tipo_documento character varying(50) NOT NULL,
    descripcion_tipo_documento character varying(150),
    estado_tipo_documento boolean DEFAULT true
);


ALTER TABLE public.tipo_documento OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16789)
-- Name: tipo_documento_id_tipo_documento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_documento_id_tipo_documento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_documento_id_tipo_documento_seq OWNER TO postgres;

--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_documento_id_tipo_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_documento_id_tipo_documento_seq OWNED BY public.tipo_documento.id_tipo_documento;


--
-- TOC entry 249 (class 1259 OID 16800)
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    id_turno integer NOT NULL,
    nombre_turno character varying(50) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    descripcion_turno character varying(100),
    estado_turno boolean DEFAULT true
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16799)
-- Name: turno_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.turno_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turno_id_turno_seq OWNER TO postgres;

--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 248
-- Name: turno_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turno_id_turno_seq OWNED BY public.turno.id_turno;


--
-- TOC entry 222 (class 1259 OID 16641)
-- Name: usuario_sistema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_sistema (
    id_usuario integer NOT NULL,
    usuario character varying(50),
    password character varying(100),
    rol character varying(50)
);


ALTER TABLE public.usuario_sistema OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16640)
-- Name: usuario_sistema_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_sistema_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_sistema_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 221
-- Name: usuario_sistema_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_sistema_id_usuario_seq OWNED BY public.usuario_sistema.id_usuario;


--
-- TOC entry 229 (class 1259 OID 16686)
-- Name: vista_citas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_citas AS
 SELECT c.id_cita,
    p.nombre_paciente AS paciente,
    m.nombre_medico AS medico,
    c.fecha_cita AS fecha,
    c.hora_cita AS hora,
    c.estado_cita AS estado
   FROM ((public.cita c
     JOIN public.paciente p ON ((c.id_paciente = p.id_paciente)))
     JOIN public.medico m ON ((c.id_medico = m.id_medico)));


ALTER VIEW public.vista_citas OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16927)
-- Name: vista_empleados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_empleados AS
 SELECT ea.documento_empleado,
    td.nombre_tipo_documento AS tipo_documento,
    ea.apellido_empleado,
    ea.telefono_empleado,
    ea.correo_empleado,
    d.nombre AS departamento,
    rh.nombre_rol_hospital AS rol,
    ea.fecha_ingreso_empleado,
        CASE
            WHEN (ea.estado_empleado = true) THEN 'Activo'::text
            ELSE 'Inactivo'::text
        END AS estado_empleado
   FROM (((public.empleado_administrativo ea
     JOIN public.tipo_documento td ON ((ea.id_tipo_documento = td.id_tipo_documento)))
     JOIN public.departamento d ON ((ea.id_departamento = d.id_departamento)))
     JOIN public.rol_hospital rh ON ((ea.id_rol_hospital = rh.id_rol_hospital)));


ALTER VIEW public.vista_empleados OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16906)
-- Name: vista_enfermeros; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_enfermeros AS
 SELECT e.documento_enfermero,
    e.nombre_enfermero,
    e.apellido_enfermero,
    e.telefono_enfermero,
    e.correo_enfermero,
    t.nombre_turno,
    d.nombre AS departamento,
    e.fecha_ingreso_enfermero,
        CASE
            WHEN (e.estado_enfermero = true) THEN 'Activo'::text
            ELSE 'Inactivo'::text
        END AS estado_enfermero
   FROM ((public.enfermero e
     JOIN public.turno t ON ((e.id_turno = t.id_turno)))
     JOIN public.departamento d ON ((e.id_departamento = d.id_departamento)));


ALTER VIEW public.vista_enfermeros OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 17108)
-- Name: vista_medicos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_medicos AS
 SELECT id_medico,
    nombre_medico,
    especialidad,
    telefono_medico,
    id_tipo_documento,
    documento_medico,
    apellido_medico,
    correo_medico,
    numero_licencia_medico,
    id_especialidad,
    id_departamento,
    fecha_ingreso_medico,
    estado_medico
   FROM public.medico;


ALTER VIEW public.vista_medicos OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 17099)
-- Name: vista_pacientes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_pacientes AS
 SELECT id_paciente,
    nombre_paciente,
    apellido_paciente,
    telefono_paciente,
    correo_paciente,
    fecha_nacimiento_paciente,
    id_tipo_documento,
    documento_paciente,
    genero_paciente,
    direccion_paciente,
    tipo_sangre_paciente,
    to_char(fecha_registro_paciente, 'YYYY-MM-DD HH24:MI:SS'::text) AS fecha_registro_paciente,
    id_eps,
    estado_paciente
   FROM public.paciente;


ALTER VIEW public.vista_pacientes OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17021)
-- Name: vista_recetas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_recetas AS
 SELECT r.id_receta,
    r.fecha,
    r.indicaciones_receta,
    r.estado_receta,
    p.nombre_paciente AS paciente,
    c.id_consulta
   FROM ((public.receta r
     LEFT JOIN public.paciente p ON ((r.id_paciente = p.id_paciente)))
     LEFT JOIN public.consulta c ON ((r.id_consulta = c.id_consulta)));


ALTER VIEW public.vista_recetas OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17094)
-- Name: vista_salarios_personal; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_salarios_personal AS
 SELECT 'Medico'::text AS tipo_personal,
    m.nombre_medico AS nombre,
    m.apellido_medico AS apellido,
    s.salario,
    s.fecha_inicio
   FROM (public.salario_personal s
     JOIN public.medico m ON ((s.id_personal = m.id_medico)))
  WHERE ((s.tipo_personal)::text = 'Medico'::text)
UNION
 SELECT 'Enfermero'::text AS tipo_personal,
    e.nombre_enfermero AS nombre,
    e.apellido_enfermero AS apellido,
    s.salario,
    s.fecha_inicio
   FROM (public.salario_personal s
     JOIN public.enfermero e ON ((s.id_personal = e.id_enfermero)))
  WHERE ((s.tipo_personal)::text = 'Enfermero'::text)
UNION
 SELECT 'Administrativo'::text AS tipo_personal,
    a.nombre,
    a.apellido_empleado AS apellido,
    s.salario,
    s.fecha_inicio
   FROM (public.salario_personal s
     JOIN public.empleado_administrativo a ON ((s.id_personal = a.id_empleado)))
  WHERE ((s.tipo_personal)::text = 'Administrativo'::text);


ALTER VIEW public.vista_salarios_personal OWNER TO postgres;

--
-- TOC entry 4810 (class 2604 OID 16651)
-- Name: auditoria id_auditoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria ALTER COLUMN id_auditoria SET DEFAULT nextval('public.auditoria_id_auditoria_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 17049)
-- Name: cama id_cama; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama ALTER COLUMN id_cama SET DEFAULT nextval('public.cama_id_cama_seq'::regclass);


--
-- TOC entry 4808 (class 2604 OID 16627)
-- Name: cita id_cita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita ALTER COLUMN id_cita SET DEFAULT nextval('public.cita_id_cita_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 16770)
-- Name: consulta id_consulta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta ALTER COLUMN id_consulta SET DEFAULT nextval('public.consulta_id_consulta_seq'::regclass);


--
-- TOC entry 4821 (class 2604 OID 16751)
-- Name: departamento id_departamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamento_id_departamento_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 16727)
-- Name: detalle_receta id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_receta ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_receta_id_detalle_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 16758)
-- Name: empleado_administrativo id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_administrativo ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_administrativo_id_empleado_seq'::regclass);


--
-- TOC entry 4839 (class 2604 OID 16951)
-- Name: enfermedad id_enfermedad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermedad ALTER COLUMN id_enfermedad SET DEFAULT nextval('public.enfermedad_id_enfermedad_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 16885)
-- Name: enfermero id_enfermero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermero ALTER COLUMN id_enfermero SET DEFAULT nextval('public.enfermero_id_enfermero_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 16744)
-- Name: eps id_eps; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eps ALTER COLUMN id_eps SET DEFAULT nextval('public.eps_id_eps_seq'::regclass);


--
-- TOC entry 4833 (class 2604 OID 16827)
-- Name: especialidad_medica id_especialidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad_medica ALTER COLUMN id_especialidad SET DEFAULT nextval('public.especialidad_medica_id_especialidad_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 16811)
-- Name: estado id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_id_estado_seq'::regclass);


--
-- TOC entry 4813 (class 2604 OID 16673)
-- Name: factura id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura ALTER COLUMN id_factura SET DEFAULT nextval('public.factura_id_factura_seq'::regclass);


--
-- TOC entry 4843 (class 2604 OID 16982)
-- Name: frecuencia_medicamento id_frecuencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frecuencia_medicamento ALTER COLUMN id_frecuencia SET DEFAULT nextval('public.frecuencia_medicamento_id_frecuencia_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 17035)
-- Name: habitacion id_habitacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion ALTER COLUMN id_habitacion SET DEFAULT nextval('public.habitacion_id_habitacion_seq'::regclass);


--
-- TOC entry 4812 (class 2604 OID 16659)
-- Name: historia_clinica id_historia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica ALTER COLUMN id_historia SET DEFAULT nextval('public.historia_clinica_id_historia_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 17066)
-- Name: hospitalizacion id_hospitalizacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitalizacion ALTER COLUMN id_hospitalizacion SET DEFAULT nextval('public.hospitalizacion_id_hospitalizacion_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 16706)
-- Name: medicamento id_medicamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamento ALTER COLUMN id_medicamento SET DEFAULT nextval('public.medicamento_id_medicamento_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 16619)
-- Name: medico id_medico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico ALTER COLUMN id_medico SET DEFAULT nextval('public.medico_id_medico_seq'::regclass);


--
-- TOC entry 4837 (class 2604 OID 16936)
-- Name: motivo_cita id_motivo_cita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motivo_cita ALTER COLUMN id_motivo_cita SET DEFAULT nextval('public.motivo_cita_id_motivo_cita_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 16612)
-- Name: paciente id_paciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 16961)
-- Name: paciente_enfermedad id_paciente_enfermedad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_enfermedad ALTER COLUMN id_paciente_enfermedad SET DEFAULT nextval('public.paciente_enfermedad_id_paciente_enfermedad_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 16694)
-- Name: pago id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 16715)
-- Name: receta id_receta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receta ALTER COLUMN id_receta SET DEFAULT nextval('public.receta_id_receta_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 16819)
-- Name: rol_hospital id_rol_hospital; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_hospital ALTER COLUMN id_rol_hospital SET DEFAULT nextval('public.rol_hospital_id_rol_hospital_seq'::regclass);


--
-- TOC entry 4848 (class 2604 OID 17090)
-- Name: salario_personal id_salario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salario_personal ALTER COLUMN id_salario SET DEFAULT nextval('public.salario_personal_id_salario_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 16793)
-- Name: tipo_documento id_tipo_documento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_documento ALTER COLUMN id_tipo_documento SET DEFAULT nextval('public.tipo_documento_id_tipo_documento_seq'::regclass);


--
-- TOC entry 4827 (class 2604 OID 16803)
-- Name: turno id_turno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno ALTER COLUMN id_turno SET DEFAULT nextval('public.turno_id_turno_seq'::regclass);


--
-- TOC entry 4809 (class 2604 OID 16644)
-- Name: usuario_sistema id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_sistema ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_sistema_id_usuario_seq'::regclass);


--
-- TOC entry 5106 (class 0 OID 16648)
-- Dependencies: 224
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auditoria VALUES (1, 'cita', 'INSERT', '2026-05-20 16:25:58.192387');
INSERT INTO public.auditoria VALUES (2, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (3, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (4, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (5, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (6, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (7, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (8, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (9, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (10, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (11, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (12, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (13, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (14, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (15, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (16, 'cita', 'INSERT', '2026-05-20 21:41:33.85266');
INSERT INTO public.auditoria VALUES (17, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (18, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (19, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (20, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (21, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (22, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (23, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (24, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (25, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (26, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (27, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (28, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (29, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (30, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');
INSERT INTO public.auditoria VALUES (31, 'cita', 'INSERT', '2026-05-20 21:44:07.027807');


--
-- TOC entry 5150 (class 0 OID 17046)
-- Dependencies: 272
-- Data for Name: cama; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cama VALUES (1, 'C1', 1, 1);
INSERT INTO public.cama VALUES (2, 'C2', 1, 2);
INSERT INTO public.cama VALUES (3, 'C3', 2, 1);
INSERT INTO public.cama VALUES (4, 'C4', 3, 2);
INSERT INTO public.cama VALUES (5, 'C5', 1, 1);
INSERT INTO public.cama VALUES (6, 'C6', 1, 2);
INSERT INTO public.cama VALUES (7, 'C7', 2, 1);
INSERT INTO public.cama VALUES (8, 'C8', 2, 2);
INSERT INTO public.cama VALUES (9, 'C9', 3, 1);
INSERT INTO public.cama VALUES (10, 'C10', 3, 2);
INSERT INTO public.cama VALUES (11, 'C11', 1, 1);
INSERT INTO public.cama VALUES (12, 'C12', 2, 1);


--
-- TOC entry 5102 (class 0 OID 16624)
-- Dependencies: 220
-- Data for Name: cita; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cita VALUES (4, '2026-05-21', '11:00:00', 'Cancelada', 4, 1, NULL);
INSERT INTO public.cita VALUES (5, '2026-05-22', '14:00:00', 'Programada', 5, 4, NULL);
INSERT INTO public.cita VALUES (6, '2026-05-22', '15:00:00', 'Completada', 6, 5, NULL);
INSERT INTO public.cita VALUES (7, '2026-05-23', '16:00:00', 'Programada', 7, 2, NULL);
INSERT INTO public.cita VALUES (8, '2026-05-23', '17:00:00', 'Programada', 8, 3, NULL);
INSERT INTO public.cita VALUES (9, '2026-05-24', '08:30:00', 'Programada', 9, 6, NULL);
INSERT INTO public.cita VALUES (10, '2026-05-24', '09:00:00', 'Completada', 10, 7, NULL);
INSERT INTO public.cita VALUES (11, '2026-05-24', '10:00:00', 'Programada', 11, 2, NULL);
INSERT INTO public.cita VALUES (12, '2026-05-24', '11:00:00', 'Cancelada', 12, 3, NULL);
INSERT INTO public.cita VALUES (13, '2026-05-25', '13:00:00', 'Programada', 13, 1, NULL);
INSERT INTO public.cita VALUES (14, '2026-05-25', '14:00:00', 'Completada', 2, 4, NULL);
INSERT INTO public.cita VALUES (15, '2026-05-25', '15:00:00', 'Programada', 5, 5, NULL);
INSERT INTO public.cita VALUES (16, '2026-05-26', '08:00:00', 'Programada', 6, 6, NULL);
INSERT INTO public.cita VALUES (17, '2026-05-26', '09:30:00', 'Cancelada', 7, 7, NULL);
INSERT INTO public.cita VALUES (18, '2026-05-26', '10:30:00', 'Completada', 8, 2, NULL);
INSERT INTO public.cita VALUES (19, '2026-05-30', '08:00:00', 'Programada', 1, 2, NULL);
INSERT INTO public.cita VALUES (1, '2026-05-20', '08:00:00', 'Programada', 1, 1, 1);
INSERT INTO public.cita VALUES (2, '2026-05-20', '09:00:00', 'Programada', 2, 2, 2);
INSERT INTO public.cita VALUES (3, '2026-05-21', '10:00:00', 'Completada', 3, 3, 3);
INSERT INTO public.cita VALUES (35, '2026-06-01', '08:00:00', 'true', 1, 1, 1);
INSERT INTO public.cita VALUES (36, '2026-06-01', '09:00:00', 'true', 2, 2, 2);
INSERT INTO public.cita VALUES (37, '2026-06-01', '10:00:00', 'true', 3, 3, 3);
INSERT INTO public.cita VALUES (38, '2026-06-01', '11:00:00', 'true', 4, 4, 4);
INSERT INTO public.cita VALUES (39, '2026-06-01', '12:00:00', 'true', 5, 5, 5);
INSERT INTO public.cita VALUES (40, '2026-06-02', '08:00:00', 'true', 6, 6, 1);
INSERT INTO public.cita VALUES (41, '2026-06-02', '09:00:00', 'true', 7, 7, 2);
INSERT INTO public.cita VALUES (42, '2026-06-02', '10:00:00', 'true', 8, 1, 3);
INSERT INTO public.cita VALUES (43, '2026-06-02', '11:00:00', 'true', 9, 2, 4);
INSERT INTO public.cita VALUES (44, '2026-06-02', '12:00:00', 'true', 10, 3, 5);
INSERT INTO public.cita VALUES (45, '2026-06-03', '08:00:00', 'true', 11, 4, 1);
INSERT INTO public.cita VALUES (46, '2026-06-03', '09:00:00', 'true', 12, 5, 2);
INSERT INTO public.cita VALUES (47, '2026-06-03', '10:00:00', 'true', 13, 6, 3);


--
-- TOC entry 5126 (class 0 OID 16767)
-- Dependencies: 245
-- Data for Name: consulta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.consulta VALUES (1, 'Dolor de cabeza', 'Paciente estable', '2026-05-20', 1, 1);
INSERT INTO public.consulta VALUES (2, 'Fiebre', 'Reposo recomendado', '2026-05-20', 2, 2);
INSERT INTO public.consulta VALUES (3, 'Alergia', 'Medicamento formulado', '2026-05-21', 3, 3);
INSERT INTO public.consulta VALUES (4, 'Dolor muscular', 'Terapia sugerida', '2026-05-21', 4, 4);
INSERT INTO public.consulta VALUES (5, 'Control general', 'Sin novedades', '2026-05-22', 5, 5);
INSERT INTO public.consulta VALUES (6, 'Dolor abdominal', 'Examen solicitado', '2026-05-22', 6, 5);
INSERT INTO public.consulta VALUES (7, 'Problema respiratorio', 'Inhalador recomendado', '2026-05-23', 7, 2);
INSERT INTO public.consulta VALUES (8, 'Mareo constante', 'Observacion neurologica', '2026-05-23', 8, 4);
INSERT INTO public.consulta VALUES (9, 'Chequeo medico', 'Paciente estable', '2026-05-24', 9, 5);
INSERT INTO public.consulta VALUES (10, 'Dolor de rodilla', 'Radiografia sugerida', '2026-05-24', 10, 7);
INSERT INTO public.consulta VALUES (11, 'Control hormonal', 'Medicamento ajustado', '2026-05-25', 11, 6);
INSERT INTO public.consulta VALUES (12, 'Irritacion en piel', 'Crema recetada', '2026-05-25', 12, 3);
INSERT INTO public.consulta VALUES (13, 'Dolor en el pecho', 'Electrocardiograma solicitado', '2026-05-26', 13, 1);


--
-- TOC entry 5122 (class 0 OID 16748)
-- Dependencies: 241
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamento VALUES (1, 'Urgencias', 'Piso 1');
INSERT INTO public.departamento VALUES (2, 'Cardiologia', 'Piso 2');
INSERT INTO public.departamento VALUES (3, 'Pediatria', 'Piso 3');
INSERT INTO public.departamento VALUES (4, 'Dermatologia', 'Piso 4');
INSERT INTO public.departamento VALUES (5, 'Neurologia', 'Piso 5');
INSERT INTO public.departamento VALUES (6, 'Medicina General', 'Piso 6');
INSERT INTO public.departamento VALUES (7, 'Ginecologia', 'Piso 7');
INSERT INTO public.departamento VALUES (8, 'Ortopedia', 'Piso 8');
INSERT INTO public.departamento VALUES (9, 'Administracion', 'Piso 9');


--
-- TOC entry 5118 (class 0 OID 16724)
-- Dependencies: 237
-- Data for Name: detalle_receta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detalle_receta VALUES (6, 2, 'Cada 6 horas', 6, 1, 7, 14, 'Aplicar en horario exacto', 1);
INSERT INTO public.detalle_receta VALUES (1, 2, 'Cada 8 horas', 1, 1, 5, 10, 'Tomar con agua', 2);
INSERT INTO public.detalle_receta VALUES (8, 2, 'Cada 8 horas', 8, 2, 7, 14, 'No exceder la dosis indicada', 2);
INSERT INTO public.detalle_receta VALUES (12, 2, 'Cada 8 horas', 12, 1, 7, 14, 'Evitar automedicación', 2);
INSERT INTO public.detalle_receta VALUES (2, 1, 'Cada 12 horas', 2, 2, 7, 7, 'Tomar con abundante agua', 3);
INSERT INTO public.detalle_receta VALUES (10, 3, 'Cada 12 horas', 10, 3, 7, 21, 'Completar tratamiento', 3);
INSERT INTO public.detalle_receta VALUES (4, 2, 'Cada 24 horas', 4, 4, 7, 14, 'Tomar después de los alimentos', 4);
INSERT INTO public.detalle_receta VALUES (13, 1, 'Cada 24 horas', 13, 2, 7, 7, 'Control médico en 5 días', 4);
INSERT INTO public.detalle_receta VALUES (3, 3, 'Diario', 3, 3, 7, 21, 'No suspender tratamiento', 5);
INSERT INTO public.detalle_receta VALUES (7, 1, 'Diario', 7, 5, 7, 7, 'Mantener refrigerado', 5);
INSERT INTO public.detalle_receta VALUES (11, 1, 'Diario', 11, 5, 7, 7, 'Tomar con alimentos', 5);
INSERT INTO public.detalle_receta VALUES (5, 1, 'Antes del desayuno', 5, 5, 7, 7, 'Evitar bebidas alcohólicas', 1);
INSERT INTO public.detalle_receta VALUES (9, 1, 'Antes de dormir', 9, 4, 7, 7, 'Tomar antes de dormir', 1);


--
-- TOC entry 5124 (class 0 OID 16755)
-- Dependencies: 243
-- Data for Name: empleado_administrativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empleado_administrativo VALUES (1, 'Sandra Ruiz', 'Recepcionista', 5, 1, '700001', 'Ruiz', '3201112233', 'sandra@hospital.com', 2, '2024-01-10', true);
INSERT INTO public.empleado_administrativo VALUES (2, 'Felipe Moreno', 'Administrador', 5, 1, '700002', 'Moreno', '3202223344', 'felipe@hospital.com', 1, '2024-01-15', true);
INSERT INTO public.empleado_administrativo VALUES (4, 'Mario Herrera', 'Coordinador', 2, 1, '700004', 'Herrera', '3204445566', 'mario@hospital.com', 4, '2024-02-10', true);
INSERT INTO public.empleado_administrativo VALUES (3, 'Carolina Vega', 'Auxiliar', 1, 1, '700003', 'Vega', '3203334455', 'carolina@hospital.com', 3, '2024-02-01', false);
INSERT INTO public.empleado_administrativo VALUES (5, 'Paula Diaz', 'Secretaria', 3, 1, '700005', 'Diaz', '3205556677', 'paula@hospital.com', 2, '2024-03-01', false);


--
-- TOC entry 5142 (class 0 OID 16948)
-- Dependencies: 263
-- Data for Name: enfermedad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enfermedad VALUES (1, 'Diabetes', 'Cronica', 'Nivel alto de glucosa', true);
INSERT INTO public.enfermedad VALUES (2, 'Hipertension', 'Cronica', 'Presion arterial alta', true);
INSERT INTO public.enfermedad VALUES (3, 'Gripe', 'General', 'Infeccion respiratoria', true);
INSERT INTO public.enfermedad VALUES (4, 'Asma', 'Cronica', 'Problema respiratorio', true);
INSERT INTO public.enfermedad VALUES (5, 'Migraña', 'General', 'Dolor fuerte de cabeza', true);


--
-- TOC entry 5138 (class 0 OID 16882)
-- Dependencies: 257
-- Data for Name: enfermero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enfermero VALUES (1, 1, '1023456781', 'Laura', 'Gomez', '3001112233', 'laura@hospital.com', 1, 1, '2024-01-15', true);
INSERT INTO public.enfermero VALUES (2, 1, '2045678912', 'Carlos', 'Ruiz', '3012223344', 'carlos@hospital.com', 2, 2, '2024-02-10', true);
INSERT INTO public.enfermero VALUES (3, 1, '91456327', 'Ana', 'Martinez', '3023334455', 'ana@hospital.com', 3, 3, '2024-03-05', true);
INSERT INTO public.enfermero VALUES (4, 1, '1034567823', 'Sofia', 'Lopez', '3034445566', 'sofia@hospital.com', 1, 4, '2024-01-20', true);
INSERT INTO public.enfermero VALUES (5, 1, '2156789034', 'Miguel', 'Torres', '3045556677', 'miguel@hospital.com', 2, 5, '2024-02-18', true);
INSERT INTO public.enfermero VALUES (6, 1, '52347891', 'Valentina', 'Castro', '3056667788', 'valentina@hospital.com', 3, 6, '2024-03-12', true);
INSERT INTO public.enfermero VALUES (7, 1, '1019876543', 'Daniel', 'Rojas', '3067778899', 'daniel@hospital.com', 1, 7, '2024-04-01', true);
INSERT INTO public.enfermero VALUES (8, 1, '3076543210', 'Camila', 'Herrera', '3078889900', 'camila@hospital.com', 2, 8, '2024-04-10', true);
INSERT INTO public.enfermero VALUES (9, 1, '79945612', 'Julian', 'Morales', '3089990011', 'julian@hospital.com', 3, 1, '2024-04-25', true);
INSERT INTO public.enfermero VALUES (10, 1, '1098765432', 'Natalia', 'Mejia', '3091112233', 'natalia@hospital.com', 1, 2, '2024-05-02', true);


--
-- TOC entry 5120 (class 0 OID 16741)
-- Dependencies: 239
-- Data for Name: eps; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.eps VALUES (1, 'Sanitas', '6011111111');
INSERT INTO public.eps VALUES (2, 'Nueva EPS', '6012222222');
INSERT INTO public.eps VALUES (3, 'Sura', '6013333333');
INSERT INTO public.eps VALUES (4, 'Compensar', '6014444444');


--
-- TOC entry 5136 (class 0 OID 16824)
-- Dependencies: 255
-- Data for Name: especialidad_medica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especialidad_medica VALUES (1, 'Cardiologia', NULL, true);
INSERT INTO public.especialidad_medica VALUES (2, 'Pediatria', NULL, true);
INSERT INTO public.especialidad_medica VALUES (3, 'Dermatologia', NULL, true);
INSERT INTO public.especialidad_medica VALUES (4, 'Neurologia', NULL, true);
INSERT INTO public.especialidad_medica VALUES (5, 'Medicina General', NULL, true);
INSERT INTO public.especialidad_medica VALUES (6, 'Ginecologia', NULL, true);
INSERT INTO public.especialidad_medica VALUES (7, 'Ortopedia', NULL, true);


--
-- TOC entry 5132 (class 0 OID 16808)
-- Dependencies: 251
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado VALUES (1, 'Disponible', 'Habitacion', 'Habitacion disponible', 'Activo');
INSERT INTO public.estado VALUES (2, 'Ocupada', 'Habitacion', 'Habitacion ocupada', 'Activo');
INSERT INTO public.estado VALUES (3, 'Mantenimiento', 'Habitacion', 'Habitacion en mantenimiento', 'Activo');
INSERT INTO public.estado VALUES (4, 'Activa', 'Hospitalizacion', 'Hospitalizacion activa', 'Activo');
INSERT INTO public.estado VALUES (5, 'Finalizada', 'Hospitalizacion', 'Hospitalizacion finalizada', 'Activo');


--
-- TOC entry 5110 (class 0 OID 16670)
-- Dependencies: 228
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura VALUES (1, '2026-05-15', 150000.00, 'Pagado', 1);
INSERT INTO public.factura VALUES (2, '2026-05-15', 200000.00, 'Pendiente', 2);
INSERT INTO public.factura VALUES (3, '2026-05-16', 175000.00, 'Pagado', 3);
INSERT INTO public.factura VALUES (4, '2026-05-16', 300000.00, 'Pendiente', 4);
INSERT INTO public.factura VALUES (5, '2026-05-17', 120000.00, 'Pagado', 5);
INSERT INTO public.factura VALUES (6, '2026-05-17', 250000.00, 'Pagado', 6);
INSERT INTO public.factura VALUES (7, '2026-05-18', 180000.00, 'Pendiente', 7);
INSERT INTO public.factura VALUES (8, '2026-05-18', 95000.00, 'Pagado', 8);
INSERT INTO public.factura VALUES (9, '2026-05-19', 400000.00, 'Pendiente', 9);
INSERT INTO public.factura VALUES (10, '2026-05-19', 220000.00, 'Pagado', 10);
INSERT INTO public.factura VALUES (11, '2026-05-20', 160000.00, 'Pendiente', 11);
INSERT INTO public.factura VALUES (12, '2026-05-20', 140000.00, 'Pagado', 12);
INSERT INTO public.factura VALUES (13, '2026-05-21', 310000.00, 'Pendiente', 13);
INSERT INTO public.factura VALUES (14, '2026-06-01', 250000.00, 'Pagado', 1);


--
-- TOC entry 5146 (class 0 OID 16979)
-- Dependencies: 267
-- Data for Name: frecuencia_medicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.frecuencia_medicamento VALUES (1, 'Cada 6 horas', 6, true);
INSERT INTO public.frecuencia_medicamento VALUES (2, 'Cada 8 horas', 8, true);
INSERT INTO public.frecuencia_medicamento VALUES (3, 'Cada 12 horas', 12, true);
INSERT INTO public.frecuencia_medicamento VALUES (4, 'Cada 24 horas', 24, true);
INSERT INTO public.frecuencia_medicamento VALUES (5, 'Una vez al dia', 24, true);


--
-- TOC entry 5148 (class 0 OID 17032)
-- Dependencies: 270
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitacion VALUES (1, '101', 1, 'General', 2, 1);
INSERT INTO public.habitacion VALUES (2, '102', 1, 'Privada', 1, 2);
INSERT INTO public.habitacion VALUES (3, '201', 2, 'UCI', 1, 1);


--
-- TOC entry 5108 (class 0 OID 16656)
-- Dependencies: 226
-- Data for Name: historia_clinica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historia_clinica VALUES (1, 'Gripe', 'Acetaminofen', '2026-05-10', 1);
INSERT INTO public.historia_clinica VALUES (2, 'Migraña', 'Ibuprofeno', '2026-05-11', 2);
INSERT INTO public.historia_clinica VALUES (3, 'Alergia', 'Antihistaminicos', '2026-05-12', 3);
INSERT INTO public.historia_clinica VALUES (4, 'Dolor muscular', 'Reposo', '2026-05-13', 4);
INSERT INTO public.historia_clinica VALUES (5, 'Hipertension', 'Control medico', '2026-05-14', 5);
INSERT INTO public.historia_clinica VALUES (6, 'Faringitis', 'Antibioticos', '2026-05-15', 6);
INSERT INTO public.historia_clinica VALUES (7, 'Gastritis', 'Omeprazol', '2026-05-16', 7);
INSERT INTO public.historia_clinica VALUES (8, 'Ansiedad', 'Terapia', '2026-05-17', 8);
INSERT INTO public.historia_clinica VALUES (9, 'Fractura leve', 'Yeso y reposo', '2026-05-18', 9);
INSERT INTO public.historia_clinica VALUES (10, 'Dermatitis', 'Crema dermatologica', '2026-05-19', 10);
INSERT INTO public.historia_clinica VALUES (11, 'Diabetes', 'Insulina', '2026-05-20', 11);
INSERT INTO public.historia_clinica VALUES (12, 'Infeccion respiratoria', 'Jarabe', '2026-05-21', 12);
INSERT INTO public.historia_clinica VALUES (13, 'Asma', 'Inhaladores', '2026-05-22', 13);


--
-- TOC entry 5152 (class 0 OID 17063)
-- Dependencies: 274
-- Data for Name: hospitalizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hospitalizacion VALUES (1, '2026-05-20 08:00:00', '2026-05-25 10:00:00', 'Cirugia menor', 5, 1, 2);
INSERT INTO public.hospitalizacion VALUES (44, '2026-06-04 07:45:00', '2026-06-08 09:20:00', 'Bronquitis aguda', 5, 1, 5);
INSERT INTO public.hospitalizacion VALUES (46, '2026-06-06 15:10:00', '2026-06-10 10:00:00', 'Gastroenteritis', 5, 3, 7);
INSERT INTO public.hospitalizacion VALUES (48, '2026-06-08 17:25:00', '2026-06-12 14:00:00', 'Infeccion respiratoria', 5, 5, 9);
INSERT INTO public.hospitalizacion VALUES (50, '2026-06-10 11:15:00', '2026-06-14 08:30:00', 'Anemia severa', 5, 7, 11);
INSERT INTO public.hospitalizacion VALUES (2, '2026-05-22 14:00:00', '2026-05-27 14:00:00', 'Observacion medica', 4, 2, 4);
INSERT INTO public.hospitalizacion VALUES (45, '2026-06-05 12:30:00', '2026-06-10 12:30:00', 'Hipertension arterial', 4, 2, 6);
INSERT INTO public.hospitalizacion VALUES (47, '2026-06-07 08:00:00', '2026-06-12 08:00:00', 'Control neurologico', 4, 4, 8);
INSERT INTO public.hospitalizacion VALUES (49, '2026-06-09 09:40:00', '2026-06-14 09:40:00', 'Recuperacion postquirurgica', 4, 6, 10);
INSERT INTO public.hospitalizacion VALUES (51, '2026-06-11 13:50:00', '2026-06-16 13:50:00', 'Control de glucosa', 4, 8, 12);


--
-- TOC entry 5114 (class 0 OID 16703)
-- Dependencies: 233
-- Data for Name: medicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medicamento VALUES (1, 'Acetaminofen', 'Dolor y fiebre', 50, 'MED001', '2027-01-10', 12000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (2, 'Ibuprofeno', 'Inflamacion', 40, 'MED002', '2027-03-15', 18000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (3, 'Amoxicilina', 'Antibiotico', 35, 'MED003', '2026-08-20', 25000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (4, 'Loratadina', 'Alergias', 25, 'MED004', '2027-01-15', 15000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (5, 'Omeprazol', 'Gastritis', 30, 'MED005', '2026-11-10', 22000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (6, 'Insulina', 'Control diabetes', 20, 'MED006', '2027-05-30', 80000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (7, 'Salbutamol', 'Asma', 18, 'MED007', '2026-09-18', 35000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (8, 'Diclofenaco', 'Dolor muscular', 28, 'MED008', '2026-12-01', 17000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (9, 'Azitromicina', 'Infecciones respiratorias', 22, 'MED009', '2027-02-14', 28000.00, 'Disponible');
INSERT INTO public.medicamento VALUES (10, 'Vitamina C', 'Suplemento', 45, 'MED010', '2026-10-25', 9000.00, 'Disponible');


--
-- TOC entry 5100 (class 0 OID 16616)
-- Dependencies: 218
-- Data for Name: medico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medico VALUES (8, 'Andrés', 'Cardiología', '3104567890', 1, '900010', 'Pérez', 'andres.perez@hospital.com', 'MED010', 1, 2, '2024-01-10', 'Activo');
INSERT INTO public.medico VALUES (9, 'María', 'Pediatría', '3115678901', 1, '900011', 'Díaz', 'maria.diaz@hospital.com', 'MED011', 2, 3, '2024-02-15', 'Activo');
INSERT INTO public.medico VALUES (10, 'Jorge', 'Neurología', '3126789012', 1, '900012', 'Silva', 'jorge.silva@hospital.com', 'MED012', 3, 4, '2024-03-20', 'Activo');
INSERT INTO public.medico VALUES (11, 'Luisa', 'Dermatología', '3137890123', 1, '900013', 'Fernández', 'luisa.fernandez@hospital.com', 'MED013', 4, 5, '2024-04-01', 'Activo');
INSERT INTO public.medico VALUES (12, 'Ricardo', 'Oncología', '3148901234', 1, '900014', 'Gómez', 'ricardo.gomez@hospital.com', 'MED014', 5, 6, '2024-05-12', 'Activo');
INSERT INTO public.medico VALUES (13, 'Patricia', 'Ginecología', '3159012345', 1, '900015', 'León', 'patricia.leon@hospital.com', 'MED015', 6, 7, '2024-06-08', 'Activo');
INSERT INTO public.medico VALUES (14, 'Óscar', 'Traumatología', '3160123456', 1, '900016', 'Medina', 'oscar.medina@hospital.com', 'MED016', 7, 8, '2024-07-15', 'Activo');
INSERT INTO public.medico VALUES (15, 'Camila', 'Cardiología', '3171234567', 1, '900017', 'Ramírez', 'camila.ramirez@hospital.com', 'MED017', 1, 2, '2024-08-20', 'Activo');
INSERT INTO public.medico VALUES (16, 'Felipe', 'Pediatría', '3182345678', 1, '900018', 'Torres', 'felipe.torres@hospital.com', 'MED018', 2, 3, '2024-09-11', 'Activo');
INSERT INTO public.medico VALUES (17, 'Valentina', 'Neurología', '3193456789', 1, '900019', 'Castro', 'valentina.castro@hospital.com', 'MED019', 3, 4, '2024-10-02', 'Activo');
INSERT INTO public.medico VALUES (1, 'Patricia', 'Cardiologia', '3101112233', 1, '900001', 'Perez', 'andres@hospital.com', 'MED001', 1, 2, '2024-01-10', 'Activo');
INSERT INTO public.medico VALUES (2, 'Maria', 'Pediatria', '3112223344', 1, '900002', 'Diaz', 'maria@hospital.com', 'MED002', 2, 3, '2024-02-15', 'Activo');
INSERT INTO public.medico VALUES (4, 'Luisa', 'Neurologia', '3134445566', 1, '900004', 'Fernandez', 'luisa@hospital.com', 'MED004', 4, 5, '2024-04-01', 'Activo');
INSERT INTO public.medico VALUES (5, 'Ricardo', 'Medicina General', '3145556677', 1, '900005', 'Gomez', 'ricardo@hospital.com', 'MED005', 5, 6, '2024-05-12', 'Activo');
INSERT INTO public.medico VALUES (7, 'Oscar', 'Ortopedia', '3162223344', 1, '900007', 'Medina', 'oscar@hospital.com', 'MED007', 7, 8, '2024-07-15', 'Activo');
INSERT INTO public.medico VALUES (3, 'Jorge', 'Dermatologia', '3123334455', 1, '900003', 'Silva', 'jorge@hospital.com', 'MED003', 3, 4, '2024-03-20', 'Inactivo');
INSERT INTO public.medico VALUES (6, 'Patricia', 'Ginecologia', '3151112233', 1, '900006', 'Leon', 'patricia@hospital.com', 'MED006', 6, 7, '2024-06-08', 'Inactivo');


--
-- TOC entry 5140 (class 0 OID 16933)
-- Dependencies: 261
-- Data for Name: motivo_cita; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.motivo_cita VALUES (1, 'Consulta General', 'Revision medica general', 'Media', true);
INSERT INTO public.motivo_cita VALUES (2, 'Urgencia', 'Atencion inmediata', 'Alta', true);
INSERT INTO public.motivo_cita VALUES (3, 'Control', 'Seguimiento medico', 'Baja', true);
INSERT INTO public.motivo_cita VALUES (4, 'Examenes', 'Revision de resultados', 'Media', true);
INSERT INTO public.motivo_cita VALUES (5, 'Dolor', 'Evaluacion de dolor', 'Alta', true);
INSERT INTO public.motivo_cita VALUES (6, 'Control general', 'Revision rutinaria', 'Baja', true);
INSERT INTO public.motivo_cita VALUES (7, 'Dolor', 'Dolor en el cuerpo', 'Media', true);
INSERT INTO public.motivo_cita VALUES (8, 'Fiebre', 'Temperatura alta', 'Alta', true);
INSERT INTO public.motivo_cita VALUES (9, 'Chequeo', 'Revision medica', 'Baja', true);
INSERT INTO public.motivo_cita VALUES (10, 'Urgencia', 'Atencion inmediata', 'Alta', true);


--
-- TOC entry 5098 (class 0 OID 16609)
-- Dependencies: 216
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paciente VALUES (29, 'Juan', 'Pérez', '3104567890', 'juan.perez@gmail.com', '1995-03-15', 1, '100000301', 'Masculino', 'Calle 72 #10-45, Bogotá', 'O+', '2026-05-20 22:19:10', 1, 'Activo');
INSERT INTO public.paciente VALUES (30, 'María', 'Gómez', '3115678901', 'maria.gomez@gmail.com', '1998-07-21', 2, '100000302', 'Femenino', 'Carrera 15 #93-20, Bogotá', 'A+', '2026-05-20 22:19:10', 2, 'Activo');
INSERT INTO public.paciente VALUES (31, 'Carlos', 'Rodríguez', '3126789012', 'carlos.rodriguez@gmail.com', '1992-11-09', 1, '100000303', 'Masculino', 'Avenida Boyacá #63-18, Bogotá', 'B+', '2026-05-20 22:19:10', 3, 'Activo');
INSERT INTO public.paciente VALUES (32, 'Laura', 'Martínez', '3137890123', 'laura.martinez@gmail.com', '2000-05-12', 3, '100000304', 'Femenino', 'Calle 127 #45-60, Bogotá', 'AB+', '2026-05-20 22:19:10', 1, 'Activo');
INSERT INTO public.paciente VALUES (33, 'Andrés', 'López', '3148901234', 'andres.lopez@gmail.com', '1994-08-30', 1, '100000305', 'Masculino', 'Carrera 7 #134-25, Bogotá', 'O-', '2026-05-20 22:19:10', 2, 'Activo');
INSERT INTO public.paciente VALUES (34, 'Sofía', 'Ramírez', '3159012345', 'sofia.ramirez@gmail.com', '1999-01-18', 2, '100000306', 'Femenino', 'Calle 26 #68-44, Bogotá', 'A-', '2026-05-20 22:19:10', 3, 'Activo');
INSERT INTO public.paciente VALUES (35, 'David', 'Torres', '3160123456', 'david.torres@gmail.com', '1991-06-25', 1, '100000307', 'Masculino', 'Carrera 30 #52-15, Bogotá', 'B-', '2026-05-20 22:19:10', 1, 'Activo');
INSERT INTO public.paciente VALUES (36, 'Valentina', 'Castro', '3171234567', 'valentina.castro@gmail.com', '2001-09-14', 3, '100000308', 'Femenino', 'Calle 80 #24-90, Bogotá', 'AB-', '2026-05-20 22:19:10', 2, 'Activo');
INSERT INTO public.paciente VALUES (37, 'Sebastián', 'Moreno', '3182345678', 'sebastian.moreno@gmail.com', '1993-12-05', 1, '100000309', 'Masculino', 'Avenida Suba #100-12, Bogotá', 'O+', '2026-05-20 22:19:10', 3, 'Activo');
INSERT INTO public.paciente VALUES (38, 'Camila', 'Herrera', '3193456789', 'camila.herrera@gmail.com', '1997-04-27', 2, '100000310', 'Femenino', 'Carrera 68 #40-55, Bogotá', 'A+', '2026-05-20 22:19:10', 1, 'Activo');
INSERT INTO public.paciente VALUES (39, 'Mateo', 'Vargas', '3204567891', 'mateo.vargas@gmail.com', '1990-10-10', 1, '100000311', 'Masculino', 'Calle 53 #19-70, Bogotá', 'B+', '2026-05-20 22:19:10', 2, 'Activo');
INSERT INTO public.paciente VALUES (40, 'Isabella', 'Rojas', '3215678902', 'isabella.rojas@gmail.com', '2002-02-22', 3, '100000312', 'Femenino', 'Carrera 50 #22-18, Bogotá', 'AB+', '2026-05-20 22:19:10', 3, 'Activo');
INSERT INTO public.paciente VALUES (41, 'Nicolás', 'Jiménez', '3226789013', 'nicolas.jimenez@gmail.com', '1996-07-07', 1, '100000313', 'Masculino', 'Calle 170 #8-30, Bogotá', 'O-', '2026-05-20 22:19:10', 1, 'Activo');
INSERT INTO public.paciente VALUES (2, 'Carlos', 'Ramirez', '3012223344', 'carlos@gmail.com', '1998-08-15', 2, '100000002', 'Masculino', 'Calle 80 # 72-15, Bogotá', 'A+', '2026-05-03 10:15:00', 2, 'Activo');
INSERT INTO public.paciente VALUES (3, 'Ana', 'Martinez', '3023334455', 'ana@gmail.com', '1995-11-20', 1, '100000003', 'Femenino', 'Cra 13 # 56-40, Bogotá', 'B+', '2026-05-05 14:20:00', 3, 'Activo');
INSERT INTO public.paciente VALUES (4, 'Sofia', 'Lopez', '3034445566', 'sofia@gmail.com', '2001-01-12', 3, '100000004', 'Femenino', 'Calle 26 # 98-12, Bogotá', 'AB+', '2026-05-06 09:10:00', 1, 'Inactivo');
INSERT INTO public.paciente VALUES (5, 'Miguel', 'Torres', '3045556677', 'miguel@gmail.com', '1992-06-30', 1, '100000005', 'Masculino', 'Cra 68 # 24-35, Bogotá', 'O-', '2026-05-08 16:40:00', 2, 'Activo');
INSERT INTO public.paciente VALUES (6, 'Valentina', 'Castro', '3056667788', 'vale@gmail.com', '1999-03-08', 2, '100000006', 'Femenino', 'Calle 170 # 8-55, Bogotá', 'A-', '2026-05-10 11:25:00', 3, 'Activo');
INSERT INTO public.paciente VALUES (7, 'Daniel', 'Rojas', '3067778899', 'daniel@gmail.com', '1997-09-14', 1, '100000007', 'Masculino', 'Cra 10 # 22-40, Bogotá', 'B-', '2026-05-12 07:50:00', 1, 'Activo');
INSERT INTO public.paciente VALUES (8, 'Camila', 'Herrera', '3078889900', 'camila@gmail.com', '2002-04-18', 3, '100000008', 'Femenino', 'Calle 127 # 15-60, Bogotá', 'AB-', '2026-05-14 15:00:00', 2, 'Inactivo');
INSERT INTO public.paciente VALUES (9, 'Julian', 'Morales', '3089990011', 'julian@gmail.com', '1996-07-22', 1, '100000009', 'Masculino', 'Cra 30 # 63-19, Bogotá', 'O+', '2026-05-15 13:35:00', 3, 'Activo');
INSERT INTO public.paciente VALUES (10, 'Camila', 'Herrera', '3078889000', 'camila@gmail.com', '2002-04-18', 2, '1000000010', 'Femenino', 'Calle 53 # 27-44, Bogotá', 'A+', '2026-05-17 10:00:00', 1, 'Activo');
INSERT INTO public.paciente VALUES (11, 'Sebastian', 'Ruiz', '3107772233', 'sebastian@gmail.com', '1994-10-01', 1, '1000000011', 'Masculino', 'Cra 5 # 12-80, Soacha', 'B+', '2026-05-18 12:45:00', 2, 'Activo');
INSERT INTO public.paciente VALUES (12, 'Natalia', 'Mejia', '3116663344', 'natalia@gmail.com', '1998-12-09', 3, '1000000012', 'Femenino', 'Calle 134 # 19-22, Bogotá', 'O-', '2026-05-19 17:20:00', 3, 'Activo');
INSERT INTO public.paciente VALUES (13, 'Felipe', 'Cruz', '3125554455', 'felipe@gmail.com', '1991-05-17', 1, '1000000013', 'Masculino', 'Cra 50 # 90-11, Bogotá', 'AB+', '2026-05-20 08:15:00', 1, 'Activo');
INSERT INTO public.paciente VALUES (1, 'Laura', 'Gomez', '3001112233', 'laura@gmail.com', '2000-05-10', 1, '100000001', 'Femenino', 'Cra 7 # 45-23 Sur, Soacha', 'O+', '2026-05-01 08:30:00', 1, 'Activo');
INSERT INTO public.paciente VALUES (42, 'Gabriela', 'Navarro', '3237890124', 'gabriela.navarro@gmail.com', '1998-09-16', 2, '100000314', 'Femenino', 'Carrera 9 #116-45, Bogotá', 'A-', '2026-05-20 22:19:10', 2, 'Activo');
INSERT INTO public.paciente VALUES (43, 'Felipe', 'Ruiz', '3248901235', 'felipe.ruiz@gmail.com', '1991-01-29', 1, '100000315', 'Masculino', 'Calle 100 #15-80, Bogotá', 'B-', '2026-05-20 22:19:10', 3, 'Activo');
INSERT INTO public.paciente VALUES (44, 'Claudia ', 'Mendoza', '3022294344', 'claudia.5@gmail.com', '1982-06-23', NULL, '28956874', 'Femenino', 'Cra. 97c #71-47', 'O+', '2026-05-21 01:07:11.541746', NULL, 'Activo');


--
-- TOC entry 5144 (class 0 OID 16958)
-- Dependencies: 265
-- Data for Name: paciente_enfermedad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paciente_enfermedad VALUES (1, '2026-05-20', 'Control estable', true, 1, 1);
INSERT INTO public.paciente_enfermedad VALUES (2, '2026-05-21', 'Paciente medicado', true, 2, 2);
INSERT INTO public.paciente_enfermedad VALUES (3, '2026-05-22', 'Reposo recomendado', true, 3, 3);


--
-- TOC entry 5112 (class 0 OID 16691)
-- Dependencies: 231
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pago VALUES (1, 'Tarjeta', '2026-05-15', 150000.00, 1);
INSERT INTO public.pago VALUES (2, 'Efectivo', '2026-05-16', 175000.00, 3);
INSERT INTO public.pago VALUES (3, 'Transferencia', '2026-05-17', 120000.00, 5);
INSERT INTO public.pago VALUES (4, 'Tarjeta', '2026-05-17', 250000.00, 6);
INSERT INTO public.pago VALUES (5, 'Nequi', '2026-05-18', 95000.00, 8);
INSERT INTO public.pago VALUES (6, 'Transferencia', '2026-05-19', 220000.00, 10);
INSERT INTO public.pago VALUES (7, 'Efectivo', '2026-05-20', 140000.00, 12);
INSERT INTO public.pago VALUES (8, 'Tarjeta', '2026-06-01', 250000.00, 6);


--
-- TOC entry 5116 (class 0 OID 16712)
-- Dependencies: 235
-- Data for Name: receta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.receta VALUES (1, '2026-05-20', 1, 'Tomar despues de cada comida', 'Activa', 1);
INSERT INTO public.receta VALUES (2, '2026-05-20', 2, 'Tomar despues de cada comida', 'Activa', 1);
INSERT INTO public.receta VALUES (3, '2026-05-21', 3, 'Reposo y buena hidratacion', 'Activa', 2);
INSERT INTO public.receta VALUES (4, '2026-05-21', 4, 'Tomar medicamento cada 8 horas', 'Activa', 3);
INSERT INTO public.receta VALUES (5, '2026-05-22', 5, 'Evitar comidas grasosas', 'Activa', 4);
INSERT INTO public.receta VALUES (6, '2026-05-22', 6, 'Pendiente de indicaciones médicas', 'Activa', 5);
INSERT INTO public.receta VALUES (7, '2026-05-23', 7, 'Pendiente de indicaciones médicas', 'Activa', 6);
INSERT INTO public.receta VALUES (8, '2026-05-23', 8, 'Pendiente de indicaciones médicas', 'Activa', 7);
INSERT INTO public.receta VALUES (9, '2026-05-24', 9, 'Pendiente de indicaciones médicas', 'Activa', 8);
INSERT INTO public.receta VALUES (10, '2026-05-24', 10, 'Pendiente de indicaciones médicas', 'Activa', 9);
INSERT INTO public.receta VALUES (11, '2026-05-25', 11, 'Pendiente de indicaciones médicas', 'Activa', 10);
INSERT INTO public.receta VALUES (12, '2026-05-25', 12, 'Pendiente de indicaciones médicas', 'Activa', 11);
INSERT INTO public.receta VALUES (13, '2026-05-26', 13, 'Pendiente de indicaciones médicas', 'Activa', 12);


--
-- TOC entry 5134 (class 0 OID 16816)
-- Dependencies: 253
-- Data for Name: rol_hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rol_hospital VALUES (1, 'Administrador', 'Control total del sistema', 1, true);
INSERT INTO public.rol_hospital VALUES (2, 'Recepcionista', 'Gestion de citas y pacientes', 2, true);
INSERT INTO public.rol_hospital VALUES (3, 'Auxiliar', 'Apoyo administrativo', 3, true);
INSERT INTO public.rol_hospital VALUES (4, 'Coordinador', 'Supervision de areas', 2, true);


--
-- TOC entry 5154 (class 0 OID 17087)
-- Dependencies: 276
-- Data for Name: salario_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salario_personal VALUES (1, 'Medico', 1, 8000000.00, '2025-01-01', '2026-05-20', false);
INSERT INTO public.salario_personal VALUES (2, 'Enfermero', 1, 3500000.00, '2025-01-01', '2026-05-20', false);
INSERT INTO public.salario_personal VALUES (3, 'Administrativo', 1, 2800000.00, '2025-01-01', '2026-05-20', false);
INSERT INTO public.salario_personal VALUES (4, 'Medico', 1, 8000000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (5, 'Medico', 2, 7500000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (6, 'Medico', 3, 7200000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (7, 'Medico', 4, 8300000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (8, 'Medico', 5, 7000000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (9, 'Medico', 6, 7600000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (10, 'Medico', 7, 7100000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (11, 'Enfermero', 1, 3500000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (12, 'Enfermero', 2, 3400000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (13, 'Enfermero', 3, 3600000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (14, 'Enfermero', 1, 3500000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (15, 'Enfermero', 2, 3400000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (16, 'Enfermero', 3, 3600000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (17, 'Enfermero', 4, 3550000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (18, 'Enfermero', 5, 3450000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (19, 'Enfermero', 6, 3700000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (20, 'Enfermero', 7, 3650000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (21, 'Enfermero', 8, 3500000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (22, 'Enfermero', 9, 3400000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (23, 'Enfermero', 10, 3750000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (24, 'Administrativo', 1, 2800000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (25, 'Administrativo', 2, 3000000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (26, 'Administrativo', 3, 2500000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (27, 'Administrativo', 4, 3200000.00, '2025-01-01', NULL, true);
INSERT INTO public.salario_personal VALUES (28, 'Administrativo', 5, 2600000.00, '2025-01-01', NULL, true);


--
-- TOC entry 5128 (class 0 OID 16790)
-- Dependencies: 247
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_documento VALUES (1, 'CC', 'Cedula', NULL, true);
INSERT INTO public.tipo_documento VALUES (2, 'TI', 'Tarjeta Identidad', NULL, true);
INSERT INTO public.tipo_documento VALUES (3, 'CE', 'Cedula Extranjeria', NULL, true);


--
-- TOC entry 5130 (class 0 OID 16800)
-- Dependencies: 249
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turno VALUES (1, 'Mañana', '06:00:00', '14:00:00', 'Turno mañana', true);
INSERT INTO public.turno VALUES (2, 'Tarde', '14:00:00', '22:00:00', 'Turno tarde', true);
INSERT INTO public.turno VALUES (3, 'Noche', '22:00:00', '06:00:00', 'Turno noche', true);


--
-- TOC entry 5104 (class 0 OID 16641)
-- Dependencies: 222
-- Data for Name: usuario_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 223
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditoria_id_auditoria_seq', 31, true);


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 271
-- Name: cama_id_cama_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cama_id_cama_seq', 12, true);


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 219
-- Name: cita_id_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cita_id_cita_seq', 49, true);


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 244
-- Name: consulta_id_consulta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consulta_id_consulta_seq', 13, true);


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 240
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 9, true);


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 236
-- Name: detalle_receta_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_receta_id_detalle_seq', 13, true);


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 242
-- Name: empleado_administrativo_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_administrativo_id_empleado_seq', 5, true);


--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 262
-- Name: enfermedad_id_enfermedad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enfermedad_id_enfermedad_seq', 5, true);


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 256
-- Name: enfermero_id_enfermero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enfermero_id_enfermero_seq', 10, true);


--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 238
-- Name: eps_id_eps_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eps_id_eps_seq', 4, true);


--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 254
-- Name: especialidad_medica_id_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidad_medica_id_especialidad_seq', 7, true);


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 250
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_id_estado_seq', 5, true);


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 227
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_factura_seq', 15, true);


--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 266
-- Name: frecuencia_medicamento_id_frecuencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.frecuencia_medicamento_id_frecuencia_seq', 5, true);


--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 269
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitacion_id_habitacion_seq', 3, true);


--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 225
-- Name: historia_clinica_id_historia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historia_clinica_id_historia_seq', 13, true);


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 273
-- Name: hospitalizacion_id_hospitalizacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospitalizacion_id_hospitalizacion_seq', 51, true);


--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 232
-- Name: medicamento_id_medicamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicamento_id_medicamento_seq', 10, true);


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 217
-- Name: medico_id_medico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medico_id_medico_seq', 17, true);


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 260
-- Name: motivo_cita_id_motivo_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.motivo_cita_id_motivo_cita_seq', 10, true);


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 264
-- Name: paciente_enfermedad_id_paciente_enfermedad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paciente_enfermedad_id_paciente_enfermedad_seq', 3, true);


--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 215
-- Name: paciente_id_paciente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 44, true);


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 230
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_pago_seq', 8, true);


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 234
-- Name: receta_id_receta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receta_id_receta_seq', 13, true);


--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 252
-- Name: rol_hospital_id_rol_hospital_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_hospital_id_rol_hospital_seq', 4, true);


--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 275
-- Name: salario_personal_id_salario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salario_personal_id_salario_seq', 28, true);


--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_documento_id_tipo_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_documento_id_tipo_documento_seq', 3, true);


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 248
-- Name: turno_id_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turno_id_turno_seq', 3, true);


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 221
-- Name: usuario_sistema_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_sistema_id_usuario_seq', 1, false);


--
-- TOC entry 4859 (class 2606 OID 16654)
-- Name: auditoria auditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id_auditoria);


--
-- TOC entry 4909 (class 2606 OID 17051)
-- Name: cama cama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama
    ADD CONSTRAINT cama_pkey PRIMARY KEY (id_cama);


--
-- TOC entry 4855 (class 2606 OID 16629)
-- Name: cita cita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);


--
-- TOC entry 4879 (class 2606 OID 16774)
-- Name: consulta consulta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_pkey PRIMARY KEY (id_consulta);


--
-- TOC entry 4875 (class 2606 OID 16753)
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 4871 (class 2606 OID 16729)
-- Name: detalle_receta detalle_receta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_receta
    ADD CONSTRAINT detalle_receta_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 4877 (class 2606 OID 16760)
-- Name: empleado_administrativo empleado_administrativo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_administrativo
    ADD CONSTRAINT empleado_administrativo_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 4899 (class 2606 OID 16956)
-- Name: enfermedad enfermedad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermedad
    ADD CONSTRAINT enfermedad_pkey PRIMARY KEY (id_enfermedad);


--
-- TOC entry 4893 (class 2606 OID 16890)
-- Name: enfermero enfermero_documento_enfermero_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermero
    ADD CONSTRAINT enfermero_documento_enfermero_key UNIQUE (documento_enfermero);


--
-- TOC entry 4895 (class 2606 OID 16888)
-- Name: enfermero enfermero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermero
    ADD CONSTRAINT enfermero_pkey PRIMARY KEY (id_enfermero);


--
-- TOC entry 4873 (class 2606 OID 16746)
-- Name: eps eps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eps
    ADD CONSTRAINT eps_pkey PRIMARY KEY (id_eps);


--
-- TOC entry 4891 (class 2606 OID 16832)
-- Name: especialidad_medica especialidad_medica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad_medica
    ADD CONSTRAINT especialidad_medica_pkey PRIMARY KEY (id_especialidad);


--
-- TOC entry 4887 (class 2606 OID 16814)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 4863 (class 2606 OID 16675)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- TOC entry 4903 (class 2606 OID 16985)
-- Name: frecuencia_medicamento frecuencia_medicamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frecuencia_medicamento
    ADD CONSTRAINT frecuencia_medicamento_pkey PRIMARY KEY (id_frecuencia);


--
-- TOC entry 4905 (class 2606 OID 17039)
-- Name: habitacion habitacion_numero_habitacion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_numero_habitacion_key UNIQUE (numero_habitacion);


--
-- TOC entry 4907 (class 2606 OID 17037)
-- Name: habitacion habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id_habitacion);


--
-- TOC entry 4861 (class 2606 OID 16663)
-- Name: historia_clinica historia_clinica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica
    ADD CONSTRAINT historia_clinica_pkey PRIMARY KEY (id_historia);


--
-- TOC entry 4911 (class 2606 OID 17070)
-- Name: hospitalizacion hospitalizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitalizacion
    ADD CONSTRAINT hospitalizacion_pkey PRIMARY KEY (id_hospitalizacion);


--
-- TOC entry 4867 (class 2606 OID 16710)
-- Name: medicamento medicamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamento
    ADD CONSTRAINT medicamento_pkey PRIMARY KEY (id_medicamento);


--
-- TOC entry 4853 (class 2606 OID 16621)
-- Name: medico medico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (id_medico);


--
-- TOC entry 4897 (class 2606 OID 16941)
-- Name: motivo_cita motivo_cita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motivo_cita
    ADD CONSTRAINT motivo_cita_pkey PRIMARY KEY (id_motivo_cita);


--
-- TOC entry 4901 (class 2606 OID 16966)
-- Name: paciente_enfermedad paciente_enfermedad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_enfermedad
    ADD CONSTRAINT paciente_enfermedad_pkey PRIMARY KEY (id_paciente_enfermedad);


--
-- TOC entry 4851 (class 2606 OID 16614)
-- Name: paciente paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);


--
-- TOC entry 4865 (class 2606 OID 16696)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 4869 (class 2606 OID 16717)
-- Name: receta receta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT receta_pkey PRIMARY KEY (id_receta);


--
-- TOC entry 4889 (class 2606 OID 16822)
-- Name: rol_hospital rol_hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_hospital
    ADD CONSTRAINT rol_hospital_pkey PRIMARY KEY (id_rol_hospital);


--
-- TOC entry 4913 (class 2606 OID 17093)
-- Name: salario_personal salario_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salario_personal
    ADD CONSTRAINT salario_personal_pkey PRIMARY KEY (id_salario);


--
-- TOC entry 4881 (class 2606 OID 16798)
-- Name: tipo_documento tipo_documento_codigo_tipo_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_codigo_tipo_documento_key UNIQUE (codigo_tipo_documento);


--
-- TOC entry 4883 (class 2606 OID 16796)
-- Name: tipo_documento tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento);


--
-- TOC entry 4885 (class 2606 OID 16806)
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (id_turno);


--
-- TOC entry 4857 (class 2606 OID 16646)
-- Name: usuario_sistema usuario_sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_sistema
    ADD CONSTRAINT usuario_sistema_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4946 (class 2620 OID 16685)
-- Name: cita trigger_auditoria_cita; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_auditoria_cita AFTER INSERT ON public.cita FOR EACH ROW EXECUTE FUNCTION public.registrar_auditoria();


--
-- TOC entry 4941 (class 2606 OID 17057)
-- Name: cama fk_cama_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama
    ADD CONSTRAINT fk_cama_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado);


--
-- TOC entry 4942 (class 2606 OID 17052)
-- Name: cama fk_cama_habitacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cama
    ADD CONSTRAINT fk_cama_habitacion FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id_habitacion);


--
-- TOC entry 4919 (class 2606 OID 16942)
-- Name: cita fk_cita_motivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_cita_motivo FOREIGN KEY (id_motivo_cita) REFERENCES public.motivo_cita(id_motivo_cita);


--
-- TOC entry 4933 (class 2606 OID 16780)
-- Name: consulta fk_consulta_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT fk_consulta_medico FOREIGN KEY (id_medico) REFERENCES public.medico(id_medico);


--
-- TOC entry 4934 (class 2606 OID 16775)
-- Name: consulta fk_consulta_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT fk_consulta_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 4927 (class 2606 OID 16997)
-- Name: detalle_receta fk_detalle_frecuencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_receta
    ADD CONSTRAINT fk_detalle_frecuencia FOREIGN KEY (id_frecuencia) REFERENCES public.frecuencia_medicamento(id_frecuencia);


--
-- TOC entry 4928 (class 2606 OID 16735)
-- Name: detalle_receta fk_detalle_medicamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_receta
    ADD CONSTRAINT fk_detalle_medicamento FOREIGN KEY (id_medicamento) REFERENCES public.medicamento(id_medicamento);


--
-- TOC entry 4929 (class 2606 OID 16730)
-- Name: detalle_receta fk_detalle_receta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_receta
    ADD CONSTRAINT fk_detalle_receta FOREIGN KEY (id_receta) REFERENCES public.receta(id_receta);


--
-- TOC entry 4930 (class 2606 OID 16761)
-- Name: empleado_administrativo fk_empleado_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_administrativo
    ADD CONSTRAINT fk_empleado_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);


--
-- TOC entry 4931 (class 2606 OID 16922)
-- Name: empleado_administrativo fk_empleado_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_administrativo
    ADD CONSTRAINT fk_empleado_rol FOREIGN KEY (id_rol_hospital) REFERENCES public.rol_hospital(id_rol_hospital);


--
-- TOC entry 4932 (class 2606 OID 16917)
-- Name: empleado_administrativo fk_empleado_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_administrativo
    ADD CONSTRAINT fk_empleado_tipo_documento FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- TOC entry 4935 (class 2606 OID 16901)
-- Name: enfermero fk_enfermero_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermero
    ADD CONSTRAINT fk_enfermero_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);


--
-- TOC entry 4936 (class 2606 OID 16891)
-- Name: enfermero fk_enfermero_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermero
    ADD CONSTRAINT fk_enfermero_tipo_documento FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- TOC entry 4937 (class 2606 OID 16896)
-- Name: enfermero fk_enfermero_turno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enfermero
    ADD CONSTRAINT fk_enfermero_turno FOREIGN KEY (id_turno) REFERENCES public.turno(id_turno);


--
-- TOC entry 4923 (class 2606 OID 16676)
-- Name: factura fk_factura_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_factura_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 4940 (class 2606 OID 17040)
-- Name: habitacion fk_habitacion_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT fk_habitacion_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado);


--
-- TOC entry 4922 (class 2606 OID 16664)
-- Name: historia_clinica fk_historia_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_clinica
    ADD CONSTRAINT fk_historia_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 4943 (class 2606 OID 17081)
-- Name: hospitalizacion fk_hospitalizacion_cama; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitalizacion
    ADD CONSTRAINT fk_hospitalizacion_cama FOREIGN KEY (id_cama) REFERENCES public.cama(id_cama);


--
-- TOC entry 4944 (class 2606 OID 17071)
-- Name: hospitalizacion fk_hospitalizacion_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitalizacion
    ADD CONSTRAINT fk_hospitalizacion_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado);


--
-- TOC entry 4945 (class 2606 OID 17076)
-- Name: hospitalizacion fk_hospitalizacion_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospitalizacion
    ADD CONSTRAINT fk_hospitalizacion_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 4920 (class 2606 OID 16635)
-- Name: cita fk_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES public.medico(id_medico);


--
-- TOC entry 4916 (class 2606 OID 16871)
-- Name: medico fk_medico_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT fk_medico_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);


--
-- TOC entry 4917 (class 2606 OID 16866)
-- Name: medico fk_medico_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT fk_medico_especialidad FOREIGN KEY (id_especialidad) REFERENCES public.especialidad_medica(id_especialidad);


--
-- TOC entry 4918 (class 2606 OID 16861)
-- Name: medico fk_medico_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT fk_medico_tipo_documento FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- TOC entry 4921 (class 2606 OID 16630)
-- Name: cita fk_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 4914 (class 2606 OID 16842)
-- Name: paciente fk_paciente_eps; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT fk_paciente_eps FOREIGN KEY (id_eps) REFERENCES public.eps(id_eps);


--
-- TOC entry 4915 (class 2606 OID 16837)
-- Name: paciente fk_paciente_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT fk_paciente_tipo_documento FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento);


--
-- TOC entry 4924 (class 2606 OID 16697)
-- Name: pago fk_pago_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_factura FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura);


--
-- TOC entry 4938 (class 2606 OID 16972)
-- Name: paciente_enfermedad fk_pe_enfermedad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_enfermedad
    ADD CONSTRAINT fk_pe_enfermedad FOREIGN KEY (id_enfermedad) REFERENCES public.enfermedad(id_enfermedad);


--
-- TOC entry 4939 (class 2606 OID 16967)
-- Name: paciente_enfermedad fk_pe_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente_enfermedad
    ADD CONSTRAINT fk_pe_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 4925 (class 2606 OID 16990)
-- Name: receta fk_receta_consulta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT fk_receta_consulta FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);


--
-- TOC entry 4926 (class 2606 OID 16718)
-- Name: receta fk_receta_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT fk_receta_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE auditoria; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.auditoria TO auditor;


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE cita; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.cita TO auditor;


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE consulta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.consulta TO auditor;


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE departamento; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.departamento TO auditor;


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE detalle_receta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.detalle_receta TO auditor;


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE empleado_administrativo; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.empleado_administrativo TO auditor;


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE eps; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.eps TO auditor;


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE factura; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.factura TO auditor;


--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE historia_clinica; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.historia_clinica TO auditor;


--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE medicamento; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.medicamento TO auditor;


--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE medico; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.medico TO auditor;


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE paciente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.paciente TO auditor;


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE pago; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.pago TO auditor;


--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE receta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.receta TO auditor;


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE usuario_sistema; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.usuario_sistema TO auditor;


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE vista_citas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.vista_citas TO auditor;


-- Completed on 2026-05-21 10:11:17

--
-- PostgreSQL database dump complete
--

\unrestrict QwJBTHh8S7i0jGbdwf76eYwXrd12FLJ25nvEzQbfXz7s47Fb5Rg4uEWIZYmNiAW

