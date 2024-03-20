--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.2 (Homebrew)

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

ALTER TABLE ONLY public.uzrent_roomsave DROP CONSTRAINT uzrent_roomsave_user_id_62e0bc37_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_roomsave DROP CONSTRAINT uzrent_roomsave_post_id_c0c630df_fk_uzrent_room_id;
ALTER TABLE ONLY public.uzrent_room DROP CONSTRAINT uzrent_room_room_type_id_a398c228_fk_uzrent_roomtype_id;
ALTER TABLE ONLY public.uzrent_room_house_rules DROP CONSTRAINT uzrent_room_house_rules_room_id_ad1f51e8_fk_uzrent_room_id;
ALTER TABLE ONLY public.uzrent_room_house_rules DROP CONSTRAINT uzrent_room_house_ru_houserule_id_468407b9_fk_uzrent_ho;
ALTER TABLE ONLY public.uzrent_room DROP CONSTRAINT uzrent_room_host_id_8c9cf366_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_room_amenities DROP CONSTRAINT uzrent_room_amenities_room_id_b77b46dd_fk_uzrent_room_id;
ALTER TABLE ONLY public.uzrent_room_amenities DROP CONSTRAINT uzrent_room_amenities_amenity_id_68b7434f_fk_uzrent_amenity_id;
ALTER TABLE ONLY public.uzrent_ratinglike DROP CONSTRAINT uzrent_ratinglike_user_id_0c17816a_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_ratinglike DROP CONSTRAINT uzrent_ratinglike_rating_id_26cbeac5_fk_uzrent_rating_id;
ALTER TABLE ONLY public.uzrent_rating DROP CONSTRAINT uzrent_rating_user_id_ffcd41df_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_rating DROP CONSTRAINT uzrent_rating_room_id_3036417f_fk_uzrent_room_id;
ALTER TABLE ONLY public.uzrent_profile DROP CONSTRAINT uzrent_profile_user_id_3aa1f71e_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_photo DROP CONSTRAINT uzrent_photo_room_id_48a61e18_fk_uzrent_room_id;
ALTER TABLE ONLY public.uzrent_notification DROP CONSTRAINT uzrent_notification_user_id_594ef658_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.uzrent_roomsave_user_id_62e0bc37;
DROP INDEX public.uzrent_roomsave_post_id_c0c630df;
DROP INDEX public.uzrent_room_room_type_id_a398c228;
DROP INDEX public.uzrent_room_house_rules_room_id_ad1f51e8;
DROP INDEX public.uzrent_room_house_rules_houserule_id_468407b9;
DROP INDEX public.uzrent_room_host_id_8c9cf366;
DROP INDEX public.uzrent_room_amenities_room_id_b77b46dd;
DROP INDEX public.uzrent_room_amenities_amenity_id_68b7434f;
DROP INDEX public.uzrent_ratinglike_user_id_0c17816a;
DROP INDEX public.uzrent_ratinglike_rating_id_26cbeac5;
DROP INDEX public.uzrent_rating_user_id_ffcd41df;
DROP INDEX public.uzrent_rating_room_id_3036417f;
DROP INDEX public.uzrent_photo_room_id_48a61e18;
DROP INDEX public.uzrent_notification_user_id_594ef658;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.uzrent_roomtype DROP CONSTRAINT uzrent_roomtype_pkey;
ALTER TABLE ONLY public.uzrent_roomsave DROP CONSTRAINT uzrent_roomsave_pkey;
ALTER TABLE ONLY public.uzrent_room DROP CONSTRAINT uzrent_room_pkey;
ALTER TABLE ONLY public.uzrent_room_house_rules DROP CONSTRAINT uzrent_room_house_rules_room_id_houserule_id_88ae1028_uniq;
ALTER TABLE ONLY public.uzrent_room_house_rules DROP CONSTRAINT uzrent_room_house_rules_pkey;
ALTER TABLE ONLY public.uzrent_room_amenities DROP CONSTRAINT uzrent_room_amenities_room_id_amenity_id_86977e56_uniq;
ALTER TABLE ONLY public.uzrent_room_amenities DROP CONSTRAINT uzrent_room_amenities_pkey;
ALTER TABLE ONLY public.uzrent_ratinglike DROP CONSTRAINT uzrent_ratinglike_pkey;
ALTER TABLE ONLY public.uzrent_rating DROP CONSTRAINT uzrent_rating_pkey;
ALTER TABLE ONLY public.uzrent_profile DROP CONSTRAINT uzrent_profile_user_id_key;
ALTER TABLE ONLY public.uzrent_profile DROP CONSTRAINT uzrent_profile_pkey;
ALTER TABLE ONLY public.uzrent_photo DROP CONSTRAINT uzrent_photo_pkey;
ALTER TABLE ONLY public.uzrent_notification DROP CONSTRAINT uzrent_notification_pkey;
ALTER TABLE ONLY public.uzrent_houserule DROP CONSTRAINT uzrent_houserule_pkey;
ALTER TABLE ONLY public.uzrent_amenity DROP CONSTRAINT uzrent_amenity_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
DROP TABLE public.uzrent_roomtype;
DROP TABLE public.uzrent_roomsave;
DROP TABLE public.uzrent_room_house_rules;
DROP TABLE public.uzrent_room_amenities;
DROP TABLE public.uzrent_room;
DROP TABLE public.uzrent_ratinglike;
DROP TABLE public.uzrent_rating;
DROP TABLE public.uzrent_profile;
DROP TABLE public.uzrent_photo;
DROP TABLE public.uzrent_notification;
DROP TABLE public.uzrent_houserule;
DROP TABLE public.uzrent_amenity;
DROP TABLE public.django_session;
DROP TABLE public.django_migrations;
DROP TABLE public.django_content_type;
DROP TABLE public.django_admin_log;
DROP TABLE public.auth_user_user_permissions;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP TABLE public.auth_permission;
DROP TABLE public.auth_group_permissions;
DROP TABLE public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO abdu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO abdu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO abdu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO abdu;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO abdu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO abdu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO abdu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO abdu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO abdu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO abdu;

