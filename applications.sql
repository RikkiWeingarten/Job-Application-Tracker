PGDMP  
    ,                |           applications    16.3    16.3 $    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16773    applications    DATABASE     �   CREATE DATABASE applications WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Israel.1252';
    DROP DATABASE applications;
                postgres    false            �            1259    16843    application    TABLE     �  CREATE TABLE public.application (
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
    DROP TABLE public.application;
       public         heap    postgres    false            �            1259    16842    application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.application_id_seq;
       public          postgres    false    220                       0    0    application_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.application_id_seq OWNED BY public.application.id;
          public          postgres    false    219            �            1259    16825    company    TABLE     �   CREATE TABLE public.company (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    location character varying(255)
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    16824    company_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.company_id_seq;
       public          postgres    false    216                       0    0    company_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;
          public          postgres    false    215            �            1259    16861 	   interview    TABLE     �   CREATE TABLE public.interview (
    id integer NOT NULL,
    round integer,
    place character varying(255),
    type character varying(255),
    interview_date date,
    company_id integer,
    app_id integer
);
    DROP TABLE public.interview;
       public         heap    postgres    false            �            1259    16860    interview_id_seq    SEQUENCE     �   CREATE SEQUENCE public.interview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.interview_id_seq;
       public          postgres    false    222                       0    0    interview_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.interview_id_seq OWNED BY public.interview.id;
          public          postgres    false    221            �            1259    16834    position    TABLE     �   CREATE TABLE public."position" (
    id integer NOT NULL,
    position_name character varying(255) NOT NULL,
    category character varying(255),
    year_experience integer
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    16833    position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.position_id_seq;
       public          postgres    false    218                       0    0    position_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;
          public          postgres    false    217            a           2604    16846    application id    DEFAULT     p   ALTER TABLE ONLY public.application ALTER COLUMN id SET DEFAULT nextval('public.application_id_seq'::regclass);
 =   ALTER TABLE public.application ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            _           2604    16828 
   company id    DEFAULT     h   ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);
 9   ALTER TABLE public.company ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            b           2604    16864    interview id    DEFAULT     l   ALTER TABLE ONLY public.interview ALTER COLUMN id SET DEFAULT nextval('public.interview_id_seq'::regclass);
 ;   ALTER TABLE public.interview ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            `           2604    16837    position id    DEFAULT     l   ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);
 <   ALTER TABLE public."position" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                      0    16843    application 
   TABLE DATA           �   COPY public.application (id, application_job_name, company_id, position_id, application_date, followup_date, salary, status) FROM stdin;
    public          postgres    false    220   �)                  0    16825    company 
   TABLE DATA           =   COPY public.company (id, company_name, location) FROM stdin;
    public          postgres    false    216   �)                 0    16861 	   interview 
   TABLE DATA           _   COPY public.interview (id, round, place, type, interview_date, company_id, app_id) FROM stdin;
    public          postgres    false    222   �)                 0    16834    position 
   TABLE DATA           R   COPY public."position" (id, position_name, category, year_experience) FROM stdin;
    public          postgres    false    218   �)                  0    0    application_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.application_id_seq', 1, false);
          public          postgres    false    219                       0    0    company_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.company_id_seq', 1, false);
          public          postgres    false    215                       0    0    interview_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.interview_id_seq', 1, false);
          public          postgres    false    221                       0    0    position_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_id_seq', 1, false);
          public          postgres    false    217            i           2606    16849    application application_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.application DROP CONSTRAINT application_pkey;
       public            postgres    false    220            e           2606    16832    company company_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    216            k           2606    16868    interview interview_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.interview
    ADD CONSTRAINT interview_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.interview DROP CONSTRAINT interview_pkey;
       public            postgres    false    222            g           2606    16841    position position_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    218            l           2606    16850 '   application application_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.application DROP CONSTRAINT application_company_id_fkey;
       public          postgres    false    220    216    4709            m           2606    16855 (   application application_position_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.application DROP CONSTRAINT application_position_id_fkey;
       public          postgres    false    220    218    4711            n           2606    16874    interview interview_app_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interview
    ADD CONSTRAINT interview_app_id_fkey FOREIGN KEY (app_id) REFERENCES public.application(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.interview DROP CONSTRAINT interview_app_id_fkey;
       public          postgres    false    222    220    4713            o           2606    16869 #   interview interview_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interview
    ADD CONSTRAINT interview_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.interview DROP CONSTRAINT interview_company_id_fkey;
       public          postgres    false    216    4709    222                  x������ � �             x������ � �            x������ � �            x������ � �     