--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Contact; Type: TABLE; Schema: public; Owner: Brianna
--

CREATE TABLE "Contact" (
    id integer NOT NULL,
    type character varying NOT NULL,
    value character varying NOT NULL,
    user_id character varying
);


ALTER TABLE "Contact" OWNER TO "Brianna";

--
-- Name: Contact_id_seq; Type: SEQUENCE; Schema: public; Owner: Brianna
--

CREATE SEQUENCE "Contact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Contact_id_seq" OWNER TO "Brianna";

--
-- Name: Contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Brianna
--

ALTER SEQUENCE "Contact_id_seq" OWNED BY "Contact".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: Brianna
--

CREATE TABLE "User" (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth character varying,
    biography character varying
);


ALTER TABLE "User" OWNER TO "Brianna";

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: Brianna
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO "Brianna";

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Brianna
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: Contact id; Type: DEFAULT; Schema: public; Owner: Brianna
--

ALTER TABLE ONLY "Contact" ALTER COLUMN id SET DEFAULT nextval('"Contact_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: Brianna
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Data for Name: Contact; Type: TABLE DATA; Schema: public; Owner: Brianna
--

COPY "Contact" (id, type, value, user_id) FROM stdin;
1	email	kyle.coberly@galvanize.com	1
2	phone	911	1
3	email	cj.reynolds@galvanize.com	2
4	email	danny.fritz@galvanize.com	3
5	phone	0	3
6	email	roberto.ortega@galvanize.com	4
\.


--
-- Name: Contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Brianna
--

SELECT pg_catalog.setval('"Contact_id_seq"', 6, true);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: Brianna
--

COPY "User" (id, first_name, last_name, date_of_birth, biography) FROM stdin;
1	Kyle	Coberly	born on 2/18/1961	Web app developer, business dork, amateur economist
2	CJ	Reynolds	born on 4/28/2031	Does the man have the moustache, or does the moustache have the man?
3	Danny	Fritz	born on 9/15/1805	Definitely a human instructor, not a robot.
4	Roberto	Ortega	born on 10/17/2015	Llamas age faster than people.
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Brianna
--

SELECT pg_catalog.setval('"User_id_seq"', 4, true);


--
-- Name: Contact Contact_pkey; Type: CONSTRAINT; Schema: public; Owner: Brianna
--

ALTER TABLE ONLY "Contact"
    ADD CONSTRAINT "Contact_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: Brianna
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Contact; Type: ACL; Schema: public; Owner: Brianna
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "Contact" TO galvanize_admin;


--
-- Name: Contact_id_seq; Type: ACL; Schema: public; Owner: Brianna
--

GRANT ALL ON SEQUENCE "Contact_id_seq" TO galvanize_admin;


--
-- Name: User; Type: ACL; Schema: public; Owner: Brianna
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "User" TO galvanize_admin;


--
-- Name: User_id_seq; Type: ACL; Schema: public; Owner: Brianna
--

GRANT ALL ON SEQUENCE "User_id_seq" TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: Brianna
--

ALTER DEFAULT PRIVILEGES FOR ROLE "Brianna" IN SCHEMA public REVOKE ALL ON SEQUENCES  FROM "Brianna";
ALTER DEFAULT PRIVILEGES FOR ROLE "Brianna" IN SCHEMA public GRANT ALL ON SEQUENCES  TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: Brianna
--

ALTER DEFAULT PRIVILEGES FOR ROLE "Brianna" IN SCHEMA public REVOKE ALL ON TABLES  FROM "Brianna";
ALTER DEFAULT PRIVILEGES FOR ROLE "Brianna" IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO galvanize_admin;


--
-- PostgreSQL database dump complete
--

