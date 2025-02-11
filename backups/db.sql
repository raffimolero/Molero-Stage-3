--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.member_projects DROP CONSTRAINT member_projects_projects_id_fkey;
ALTER TABLE ONLY public.member_projects DROP CONSTRAINT member_projects_member_id_fkey;
ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
ALTER TABLE ONLY public.member_projects DROP CONSTRAINT member_projects_pkey;
ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.members ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.projects_id_seq;
DROP TABLE public.projects;
DROP SEQUENCE public.members_id_seq;
DROP TABLE public.members;
DROP TABLE public.member_projects;
DROP TABLE public._prisma_migrations;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: member_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_projects (
    projects_id integer NOT NULL,
    member_id integer NOT NULL,
    assigned_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.member_projects OWNER TO postgres;

--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
a45ddf45-e312-4484-9b75-ae164b6de5ec	c2959c0e97fb3aef02c8cf8bf4b0880193253f0896dc49155a017d4e004d7687	2025-02-11 19:13:14.846825+00	20250211145617_init	\N	\N	2025-02-11 19:13:14.838265+00	1
be548c34-7096-47d5-ab1c-21cf5bc36026	708e9703fbfd849e192426e0eb54c940f2fca0a7785a2ddaf6ead6d2d0e48c32	2025-02-11 19:13:14.85355+00	20250211155337_updatedat_nullable	\N	\N	2025-02-11 19:13:14.848578+00	1
3769cef9-5a6b-4ae7-85b9-4de0d45601ae	b299f45cb29d32e0dbb8e9a1f63cffab21d7f6bf371ad7b2d8001ce4d5c25fd1	2025-02-11 20:03:55.496444+00	20250211200355_updated_at_nullable_for_projects	\N	\N	2025-02-11 20:03:55.491822+00	1
4bdd4431-0934-4859-bb70-c8d21df3306f	40ab2476179654fbcdd5cf969282a102c50f26c0216becfe23780f0a7a91aa1f	2025-02-11 20:23:22.053769+00	20250211202136_force_nonnull_updated_at	\N	\N	2025-02-11 20:23:22.043396+00	1
\.


--
-- Data for Name: member_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member_projects (projects_id, member_id, assigned_at) FROM stdin;
2	1	2025-02-11 20:24:24.001
2	5	2025-02-11 20:24:50.479
3	2	2025-02-11 20:25:10.619
3	1	2025-02-11 20:25:15.611
3	3	2025-02-11 20:25:40.347
4	1	2025-02-11 20:25:51.663
4	7	2025-02-11 20:26:00.966
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, name, role, created_at, updated_at, deleted_at) FROM stdin;
1	Raffi Molero	backend	2025-02-11 19:36:33.977	2025-02-11 20:23:22.047	\N
2	John Doe	frontend	2025-02-11 19:36:43.422	2025-02-11 20:23:22.047	\N
3	Kyle Doe	UI/UX	2025-02-11 19:36:52.937	2025-02-11 20:23:22.047	\N
4	Steve Minecraft	frontend	2025-02-11 19:37:13.545	2025-02-11 20:23:22.047	\N
5	Mongo D. Bee	backend	2025-02-11 19:37:31.952	2025-02-11 20:23:22.047	\N
6	React Jay Es	frontend	2025-02-11 19:38:09.871	2025-02-11 20:23:22.047	\N
7	Notion Dot Sight	UI/UX	2025-02-11 19:38:53.921	2025-02-11 20:23:22.047	\N
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, description, created_at, updated_at) FROM stdin;
2	Stage 1	Stage 1 - Database Preparation with Migrations: In this stage, you'll set up the necessary database schema and create migrations to ensure smooth data updates and version control.	2025-02-11 19:55:11.195	2025-02-11 20:23:22.047
3	Stuff	A website that sells stuff	2025-02-11 20:08:58.039	2025-02-11 20:23:22.047
4	Tropixotics	A test website to showcase different ways to build frontend UI with PHP	2025-02-11 20:09:23.282	2025-02-11 20:23:22.047
\.


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 7, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 4, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: member_projects member_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_projects
    ADD CONSTRAINT member_projects_pkey PRIMARY KEY (member_id, projects_id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: member_projects member_projects_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_projects
    ADD CONSTRAINT member_projects_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: member_projects member_projects_projects_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_projects
    ADD CONSTRAINT member_projects_projects_id_fkey FOREIGN KEY (projects_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

