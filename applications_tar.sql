toc.dat                                                                                             0000600 0004000 0002000 00000024552 14671510363 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   :    .    
            |           applications    16.3    16.3 $    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16773    applications    DATABASE     �   CREATE DATABASE applications WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Israel.1252';
    DROP DATABASE applications;
                postgres    false         �            1259    16843    Application    TABLE     �  CREATE TABLE public."Application" (
    id integer NOT NULL,
    application_job_name character varying(255),
    company_id integer,
    position_id integer,
    application_date date,
    followup_date date,
    salary numeric(12,2),
    status character varying(10),
    CONSTRAINT application_status_check CHECK (((status)::text = ANY ((ARRAY['open'::character varying, 'closed'::character varying])::text[])))
);
 !   DROP TABLE public."Application";
       public         heap    postgres    false         �            1259    16825    Company    TABLE     �   CREATE TABLE public."Company" (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    location character varying(255)
);
    DROP TABLE public."Company";
       public         heap    postgres    false         �            1259    16861 	   Interview    TABLE     �   CREATE TABLE public."Interview" (
    id integer NOT NULL,
    round integer,
    place character varying(255),
    type character varying(255),
    interview_date date,
    company_id integer,
    app_id integer
);
    DROP TABLE public."Interview";
       public         heap    postgres    false         �            1259    16834    Position    TABLE     �   CREATE TABLE public."Position" (
    id integer NOT NULL,
    position_name character varying(255) NOT NULL,
    category character varying(255),
    year_experience integer
);
    DROP TABLE public."Position";
       public         heap    postgres    false         �            1259    16842    application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.application_id_seq;
       public          postgres    false    220                    0    0    application_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.application_id_seq OWNED BY public."Application".id;
          public          postgres    false    219         �            1259    16824    company_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.company_id_seq;
       public          postgres    false    216                    0    0    company_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.company_id_seq OWNED BY public."Company".id;
          public          postgres    false    215         �            1259    16860    interview_id_seq    SEQUENCE     �   CREATE SEQUENCE public.interview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.interview_id_seq;
       public          postgres    false    222                    0    0    interview_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.interview_id_seq OWNED BY public."Interview".id;
          public          postgres    false    221         �            1259    16833    position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.position_id_seq;
       public          postgres    false    218                    0    0    position_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.position_id_seq OWNED BY public."Position".id;
          public          postgres    false    217         a           2604    16846    Application id    DEFAULT     r   ALTER TABLE ONLY public."Application" ALTER COLUMN id SET DEFAULT nextval('public.application_id_seq'::regclass);
 ?   ALTER TABLE public."Application" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220         _           2604    16828 
   Company id    DEFAULT     j   ALTER TABLE ONLY public."Company" ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);
 ;   ALTER TABLE public."Company" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216         b           2604    16864    Interview id    DEFAULT     n   ALTER TABLE ONLY public."Interview" ALTER COLUMN id SET DEFAULT nextval('public.interview_id_seq'::regclass);
 =   ALTER TABLE public."Interview" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222         `           2604    16837    Position id    DEFAULT     l   ALTER TABLE ONLY public."Position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);
 <   ALTER TABLE public."Position" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                   0    16843    Application 
   TABLE DATA           �   COPY public."Application" (id, application_job_name, company_id, position_id, application_date, followup_date, salary, status) FROM stdin;
    public          postgres    false    220       4868.dat            0    16825    Company 
   TABLE DATA           ?   COPY public."Company" (id, company_name, location) FROM stdin;
    public          postgres    false    216       4864.dat           0    16861 	   Interview 
   TABLE DATA           a   COPY public."Interview" (id, round, place, type, interview_date, company_id, app_id) FROM stdin;
    public          postgres    false    222       4870.dat           0    16834    Position 
   TABLE DATA           R   COPY public."Position" (id, position_name, category, year_experience) FROM stdin;
    public          postgres    false    218       4866.dat            0    0    application_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.application_id_seq', 1, false);
          public          postgres    false    219                    0    0    company_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.company_id_seq', 1, false);
          public          postgres    false    215                    0    0    interview_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.interview_id_seq', 1, false);
          public          postgres    false    221                    0    0    position_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_id_seq', 1, false);
          public          postgres    false    217         i           2606    16849    Application application_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Application" DROP CONSTRAINT application_pkey;
       public            postgres    false    220         e           2606    16832    Company company_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Company" DROP CONSTRAINT company_pkey;
       public            postgres    false    216         k           2606    16868    Interview interview_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Interview"
    ADD CONSTRAINT interview_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Interview" DROP CONSTRAINT interview_pkey;
       public            postgres    false    222         g           2606    16841    Position position_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Position" DROP CONSTRAINT position_pkey;
       public            postgres    false    218         l           2606    16850 '   Application application_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT application_company_id_fkey FOREIGN KEY (company_id) REFERENCES public."Company"(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public."Application" DROP CONSTRAINT application_company_id_fkey;
       public          postgres    false    220    216    4709         m           2606    16855 (   Application application_position_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT application_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."Position"(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."Application" DROP CONSTRAINT application_position_id_fkey;
       public          postgres    false    220    218    4711         n           2606    16874    Interview interview_app_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Interview"
    ADD CONSTRAINT interview_app_id_fkey FOREIGN KEY (app_id) REFERENCES public."Application"(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Interview" DROP CONSTRAINT interview_app_id_fkey;
       public          postgres    false    222    220    4713         o           2606    16869 #   Interview interview_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Interview"
    ADD CONSTRAINT interview_company_id_fkey FOREIGN KEY (company_id) REFERENCES public."Company"(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."Interview" DROP CONSTRAINT interview_company_id_fkey;
       public          postgres    false    216    4709    222                                                                                                                                                              4868.dat                                                                                            0000600 0004000 0002000 00000000005 14671510363 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4864.dat                                                                                            0000600 0004000 0002000 00000000005 14671510363 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4870.dat                                                                                            0000600 0004000 0002000 00000000005 14671510363 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4866.dat                                                                                            0000600 0004000 0002000 00000000005 14671510363 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000021315 14671510363 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE applications;
--
-- Name: applications; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE applications WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Israel.1252';


ALTER DATABASE applications OWNER TO postgres;

\connect applications

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
-- Name: Application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Application" (
    id integer NOT NULL,
    application_job_name character varying(255),
    company_id integer,
    position_id integer,
    application_date date,
    followup_date date,
    salary numeric(12,2),
    status character varying(10),
    CONSTRAINT application_status_check CHECK (((status)::text = ANY ((ARRAY['open'::character varying, 'closed'::character varying])::text[])))
);


ALTER TABLE public."Application" OWNER TO postgres;

--
-- Name: Company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company" (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    location character varying(255)
);


ALTER TABLE public."Company" OWNER TO postgres;

--
-- Name: Interview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Interview" (
    id integer NOT NULL,
    round integer,
    place character varying(255),
    type character varying(255),
    interview_date date,
    company_id integer,
    app_id integer
);


ALTER TABLE public."Interview" OWNER TO postgres;

--
-- Name: Position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Position" (
    id integer NOT NULL,
    position_name character varying(255) NOT NULL,
    category character varying(255),
    year_experience integer
);


ALTER TABLE public."Position" OWNER TO postgres;

--
-- Name: application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.application_id_seq OWNER TO postgres;

--
-- Name: application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.application_id_seq OWNED BY public."Application".id;


--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_id_seq OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_seq OWNED BY public."Company".id;


--
-- Name: interview_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interview_id_seq OWNER TO postgres;

--
-- Name: interview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interview_id_seq OWNED BY public."Interview".id;


--
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_id_seq OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."Position".id;


--
-- Name: Application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Application" ALTER COLUMN id SET DEFAULT nextval('public.application_id_seq'::regclass);


--
-- Name: Company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company" ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- Name: Interview id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interview" ALTER COLUMN id SET DEFAULT nextval('public.interview_id_seq'::regclass);


--
-- Name: Position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- Data for Name: Application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Application" (id, application_job_name, company_id, position_id, application_date, followup_date, salary, status) FROM stdin;
\.
COPY public."Application" (id, application_job_name, company_id, position_id, application_date, followup_date, salary, status) FROM '$$PATH$$/4868.dat';

--
-- Data for Name: Company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Company" (id, company_name, location) FROM stdin;
\.
COPY public."Company" (id, company_name, location) FROM '$$PATH$$/4864.dat';

--
-- Data for Name: Interview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Interview" (id, round, place, type, interview_date, company_id, app_id) FROM stdin;
\.
COPY public."Interview" (id, round, place, type, interview_date, company_id, app_id) FROM '$$PATH$$/4870.dat';

--
-- Data for Name: Position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Position" (id, position_name, category, year_experience) FROM stdin;
\.
COPY public."Position" (id, position_name, category, year_experience) FROM '$$PATH$$/4866.dat';

--
-- Name: application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.application_id_seq', 1, false);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_seq', 1, false);


--
-- Name: interview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interview_id_seq', 1, false);


--
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 1, false);


--
-- Name: Application application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);


--
-- Name: Company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: Interview interview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interview"
    ADD CONSTRAINT interview_pkey PRIMARY KEY (id);


--
-- Name: Position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);


--
-- Name: Application application_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT application_company_id_fkey FOREIGN KEY (company_id) REFERENCES public."Company"(id) ON DELETE CASCADE;


--
-- Name: Application application_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Application"
    ADD CONSTRAINT application_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."Position"(id) ON DELETE CASCADE;


--
-- Name: Interview interview_app_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interview"
    ADD CONSTRAINT interview_app_id_fkey FOREIGN KEY (app_id) REFERENCES public."Application"(id) ON DELETE CASCADE;


--
-- Name: Interview interview_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Interview"
    ADD CONSTRAINT interview_company_id_fkey FOREIGN KEY (company_id) REFERENCES public."Company"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   