--
-- Name: uzrent_amenity; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_amenity (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.uzrent_amenity OWNER TO abdu;

--
-- Name: uzrent_amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_amenity ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_amenity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_houserule; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_houserule (
    id bigint NOT NULL,
    rule character varying(255) NOT NULL
);


ALTER TABLE public.uzrent_houserule OWNER TO abdu;

--
-- Name: uzrent_houserule_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_houserule ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_houserule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_notification; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_notification (
    id bigint NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.uzrent_notification OWNER TO abdu;

--
-- Name: uzrent_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_notification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_photo; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_photo (
    id bigint NOT NULL,
    file character varying(100) NOT NULL,
    room_id bigint NOT NULL
);


ALTER TABLE public.uzrent_photo OWNER TO abdu;

--
-- Name: uzrent_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_photo ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_profile; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_profile (
    id bigint NOT NULL,
    avatar character varying(100) NOT NULL,
    avatar_default character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    bio character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(255),
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.uzrent_profile OWNER TO abdu;

--
-- Name: uzrent_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_profile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_rating; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_rating (
    id bigint NOT NULL,
    review_text text NOT NULL,
    rating integer NOT NULL,
    date timestamp with time zone NOT NULL,
    edited boolean NOT NULL,
    user_id integer NOT NULL,
    room_id bigint NOT NULL
);


ALTER TABLE public.uzrent_rating OWNER TO abdu;

--
-- Name: uzrent_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_rating ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_ratinglike; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_ratinglike (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    rating_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.uzrent_ratinglike OWNER TO abdu;

--
-- Name: uzrent_ratinglike_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_ratinglike ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_ratinglike_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_room; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_room (
    id bigint NOT NULL,
    brief_name character varying(150),
    description text NOT NULL,
    city character varying(200),
    price integer NOT NULL,
    address character varying(255) NOT NULL,
    guests integer NOT NULL,
    beds integer NOT NULL,
    bedrooms integer NOT NULL,
    baths integer NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    location character varying(63) NOT NULL,
    date timestamp with time zone NOT NULL,
    host_id integer NOT NULL,
    room_type_id bigint
);


ALTER TABLE public.uzrent_room OWNER TO abdu;

--
-- Name: uzrent_room_amenities; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_room_amenities (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    amenity_id bigint NOT NULL
);


ALTER TABLE public.uzrent_room_amenities OWNER TO abdu;

--
-- Name: uzrent_room_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_room_amenities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_room_amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_room_house_rules; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_room_house_rules (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    houserule_id bigint NOT NULL
);


ALTER TABLE public.uzrent_room_house_rules OWNER TO abdu;

--
-- Name: uzrent_room_house_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_room_house_rules ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_room_house_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_room_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_room ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_roomsave; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_roomsave (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.uzrent_roomsave OWNER TO abdu;

--
-- Name: uzrent_roomsave_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_roomsave ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_roomsave_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_roomtype; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_roomtype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.uzrent_roomtype OWNER TO abdu;

--
-- Name: uzrent_roomtype_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_roomtype ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_roomtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Amenity	7	add_amenity
26	Can change Amenity	7	change_amenity
27	Can delete Amenity	7	delete_amenity
28	Can view Amenity	7	view_amenity
29	Can add House Rule	8	add_houserule
30	Can change House Rule	8	change_houserule
31	Can delete House Rule	8	delete_houserule
32	Can view House Rule	8	view_houserule
33	Can add Room Type	9	add_roomtype
34	Can change Room Type	9	change_roomtype
35	Can delete Room Type	9	delete_roomtype
36	Can view Room Type	9	view_roomtype
37	Can add Profile	10	add_profile
38	Can change Profile	10	change_profile
39	Can delete Profile	10	delete_profile
40	Can view Profile	10	view_profile
41	Can add Rating	11	add_rating
42	Can change Rating	11	change_rating
43	Can delete Rating	11	delete_rating
44	Can view Rating	11	view_rating
45	Can add rating like	12	add_ratinglike
46	Can change rating like	12	change_ratinglike
47	Can delete rating like	12	delete_ratinglike
48	Can view rating like	12	view_ratinglike
49	Can add Room	13	add_room
50	Can change Room	13	change_room
51	Can delete Room	13	delete_room
52	Can view Room	13	view_room
53	Can add Photo	14	add_photo
54	Can change Photo	14	change_photo
55	Can delete Photo	14	delete_photo
56	Can view Photo	14	view_photo
57	Can add room save	15	add_roomsave
58	Can change room save	15	change_roomsave
59	Can delete room save	15	delete_roomsave
60	Can view room save	15	view_roomsave
61	Can add notification	16	add_notification
62	Can change notification	16	change_notification
63	Can delete notification	16	delete_notification
64	Can view notification	16	view_notification
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$720000$l07DMvyPY98H9Bb1CMu2tz$YQO141hUTfJAuG4evnes4AKJodrfb+CmGRFtx32xBxo=	2024-03-04 01:12:55.975894+05	f	Abdulaziz	Abdulaziz Rakhmatullaev		abbrakh@gmail.com	f	t	2024-03-04 01:06:19.952954+05
4	pbkdf2_sha256$720000$zyHbzWpNsP18BTOO4BJovs$pormyvL8mMgEjIdTwrmQ/YSylBf0GM53L6EaYwe79Ck=	2024-03-19 06:24:11.223153+05	f	lethalboi	Abdulaziz Rakhmatullaev		lethalboi@gmail.com	f	t	2024-03-19 05:40:57.874385+05
1	pbkdf2_sha256$720000$8ttpd43FjVYKBXn4ZNVzGY$h3TFXoWxz3AIQSUMYTn5B0aaIds1vzKGNny1MALSoM0=	2024-03-20 05:58:12.014912+05	t	admin				t	t	2024-03-03 03:18:45.84969+05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-03-03 03:20:59.979374+05	1	Shared Room	1	[{"added": {}}]	9	1
2	2024-03-03 03:21:05.516351+05	1	Fast Wi-Fi	1	[{"added": {}}]	7	1
3	2024-03-03 03:21:16.682419+05	2	Outdoor Kitchen	1	[{"added": {}}]	7	1
4	2024-03-03 03:21:31.216356+05	1	No Smoking	1	[{"added": {}}]	8	1
5	2024-03-03 03:22:30.243282+05	1	1 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	13	1
6	2024-03-03 03:22:36.206434+05	2	2 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	13	1
7	2024-03-03 03:22:38.086496+05	3	3 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	13	1
8	2024-03-03 03:22:40.24072+05	4	4 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	13	1
9	2024-03-03 04:08:22.418402+05	1	Photo of the object: 1 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	14	1
10	2024-03-03 04:08:31.48911+05	2	Photo of the object: 2 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	14	1
11	2024-03-03 04:08:40.425653+05	3	Photo of the object: 2 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	14	1
12	2024-03-03 04:08:49.867877+05	4	Photo of the object: 3 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	14	1
13	2024-03-03 04:08:58.553553+05	5	Photo of the object: 4 | @admin | TASHKENT  | 2024-03-02	1	[{"added": {}}]	14	1
14	2024-03-03 04:09:10.762041+05	1	admin	1	[{"added": {}}]	10	1
15	2024-03-03 04:10:55.556992+05	1	admin | 1 | 2024-03-02 23:10:40+00:00	1	[{"added": {}}]	11	1
16	2024-03-03 04:12:13.271131+05	2	admin | 5 | 2024-03-02 23:10:56+00:00	1	[{"added": {}}]	11	1
17	2024-03-03 04:12:45.8054+05	3	admin | 2 | 2024-03-02 23:12:25+00:00	1	[{"added": {}}]	11	1
18	2024-03-03 04:42:38.244877+05	1	1 | @admin | TASHKENT  | 2024-03-02	2	[{"changed": {"fields": ["Price"]}}]	13	1
19	2024-03-03 04:53:30.53417+05	1	1 | @admin | TASHKENT  | 2024-03-02	2	[{"changed": {"fields": ["Price"]}}]	13	1
20	2024-03-03 04:54:40.334384+05	4	4 | @admin | BUKHARA  | 2024-03-02	2	[{"changed": {"fields": ["City"]}}]	13	1
21	2024-03-03 22:47:27.245202+05	3	admin | 2 | 2024-03-01 04:12:25+05:00	2	[{"changed": {"fields": ["Date"]}}]	11	1
22	2024-03-03 22:47:49.099014+05	2	admin | 5 | 2024-02-21 04:10:56+05:00	2	[{"changed": {"fields": ["Date"]}}]	11	1
23	2024-03-04 01:05:42.514986+05	2	abdulazizdev	3		10	1
24	2024-03-04 01:05:47.093772+05	2	abdulazizdev	3		4	1
25	2024-03-19 06:12:30.344458+05	2	Notification object (2)	3		16	1
26	2024-03-19 06:12:30.353302+05	1	Notification object (1)	3		16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	uzrent	amenity
8	uzrent	houserule
9	uzrent	roomtype
10	uzrent	profile
11	uzrent	rating
12	uzrent	ratinglike
13	uzrent	room
14	uzrent	photo
15	uzrent	roomsave
16	uzrent	notification
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-03-03 03:18:24.42857+05
2	auth	0001_initial	2024-03-03 03:18:24.45734+05
3	admin	0001_initial	2024-03-03 03:18:24.467071+05
4	admin	0002_logentry_remove_auto_add	2024-03-03 03:18:24.470929+05
5	admin	0003_logentry_add_action_flag_choices	2024-03-03 03:18:24.473623+05
6	contenttypes	0002_remove_content_type_name	2024-03-03 03:18:24.479539+05
7	auth	0002_alter_permission_name_max_length	2024-03-03 03:18:24.482769+05
8	auth	0003_alter_user_email_max_length	2024-03-03 03:18:24.48616+05
9	auth	0004_alter_user_username_opts	2024-03-03 03:18:24.489378+05
10	auth	0005_alter_user_last_login_null	2024-03-03 03:18:24.491979+05
11	auth	0006_require_contenttypes_0002	2024-03-03 03:18:24.492382+05
12	auth	0007_alter_validators_add_error_messages	2024-03-03 03:18:24.494759+05
13	auth	0008_alter_user_username_max_length	2024-03-03 03:18:24.500835+05
14	auth	0009_alter_user_last_name_max_length	2024-03-03 03:18:24.504447+05
15	auth	0010_alter_group_name_max_length	2024-03-03 03:18:24.507544+05
16	auth	0011_update_proxy_permissions	2024-03-03 03:18:24.5099+05
17	auth	0012_alter_user_first_name_max_length	2024-03-03 03:18:24.512356+05
18	sessions	0001_initial	2024-03-03 03:18:24.515996+05
19	uzrent	0001_initial	2024-03-03 03:18:24.62786+05
20	uzrent	0002_alter_rating_options_message	2024-03-03 03:18:24.645684+05
21	uzrent	0003_delete_message	2024-03-03 03:18:24.647338+05
22	uzrent	0004_chat_message	2024-03-03 03:18:24.660286+05
23	uzrent	0005_delete_chat_delete_message	2024-03-03 03:18:24.662238+05
24	uzrent	0006_message_notification	2024-03-03 03:18:24.683484+05
25	uzrent	0007_remove_notification_user_delete_message_and_more	2024-03-03 03:18:24.695231+05
26	uzrent	0008_notification	2024-03-19 05:25:43.068638+05
27	uzrent	0009_remove_profile_country	2024-03-20 07:46:20.900542+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0l9kx3dhutmrvv0v1ykb6be4zgi52ti4	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1riQqO:ZIegqvbHo4hqehlIGq46wn2jub6YbXL6u7GN1Z_5Juw	2024-03-22 08:24:24.193699+05
qxjcq05s8vwic76q8nfo4qbx5yvjnx6g	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1rmbqW:yoTZwDv-zGJXeR9OhOE9wPOwnPovW_3ibkZLXbFvkrs	2024-04-02 20:57:48.947056+05
nij66mgcp3v3lvsqdr72isup58ey27wz	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1rmkHU:B8lK8HFH9WgiE61mX8VfNZdFPaauP15gd3CCYAd-DT0	2024-04-03 05:58:12.016395+05
\.


--
-- Data for Name: uzrent_amenity; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_amenity (id, name) FROM stdin;
1	Fast Wi-Fi
2	Outdoor Kitchen
\.


--
-- Data for Name: uzrent_houserule; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_houserule (id, rule) FROM stdin;
1	No Smoking
\.


--
-- Data for Name: uzrent_notification; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_notification (id, message, created_at, user_id) FROM stdin;
3	A new booking request has been made for one of your rooms 2, with check_in: 2024-03-02, check_out: 2024-03-26	2024-03-19 06:13:31.622107+05	1
4	A new booking request has been made for one of your rooms 2, with check_in: 2024-03-02, check_out: 2024-03-26	2024-03-19 06:13:56.347036+05	1
5	A new booking request has been made for one of your rooms 2, with check_in: 2024-03-02, check_out: 2024-03-26	2024-03-19 20:57:12.054251+05	1
\.


--
-- Data for Name: uzrent_photo; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_photo (id, file, room_id) FROM stdin;
1	room_photos/5bedrooms_sanatoriy_turon_8_sotok-20-1.jpg	1
2	room_photos/Screenshot_2024-02-25_at_4.52.35AM.png	2
3	room_photos/327-3278372_american-psycho.jpg	2
4	room_photos/1344907.png	3
5	room_photos/FMOoFIdXMAo36Rk.jpg	4
\.


--
-- Data for Name: uzrent_profile; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_profile (id, avatar, avatar_default, name, bio, email, phone_number, created_at, user_id) FROM stdin;
1		to right, #f3e03d, #0075ff	Abdulaziz Rakhmatullaev		abbrakh@gmail.com	+998931040055	2024-03-03 04:09:06+05	1
3		to top, #d9b7e9, #d01212	Abdulaziz Rakhmatullaev		abbrakh@gmail.com	\N	2024-03-04 01:06:20.110061+05	3
4		to bottom right, #ffa600, #d01212	Abdulaziz Rakhmatullaev		lethalboi@gmail.com	\N	2024-03-19 05:40:58.042302+05	4
\.


--
-- Data for Name: uzrent_rating; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_rating (id, review_text, rating, date, edited, user_id, room_id) FROM stdin;
1	idk man, it sucks	1	2024-03-03 04:10:40+05	f	1	1
3	i mean, for one night it's okay	2	2024-03-01 04:12:25+05	f	1	1
2	bro, it's the best place	5	2024-02-21 04:10:56+05	f	1	1
\.


--
-- Data for Name: uzrent_ratinglike; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_ratinglike (id, date, rating_id, user_id) FROM stdin;
\.


--
-- Data for Name: uzrent_room; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_room (id, brief_name, description, city, price, address, guests, beds, bedrooms, baths, check_in, check_out, location, date, host_id, room_type_id) FROM stdin;
2	The best cabin near Bukhara	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod sapien nulla, at accumsan arcu dignissim eleifend. In eget urna mauris. Fusce nec hendrerit ipsum. Mauris ultricies ante in dui posuere tincidunt. Phasellus ac justo a dolor consectetur dignissim. Maecenas varius nec ipsum sit amet ornare. Vestibulum eleifend, quam nec gravida eleifend, dui urna lobortis turpis, a maximus massa purus nec tellus. Suspendisse eleifend eleifend sapien, a sodales tellus posuere at. Maecenas metus risus, lobortis eu semper non, vulputate a ipsum.\r\n\r\nSed iaculis est lorem, vel iaculis nisi ullamcorper ut. Phasellus odio ipsum, tincidunt id ultricies luctus, consequat ut velit. Donec at tristique tellus, vel varius risus. Donec vestibulum, ipsum ut eleifend tincidunt, enim lacus finibus nisi, vel imperdiet nulla metus vitae diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ac eros nunc. Curabitur quis eleifend dui. Donec at varius magna. Curabitur a sem non felis interdum dapibus. Nam pellentesque auctor augue, a vestibulum nulla consectetur ut. Aenean aliquet interdum lacus ac volutpat. Curabitur orci lorem, aliquam posuere aliquam sit amet, interdum vitae sem.\r\n\r\nNulla viverra eros sit amet est viverra tempus in sed diam. Sed nec cursus nulla. Curabitur auctor enim sed nibh vehicula mollis. In ut erat lacus. Aliquam erat volutpat. Donec nec sapien eu purus pellentesque rutrum. Sed id mollis mi. Sed et nisl ut libero semper ullamcorper pharetra ut libero.	TASHKENT	230	3, Mirzo Ulugbek street	7	3	2	2	2024-03-02	2024-03-26	39.76811298991076,64.42570567131044	2024-03-03 03:19:13+05	1	1
3	The best cabin near Bukhara	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod sapien nulla, at accumsan arcu dignissim eleifend. In eget urna mauris. Fusce nec hendrerit ipsum. Mauris ultricies ante in dui posuere tincidunt. Phasellus ac justo a dolor consectetur dignissim. Maecenas varius nec ipsum sit amet ornare. Vestibulum eleifend, quam nec gravida eleifend, dui urna lobortis turpis, a maximus massa purus nec tellus. Suspendisse eleifend eleifend sapien, a sodales tellus posuere at. Maecenas metus risus, lobortis eu semper non, vulputate a ipsum.\r\n\r\nSed iaculis est lorem, vel iaculis nisi ullamcorper ut. Phasellus odio ipsum, tincidunt id ultricies luctus, consequat ut velit. Donec at tristique tellus, vel varius risus. Donec vestibulum, ipsum ut eleifend tincidunt, enim lacus finibus nisi, vel imperdiet nulla metus vitae diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ac eros nunc. Curabitur quis eleifend dui. Donec at varius magna. Curabitur a sem non felis interdum dapibus. Nam pellentesque auctor augue, a vestibulum nulla consectetur ut. Aenean aliquet interdum lacus ac volutpat. Curabitur orci lorem, aliquam posuere aliquam sit amet, interdum vitae sem.\r\n\r\nNulla viverra eros sit amet est viverra tempus in sed diam. Sed nec cursus nulla. Curabitur auctor enim sed nibh vehicula mollis. In ut erat lacus. Aliquam erat volutpat. Donec nec sapien eu purus pellentesque rutrum. Sed id mollis mi. Sed et nisl ut libero semper ullamcorper pharetra ut libero.	TASHKENT	230	3, Mirzo Ulugbek street	7	3	2	2	2024-03-02	2024-03-26	39.76811298991076,64.42570567131044	2024-03-03 03:19:13+05	1	1
4	The best cabin near Bukhara	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod sapien nulla, at accumsan arcu dignissim eleifend. In eget urna mauris. Fusce nec hendrerit ipsum. Mauris ultricies ante in dui posuere tincidunt. Phasellus ac justo a dolor consectetur dignissim. Maecenas varius nec ipsum sit amet ornare. Vestibulum eleifend, quam nec gravida eleifend, dui urna lobortis turpis, a maximus massa purus nec tellus. Suspendisse eleifend eleifend sapien, a sodales tellus posuere at. Maecenas metus risus, lobortis eu semper non, vulputate a ipsum.\r\n\r\nSed iaculis est lorem, vel iaculis nisi ullamcorper ut. Phasellus odio ipsum, tincidunt id ultricies luctus, consequat ut velit. Donec at tristique tellus, vel varius risus. Donec vestibulum, ipsum ut eleifend tincidunt, enim lacus finibus nisi, vel imperdiet nulla metus vitae diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ac eros nunc. Curabitur quis eleifend dui. Donec at varius magna. Curabitur a sem non felis interdum dapibus. Nam pellentesque auctor augue, a vestibulum nulla consectetur ut. Aenean aliquet interdum lacus ac volutpat. Curabitur orci lorem, aliquam posuere aliquam sit amet, interdum vitae sem.\r\n\r\nNulla viverra eros sit amet est viverra tempus in sed diam. Sed nec cursus nulla. Curabitur auctor enim sed nibh vehicula mollis. In ut erat lacus. Aliquam erat volutpat. Donec nec sapien eu purus pellentesque rutrum. Sed id mollis mi. Sed et nisl ut libero semper ullamcorper pharetra ut libero.	BUKHARA	230	3, Mirzo Ulugbek street	7	3	2	2	2024-03-02	2024-03-26	39.76811298991076,64.42570567131044	2024-03-03 03:19:13+05	1	1
1	The best cabin near Bukhara	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod sapien nulla, at accumsan arcu dignissim eleifend. In eget urna mauris. Fusce nec hendrerit ipsum. Mauris ultricies ante in dui posuere tincidunt. Phasellus ac justo a dolor consectetur dignissim. Maecenas varius nec ipsum sit amet ornare. Vestibulum eleifend, quam nec gravida eleifend, dui urna lobortis turpis, a maximus massa purus nec tellus. Suspendisse eleifend eleifend sapien, a sodales tellus posuere at. Maecenas metus risus, lobortis eu semper non, vulputate a ipsum.\r\n\r\nSed iaculis est lorem, vel iaculis nisi ullamcorper ut. Phasellus odio ipsum, tincidunt id ultricies luctus, consequat ut velit. Donec at tristique tellus, vel varius risus. Donec vestibulum, ipsum ut eleifend tincidunt, enim lacus finibus nisi, vel imperdiet nulla metus vitae diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ac eros nunc. Curabitur quis eleifend dui. Donec at varius magna. Curabitur a sem non felis interdum dapibus. Nam pellentesque auctor augue, a vestibulum nulla consectetur ut. Aenean aliquet interdum lacus ac volutpat. Curabitur orci lorem, aliquam posuere aliquam sit amet, interdum vitae sem.\r\n\r\nNulla viverra eros sit amet est viverra tempus in sed diam. Sed nec cursus nulla. Curabitur auctor enim sed nibh vehicula mollis. In ut erat lacus. Aliquam erat volutpat. Donec nec sapien eu purus pellentesque rutrum. Sed id mollis mi. Sed et nisl ut libero semper ullamcorper pharetra ut libero.	TASHKENT	248	3, Mirzo Ulugbek street	7	3	2	2	2024-03-02	2024-03-26	39.76811298991076,64.42570567131044	2024-03-03 03:19:13+05	1	1
\.


--
-- Data for Name: uzrent_room_amenities; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_room_amenities (id, room_id, amenity_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
5	3	1
6	3	2
7	4	1
8	4	2
\.


--
-- Data for Name: uzrent_room_house_rules; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_room_house_rules (id, room_id, houserule_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
\.


--
-- Data for Name: uzrent_roomsave; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_roomsave (id, date, post_id, user_id) FROM stdin;
\.


--
-- Data for Name: uzrent_roomtype; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_roomtype (id, name) FROM stdin;
1	Shared Room
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 26, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: uzrent_amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_amenity_id_seq', 2, true);


--
-- Name: uzrent_houserule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_houserule_id_seq', 1, true);


--
-- Name: uzrent_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_notification_id_seq', 5, true);


--
-- Name: uzrent_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_photo_id_seq', 5, true);


--
-- Name: uzrent_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_profile_id_seq', 4, true);


--
-- Name: uzrent_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_rating_id_seq', 3, true);


--
-- Name: uzrent_ratinglike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_ratinglike_id_seq', 1, false);


--
-- Name: uzrent_room_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_room_amenities_id_seq', 8, true);


--
-- Name: uzrent_room_house_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_room_house_rules_id_seq', 4, true);


--
-- Name: uzrent_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_room_id_seq', 4, true);


--
-- Name: uzrent_roomsave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_roomsave_id_seq', 1, false);


--
-- Name: uzrent_roomtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_roomtype_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: uzrent_amenity uzrent_amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_amenity
    ADD CONSTRAINT uzrent_amenity_pkey PRIMARY KEY (id);


--
-- Name: uzrent_houserule uzrent_houserule_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_houserule
    ADD CONSTRAINT uzrent_houserule_pkey PRIMARY KEY (id);


--
-- Name: uzrent_notification uzrent_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_notification
    ADD CONSTRAINT uzrent_notification_pkey PRIMARY KEY (id);


--
-- Name: uzrent_photo uzrent_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_photo
    ADD CONSTRAINT uzrent_photo_pkey PRIMARY KEY (id);


--
-- Name: uzrent_profile uzrent_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_profile
    ADD CONSTRAINT uzrent_profile_pkey PRIMARY KEY (id);


--
-- Name: uzrent_profile uzrent_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_profile
    ADD CONSTRAINT uzrent_profile_user_id_key UNIQUE (user_id);


--
-- Name: uzrent_rating uzrent_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_rating
    ADD CONSTRAINT uzrent_rating_pkey PRIMARY KEY (id);


--
-- Name: uzrent_ratinglike uzrent_ratinglike_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_ratinglike
    ADD CONSTRAINT uzrent_ratinglike_pkey PRIMARY KEY (id);


--
-- Name: uzrent_room_amenities uzrent_room_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_amenities
    ADD CONSTRAINT uzrent_room_amenities_pkey PRIMARY KEY (id);


--
-- Name: uzrent_room_amenities uzrent_room_amenities_room_id_amenity_id_86977e56_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_amenities
    ADD CONSTRAINT uzrent_room_amenities_room_id_amenity_id_86977e56_uniq UNIQUE (room_id, amenity_id);


--
-- Name: uzrent_room_house_rules uzrent_room_house_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_house_rules
    ADD CONSTRAINT uzrent_room_house_rules_pkey PRIMARY KEY (id);


--
-- Name: uzrent_room_house_rules uzrent_room_house_rules_room_id_houserule_id_88ae1028_uniq; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_house_rules
    ADD CONSTRAINT uzrent_room_house_rules_room_id_houserule_id_88ae1028_uniq UNIQUE (room_id, houserule_id);


--
-- Name: uzrent_room uzrent_room_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room
    ADD CONSTRAINT uzrent_room_pkey PRIMARY KEY (id);


--
-- Name: uzrent_roomsave uzrent_roomsave_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_roomsave
    ADD CONSTRAINT uzrent_roomsave_pkey PRIMARY KEY (id);


--
-- Name: uzrent_roomtype uzrent_roomtype_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_roomtype
    ADD CONSTRAINT uzrent_roomtype_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: uzrent_notification_user_id_594ef658; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_notification_user_id_594ef658 ON public.uzrent_notification USING btree (user_id);


--
-- Name: uzrent_photo_room_id_48a61e18; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_photo_room_id_48a61e18 ON public.uzrent_photo USING btree (room_id);


--
-- Name: uzrent_rating_room_id_3036417f; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_rating_room_id_3036417f ON public.uzrent_rating USING btree (room_id);


--
-- Name: uzrent_rating_user_id_ffcd41df; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_rating_user_id_ffcd41df ON public.uzrent_rating USING btree (user_id);


--
-- Name: uzrent_ratinglike_rating_id_26cbeac5; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_ratinglike_rating_id_26cbeac5 ON public.uzrent_ratinglike USING btree (rating_id);


--
-- Name: uzrent_ratinglike_user_id_0c17816a; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_ratinglike_user_id_0c17816a ON public.uzrent_ratinglike USING btree (user_id);


--
-- Name: uzrent_room_amenities_amenity_id_68b7434f; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_room_amenities_amenity_id_68b7434f ON public.uzrent_room_amenities USING btree (amenity_id);


--
-- Name: uzrent_room_amenities_room_id_b77b46dd; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_room_amenities_room_id_b77b46dd ON public.uzrent_room_amenities USING btree (room_id);


--
-- Name: uzrent_room_host_id_8c9cf366; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_room_host_id_8c9cf366 ON public.uzrent_room USING btree (host_id);


--
-- Name: uzrent_room_house_rules_houserule_id_468407b9; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_room_house_rules_houserule_id_468407b9 ON public.uzrent_room_house_rules USING btree (houserule_id);


--
-- Name: uzrent_room_house_rules_room_id_ad1f51e8; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_room_house_rules_room_id_ad1f51e8 ON public.uzrent_room_house_rules USING btree (room_id);


--
-- Name: uzrent_room_room_type_id_a398c228; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_room_room_type_id_a398c228 ON public.uzrent_room USING btree (room_type_id);


--
-- Name: uzrent_roomsave_post_id_c0c630df; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_roomsave_post_id_c0c630df ON public.uzrent_roomsave USING btree (post_id);


--
-- Name: uzrent_roomsave_user_id_62e0bc37; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_roomsave_user_id_62e0bc37 ON public.uzrent_roomsave USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_notification uzrent_notification_user_id_594ef658_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_notification
    ADD CONSTRAINT uzrent_notification_user_id_594ef658_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_photo uzrent_photo_room_id_48a61e18_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_photo
    ADD CONSTRAINT uzrent_photo_room_id_48a61e18_fk_uzrent_room_id FOREIGN KEY (room_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_profile uzrent_profile_user_id_3aa1f71e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_profile
    ADD CONSTRAINT uzrent_profile_user_id_3aa1f71e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_rating uzrent_rating_room_id_3036417f_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_rating
    ADD CONSTRAINT uzrent_rating_room_id_3036417f_fk_uzrent_room_id FOREIGN KEY (room_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_rating uzrent_rating_user_id_ffcd41df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_rating
    ADD CONSTRAINT uzrent_rating_user_id_ffcd41df_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_ratinglike uzrent_ratinglike_rating_id_26cbeac5_fk_uzrent_rating_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_ratinglike
    ADD CONSTRAINT uzrent_ratinglike_rating_id_26cbeac5_fk_uzrent_rating_id FOREIGN KEY (rating_id) REFERENCES public.uzrent_rating(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_ratinglike uzrent_ratinglike_user_id_0c17816a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_ratinglike
    ADD CONSTRAINT uzrent_ratinglike_user_id_0c17816a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_room_amenities uzrent_room_amenities_amenity_id_68b7434f_fk_uzrent_amenity_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_amenities
    ADD CONSTRAINT uzrent_room_amenities_amenity_id_68b7434f_fk_uzrent_amenity_id FOREIGN KEY (amenity_id) REFERENCES public.uzrent_amenity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_room_amenities uzrent_room_amenities_room_id_b77b46dd_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_amenities
    ADD CONSTRAINT uzrent_room_amenities_room_id_b77b46dd_fk_uzrent_room_id FOREIGN KEY (room_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_room uzrent_room_host_id_8c9cf366_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room
    ADD CONSTRAINT uzrent_room_host_id_8c9cf366_fk_auth_user_id FOREIGN KEY (host_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_room_house_rules uzrent_room_house_ru_houserule_id_468407b9_fk_uzrent_ho; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_house_rules
    ADD CONSTRAINT uzrent_room_house_ru_houserule_id_468407b9_fk_uzrent_ho FOREIGN KEY (houserule_id) REFERENCES public.uzrent_houserule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_room_house_rules uzrent_room_house_rules_room_id_ad1f51e8_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room_house_rules
    ADD CONSTRAINT uzrent_room_house_rules_room_id_ad1f51e8_fk_uzrent_room_id FOREIGN KEY (room_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_room uzrent_room_room_type_id_a398c228_fk_uzrent_roomtype_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_room
    ADD CONSTRAINT uzrent_room_room_type_id_a398c228_fk_uzrent_roomtype_id FOREIGN KEY (room_type_id) REFERENCES public.uzrent_roomtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_roomsave uzrent_roomsave_post_id_c0c630df_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_roomsave
    ADD CONSTRAINT uzrent_roomsave_post_id_c0c630df_fk_uzrent_room_id FOREIGN KEY (post_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_roomsave uzrent_roomsave_user_id_62e0bc37_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_roomsave
    ADD CONSTRAINT uzrent_roomsave_user_id_62e0bc37_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

