--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    password text NOT NULL,
    username text NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: citation_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citation_records (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    title text NOT NULL,
    source text NOT NULL,
    license text NOT NULL,
    see_also text
);


ALTER TABLE public.citation_records OWNER TO postgres;

--
-- Name: COLUMN citation_records.see_also; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.citation_records.see_also IS 'None';


--
-- Name: citation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citation_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citation_records_id_seq OWNER TO postgres;

--
-- Name: citation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citation_records_id_seq OWNED BY public.citation_records.id;


--
-- Name: creators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creators (
    id integer NOT NULL,
    creator_name text NOT NULL
);


ALTER TABLE public.creators OWNER TO postgres;

--
-- Name: creators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creators_id_seq OWNER TO postgres;

--
-- Name: creators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creators_id_seq OWNED BY public.creators.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_citation_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_citation_records (
    user_id integer NOT NULL,
    citation_record_id integer NOT NULL
);


ALTER TABLE public.users_citation_records OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: citation_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citation_records ALTER COLUMN id SET DEFAULT nextval('public.citation_records_id_seq'::regclass);


--
-- Name: creators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creators ALTER COLUMN id SET DEFAULT nextval('public.creators_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, password, username) FROM stdin;
1	sc1234	scotcorm
\.


--
-- Data for Name: citation_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citation_records (id, creator_id, title, source, license, see_also) FROM stdin;
\.


--
-- Data for Name: creators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.creators (id, creator_name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, account_id) FROM stdin;
\.


--
-- Data for Name: users_citation_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_citation_records (user_id, citation_record_id) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 1, true);


--
-- Name: citation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citation_records_id_seq', 2, true);


--
-- Name: creators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.creators_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);


--
-- Name: citation_records citation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citation_records
    ADD CONSTRAINT citation_records_pkey PRIMARY KEY (id);


--
-- Name: creators creators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creators
    ADD CONSTRAINT creators_pkey PRIMARY KEY (id);


--
-- Name: users_citation_records users_citation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_citation_records
    ADD CONSTRAINT users_citation_records_pkey PRIMARY KEY (user_id, citation_record_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users fk_accounts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_accounts_users FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: citation_records fk_creators_citation_records; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citation_records
    ADD CONSTRAINT fk_creators_citation_records FOREIGN KEY (creator_id) REFERENCES public.creators(id);


--
-- Name: users_citation_records fk_users_citation_records_citation_records; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_citation_records
    ADD CONSTRAINT fk_users_citation_records_citation_records FOREIGN KEY (citation_record_id) REFERENCES public.citation_records(id);


--
-- Name: users_citation_records fk_users_citation_records_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_citation_records
    ADD CONSTRAINT fk_users_citation_records_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

