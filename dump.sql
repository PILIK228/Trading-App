--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(30),
    country character varying(30),
    lat numeric,
    lon numeric
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: operation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation (
    id integer NOT NULL,
    quantity character varying,
    figi character varying,
    instrument_type character varying,
    date timestamp without time zone,
    type character varying
);


ALTER TABLE public.operation OWNER TO postgres;

--
-- Name: operation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_id_seq OWNER TO postgres;

--
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operation_id_seq OWNED BY public.operation.id;


--
-- Name: prediction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prediction (
    id integer NOT NULL,
    cities_id integer NOT NULL,
    dates character varying(30),
    temperature integer,
    description character varying(30)
);


ALTER TABLE public.prediction OWNER TO postgres;

--
-- Name: prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prediction_id_seq OWNER TO postgres;

--
-- Name: prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prediction_id_seq OWNED BY public.prediction.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying NOT NULL,
    permissions json
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying NOT NULL,
    username character varying NOT NULL,
    hashed_password character varying NOT NULL,
    registered_at timestamp without time zone,
    role_id integer,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: operation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation ALTER COLUMN id SET DEFAULT nextval('public.operation_id_seq'::regclass);


--
-- Name: prediction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction ALTER COLUMN id SET DEFAULT nextval('public.prediction_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
6d09d37fade0
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, country, lat, lon) FROM stdin;
1	Москва	RU	55.7504461	37.6174943
2	Лондон	GB	51.5073219	-0.1276474
3	Дубай	AE	25.2653471	55.2924914
4	Нью-Йорк	US	40.7127281	-74.0060152
5	Калининград	RU	54.710128	20.5105838
6	Стамбул	TR	41.0091982	28.9662187
7	Сидней	AU	-33.8698439	151.2082848
8	городской округ Казань	RU	55.7823547	49.1242266
9	Берлин	DE	52.5170365	13.3888599
10	Париж	FR	48.8588897	2.3200410217200766
11	Варшава	PL	52.2319581	21.0067249
12	Берн	CH	46.9482713	7.4514512
13	Токио	JP	35.6828387	139.7594549
14	Киото	JP	35.021041	135.7556075
15	Каунас	LT	54.8982139	23.9044817
16	Барселона	ES	41.3828939	2.1774322
17	Осло	NO	59.9133301	10.7389701
18	Тбилиси	GE	41.6934591	44.8014495
19	Столица Прага	CZ	50.0874654	14.4212535
20	Вена	AT	48.2083537	16.3725042
\.


--
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation (id, quantity, figi, instrument_type, date, type) FROM stdin;
1234	123.124	string	string	2023-05-11 13:41:05.789	Выплата купонов
\.


--
-- Data for Name: prediction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prediction (id, cities_id, dates, temperature, description) FROM stdin;
611	1	2023-04-26 12:00:00	12	небольшой дождь
612	1	2023-04-26 15:00:00	13	небольшой дождь
613	1	2023-04-26 18:00:00	12	пасмурно
614	1	2023-04-26 21:00:00	10	облачно с прояснениями
615	1	2023-04-27 00:00:00	9	облачно с прояснениями
616	2	2023-04-26 12:00:00	9	пасмурно
617	2	2023-04-26 15:00:00	10	пасмурно
618	2	2023-04-26 18:00:00	9	пасмурно
619	2	2023-04-26 21:00:00	6	переменная облачность
620	2	2023-04-27 00:00:00	6	переменная облачность
621	3	2023-04-26 12:00:00	34	ясно
622	3	2023-04-26 15:00:00	31	переменная облачность
623	3	2023-04-26 18:00:00	29	переменная облачность
624	3	2023-04-26 21:00:00	26	ясно
625	3	2023-04-27 00:00:00	26	небольшая облачность
626	4	2023-04-26 12:00:00	8	пасмурно
627	4	2023-04-26 15:00:00	10	пасмурно
628	4	2023-04-26 18:00:00	12	облачно с прояснениями
629	4	2023-04-26 21:00:00	14	переменная облачность
630	4	2023-04-27 00:00:00	12	небольшой дождь
631	5	2023-04-26 12:00:00	8	небольшой дождь
632	5	2023-04-26 15:00:00	7	небольшой дождь
633	5	2023-04-26 18:00:00	6	облачно с прояснениями
634	5	2023-04-26 21:00:00	5	ясно
635	5	2023-04-27 00:00:00	4	ясно
636	6	2023-04-26 12:00:00	17	небольшой дождь
637	6	2023-04-26 15:00:00	16	небольшой дождь
638	6	2023-04-26 18:00:00	14	небольшой дождь
639	6	2023-04-26 21:00:00	12	пасмурно
640	6	2023-04-27 00:00:00	11	пасмурно
641	7	2023-04-26 12:00:00	17	небольшая облачность
642	7	2023-04-26 15:00:00	17	небольшая облачность
643	7	2023-04-26 18:00:00	16	переменная облачность
644	7	2023-04-26 21:00:00	15	пасмурно
645	7	2023-04-27 00:00:00	19	пасмурно
646	8	2023-04-26 12:00:00	17	небольшой дождь
647	8	2023-04-26 15:00:00	16	облачно с прояснениями
648	8	2023-04-26 18:00:00	13	облачно с прояснениями
649	8	2023-04-26 21:00:00	12	пасмурно
650	8	2023-04-27 00:00:00	12	пасмурно
651	9	2023-04-26 12:00:00	9	небольшой дождь
652	9	2023-04-26 15:00:00	9	небольшой дождь
653	9	2023-04-26 18:00:00	8	облачно с прояснениями
654	9	2023-04-26 21:00:00	4	облачно с прояснениями
655	9	2023-04-27 00:00:00	3	облачно с прояснениями
656	10	2023-04-26 12:00:00	12	облачно с прояснениями
657	10	2023-04-26 15:00:00	12	облачно с прояснениями
658	10	2023-04-26 18:00:00	12	пасмурно
659	10	2023-04-26 21:00:00	10	пасмурно
660	10	2023-04-27 00:00:00	10	пасмурно
661	11	2023-04-26 12:00:00	9	переменная облачность
662	11	2023-04-26 15:00:00	9	облачно с прояснениями
663	11	2023-04-26 18:00:00	8	облачно с прояснениями
664	11	2023-04-26 21:00:00	5	небольшая облачность
665	11	2023-04-27 00:00:00	4	небольшая облачность
666	12	2023-04-26 12:00:00	12	небольшая облачность
667	12	2023-04-26 15:00:00	13	переменная облачность
668	12	2023-04-26 18:00:00	11	облачно с прояснениями
669	12	2023-04-26 21:00:00	8	пасмурно
670	12	2023-04-27 00:00:00	5	облачно с прояснениями
671	13	2023-04-26 12:00:00	16	облачно с прояснениями
672	13	2023-04-26 15:00:00	15	облачно с прояснениями
673	13	2023-04-26 18:00:00	14	небольшой дождь
674	13	2023-04-26 21:00:00	13	небольшой дождь
675	13	2023-04-27 00:00:00	16	небольшая облачность
676	14	2023-04-26 12:00:00	12	пасмурно
677	14	2023-04-26 15:00:00	11	облачно с прояснениями
678	14	2023-04-26 18:00:00	10	переменная облачность
679	14	2023-04-26 21:00:00	10	облачно с прояснениями
680	14	2023-04-27 00:00:00	13	облачно с прояснениями
681	15	2023-04-26 12:00:00	4	небольшой дождь
682	15	2023-04-26 15:00:00	5	пасмурно
683	15	2023-04-26 18:00:00	5	пасмурно
684	15	2023-04-26 21:00:00	3	пасмурно
685	15	2023-04-27 00:00:00	2	пасмурно
686	16	2023-04-26 12:00:00	19	облачно с прояснениями
687	16	2023-04-26 15:00:00	19	облачно с прояснениями
688	16	2023-04-26 18:00:00	18	облачно с прояснениями
689	16	2023-04-26 21:00:00	17	пасмурно
690	16	2023-04-27 00:00:00	17	облачно с прояснениями
691	17	2023-04-26 12:00:00	4	небольшой снег
692	17	2023-04-26 15:00:00	4	небольшой дождь
693	17	2023-04-26 18:00:00	4	небольшой снег
694	17	2023-04-26 21:00:00	1	пасмурно
695	17	2023-04-27 00:00:00	1	пасмурно
696	18	2023-04-26 12:00:00	21	переменная облачность
697	18	2023-04-26 15:00:00	20	небольшой дождь
698	18	2023-04-26 18:00:00	17	небольшой дождь
699	18	2023-04-26 21:00:00	14	дождь
700	18	2023-04-27 00:00:00	13	небольшой дождь
701	19	2023-04-26 12:00:00	8	облачно с прояснениями
702	19	2023-04-26 15:00:00	9	облачно с прояснениями
703	19	2023-04-26 18:00:00	7	пасмурно
704	19	2023-04-26 21:00:00	5	пасмурно
705	19	2023-04-27 00:00:00	3	пасмурно
706	20	2023-04-26 12:00:00	11	небольшая облачность
707	20	2023-04-26 15:00:00	11	переменная облачность
708	20	2023-04-26 18:00:00	10	облачно с прояснениями
709	20	2023-04-26 21:00:00	7	пасмурно
710	20	2023-04-27 00:00:00	6	пасмурно
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, permissions) FROM stdin;
1	user	\N
2	admin	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, username, hashed_password, registered_at, role_id, is_active, is_superuser, is_verified) FROM stdin;
1	diablo2435@mail.ru	вшфидщ2435	$2b$12$WTTg4NexieCegPfA37Ix4ODkzz0fJk4W957p3ELofFe944O9Qj2EO	2023-05-05 18:32:42.920222	1	t	f	f
2	diablo@mail.ru	diablo	$2b$12$Z.PjXa6Oa8ezpKDjqzurduk.zOEAHieUNSy6lSC1oEI9Q2ZANm19e	2023-05-06 14:18:12.634477	1	t	f	f
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 20, true);


--
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operation_id_seq', 1, false);


--
-- Name: prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prediction_id_seq', 710, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: operation operation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (id);


--
-- Name: prediction prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction
    ADD CONSTRAINT prediction_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: prediction prediction_cities_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prediction
    ADD CONSTRAINT prediction_cities_id_fkey FOREIGN KEY (cities_id) REFERENCES public.cities(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

