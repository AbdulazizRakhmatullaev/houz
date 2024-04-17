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

ALTER TABLE ONLY public.uzrent_bookmark DROP CONSTRAINT uzrent_roomsave_user_id_62e0bc37_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_bookmark DROP CONSTRAINT uzrent_roomsave_post_id_c0c630df_fk_uzrent_room_id;
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
ALTER TABLE ONLY public.uzrent_notification DROP CONSTRAINT uzrent_notifications_sender_id_f06e6b36_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_notification DROP CONSTRAINT uzrent_notifications_room_id_3afe7f9f_fk_uzrent_room_id;
ALTER TABLE ONLY public.uzrent_notification DROP CONSTRAINT uzrent_notifications_reciever_id_c3581c92_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_booking DROP CONSTRAINT uzrent_booking_user_id_39852c9a_fk_auth_user_id;
ALTER TABLE ONLY public.uzrent_booking DROP CONSTRAINT uzrent_booking_room_id_d2652f9c_fk_uzrent_room_id;
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
DROP INDEX public.uzrent_notifications_sender_id_f06e6b36;
DROP INDEX public.uzrent_notifications_room_id_3afe7f9f;
DROP INDEX public.uzrent_notifications_reciever_id_c3581c92;
DROP INDEX public.uzrent_booking_user_id_39852c9a;
DROP INDEX public.uzrent_booking_room_id_d2652f9c;
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
ALTER TABLE ONLY public.uzrent_bookmark DROP CONSTRAINT uzrent_roomsave_pkey;
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
ALTER TABLE ONLY public.uzrent_notification DROP CONSTRAINT uzrent_notifications_pkey;
ALTER TABLE ONLY public.uzrent_houserule DROP CONSTRAINT uzrent_houserule_pkey;
ALTER TABLE ONLY public.uzrent_booking DROP CONSTRAINT uzrent_booking_pkey;
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
DROP TABLE public.uzrent_room_house_rules;
DROP TABLE public.uzrent_room_amenities;
DROP TABLE public.uzrent_room;
DROP TABLE public.uzrent_ratinglike;
DROP TABLE public.uzrent_rating;
DROP TABLE public.uzrent_profile;
DROP TABLE public.uzrent_photo;
DROP TABLE public.uzrent_notification;
DROP TABLE public.uzrent_houserule;
DROP TABLE public.uzrent_bookmark;
DROP TABLE public.uzrent_booking;
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
-- Name: uzrent_booking; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_booking (
    id bigint NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    room_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.uzrent_booking OWNER TO abdu;

--
-- Name: uzrent_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_booking ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: uzrent_bookmark; Type: TABLE; Schema: public; Owner: abdu
--

CREATE TABLE public.uzrent_bookmark (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.uzrent_bookmark OWNER TO abdu;

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
    check_in date,
    check_out date,
    confirmed boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    reciever_id integer NOT NULL,
    room_id bigint,
    sender_id integer NOT NULL
);


ALTER TABLE public.uzrent_notification OWNER TO abdu;

--
-- Name: uzrent_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_notification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.uzrent_notifications_id_seq
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
-- Name: uzrent_roomsave_id_seq; Type: SEQUENCE; Schema: public; Owner: abdu
--

ALTER TABLE public.uzrent_bookmark ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
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
65	Can add user notifications	17	add_usernotifications
66	Can change user notifications	17	change_usernotifications
67	Can delete user notifications	17	delete_usernotifications
68	Can view user notifications	17	view_usernotifications
69	Can add host notifications	18	add_hostnotifications
70	Can change host notifications	18	change_hostnotifications
71	Can delete host notifications	18	delete_hostnotifications
72	Can view host notifications	18	view_hostnotifications
73	Can add notifications	19	add_notifications
74	Can change notifications	19	change_notifications
75	Can delete notifications	19	delete_notifications
76	Can view notifications	19	view_notifications
77	Can add bookmark	15	add_bookmark
78	Can change bookmark	15	change_bookmark
79	Can delete bookmark	15	delete_bookmark
80	Can view bookmark	15	view_bookmark
81	Can add booking	20	add_booking
82	Can change booking	20	change_booking
83	Can delete booking	20	delete_booking
84	Can view booking	20	view_booking
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$720000$l07DMvyPY98H9Bb1CMu2tz$YQO141hUTfJAuG4evnes4AKJodrfb+CmGRFtx32xBxo=	2024-03-04 01:12:55.975894+05	f	Abdulaziz	Abdulaziz Rakhmatullaev		abbrakh@gmail.com	f	t	2024-03-04 01:06:19.952954+05
5	pbkdf2_sha256$720000$hggTeM3bpLLnq8myJSgSgF$UV72aZkDv8l7Kdlj75j5FE9bAscvJ1bz82yWs9UrAgI=	2024-03-27 00:19:04.47068+05	f	damnboi	damn boi		damn@gmail.com	f	t	2024-03-26 03:15:13.913925+05
1	pbkdf2_sha256$720000$8ttpd43FjVYKBXn4ZNVzGY$h3TFXoWxz3AIQSUMYTn5B0aaIds1vzKGNny1MALSoM0=	2024-04-14 04:04:59.103917+05	t	admin				t	t	2024-03-03 03:18:45.84969+05
4	pbkdf2_sha256$720000$zyHbzWpNsP18BTOO4BJovs$pormyvL8mMgEjIdTwrmQ/YSylBf0GM53L6EaYwe79Ck=	2024-04-16 01:02:10.532747+05	f	lethalboi	Abdulaziz Rakhmatullaev		lethalboi@gmail.com	f	t	2024-03-19 05:40:57.874385+05
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
27	2024-03-20 08:56:03.730738+05	8	Notification object (8)	3		16	1
28	2024-03-20 08:56:03.738556+05	7	Notification object (7)	3		16	1
29	2024-03-20 08:56:03.7408+05	6	Notification object (6)	3		16	1
30	2024-03-20 08:56:03.742241+05	5	Notification object (5)	3		16	1
31	2024-03-20 08:56:03.743654+05	4	Notification object (4)	3		16	1
32	2024-03-20 08:56:03.744893+05	3	Notification object (3)	3		16	1
33	2024-03-20 09:14:37.934052+05	9	Notification object (9)	3		16	1
34	2024-03-24 06:53:58.774371+05	4	Notifications object (4)	3		19	1
35	2024-03-24 06:53:58.782581+05	3	Notifications object (3)	3		19	1
36	2024-03-24 06:53:58.783748+05	2	Notifications object (2)	3		19	1
37	2024-03-24 06:53:58.784541+05	1	Notifications object (1)	3		19	1
38	2024-03-24 07:24:35.284312+05	8	Notifications object (8)	3		19	1
39	2024-03-24 07:24:35.292945+05	7	Notifications object (7)	3		19	1
40	2024-03-24 07:24:35.294579+05	6	Notifications object (6)	3		19	1
41	2024-03-24 07:24:35.295677+05	5	Notifications object (5)	3		19	1
42	2024-03-24 07:28:33.99701+05	12	Notifications object (12)	3		19	1
43	2024-03-24 07:28:34.001691+05	11	Notifications object (11)	3		19	1
44	2024-03-24 07:28:34.003978+05	10	Notifications object (10)	3		19	1
45	2024-03-24 07:28:34.005322+05	9	Notifications object (9)	3		19	1
46	2024-03-24 07:43:19.25227+05	16	Notifications object (16)	2	[{"changed": {"fields": ["Created at"]}}]	19	1
47	2024-03-24 08:00:28.826572+05	16	Notifications object (16)	3		19	1
48	2024-03-24 08:00:28.83551+05	15	Notifications object (15)	3		19	1
49	2024-03-24 08:00:28.836718+05	14	Notifications object (14)	3		19	1
50	2024-03-24 08:00:28.837562+05	13	Notifications object (13)	3		19	1
51	2024-03-24 08:05:56.895504+05	18	Notifications object (18)	3		19	1
52	2024-03-24 08:05:56.900626+05	17	Notifications object (17)	3		19	1
53	2024-03-24 08:15:54.817969+05	21	Notifications object (21)	3		19	1
54	2024-03-24 08:15:54.822874+05	20	Notifications object (20)	3		19	1
55	2024-03-24 08:15:54.824104+05	19	Notifications object (19)	3		19	1
56	2024-03-24 08:37:48.609112+05	24	Notifications object (24)	3		19	1
57	2024-03-24 08:37:48.613319+05	23	Notifications object (23)	3		19	1
58	2024-03-24 08:37:48.614508+05	22	Notifications object (22)	3		19	1
59	2024-03-24 11:22:58.403288+05	28	Notifications object (28)	3		19	1
60	2024-03-24 11:22:58.406936+05	27	Notifications object (27)	3		19	1
61	2024-03-24 11:22:58.407906+05	26	Notifications object (26)	3		19	1
62	2024-03-24 11:22:58.408765+05	25	Notifications object (25)	3		19	1
63	2024-03-25 14:15:45.232575+05	36	Notifications object (36)	3		19	1
64	2024-03-25 14:21:31.65334+05	2	Booking object (2)	3		20	1
65	2024-03-25 14:21:31.656376+05	1	Booking object (1)	3		20	1
66	2024-03-25 14:21:36.578934+05	3	Booking object (3)	3		20	1
67	2024-03-25 14:21:42.954146+05	38	Notifications object (38)	3		19	1
68	2024-03-25 14:21:42.957521+05	37	Notifications object (37)	3		19	1
69	2024-03-25 14:29:06.176407+05	5	Booking object (5)	3		20	1
70	2024-03-25 14:31:37.245853+05	42	Notifications object (42)	3		19	1
71	2024-03-25 14:31:37.250863+05	41	Notifications object (41)	3		19	1
72	2024-03-25 14:31:37.252271+05	40	Notifications object (40)	3		19	1
73	2024-03-26 02:36:55.665371+05	6	Booking object (6)	3		20	1
74	2024-03-26 02:36:55.673354+05	4	Booking object (4)	3		20	1
75	2024-03-27 00:08:29.675255+05	16	HostNotifications object (16)	3		18	1
76	2024-03-27 00:08:29.681881+05	12	HostNotifications object (12)	3		18	1
77	2024-03-27 00:08:29.683156+05	6	HostNotifications object (6)	3		18	1
78	2024-03-27 00:08:29.684331+05	1	HostNotifications object (1)	3		18	1
79	2024-03-27 00:08:37.088866+05	13	UserNotifications object (13)	3		17	1
80	2024-03-27 00:08:37.092135+05	12	UserNotifications object (12)	3		17	1
81	2024-03-27 00:08:37.094229+05	11	UserNotifications object (11)	3		17	1
82	2024-03-27 00:08:37.096164+05	10	UserNotifications object (10)	3		17	1
83	2024-03-27 00:08:37.097662+05	9	UserNotifications object (9)	3		17	1
84	2024-03-27 00:08:37.098954+05	8	UserNotifications object (8)	3		17	1
85	2024-03-27 00:08:37.100393+05	7	UserNotifications object (7)	3		17	1
86	2024-03-27 00:08:37.101377+05	6	UserNotifications object (6)	3		17	1
87	2024-03-27 00:08:37.103405+05	5	UserNotifications object (5)	3		17	1
88	2024-03-27 00:08:37.104271+05	4	UserNotifications object (4)	3		17	1
89	2024-03-27 00:08:37.105128+05	3	UserNotifications object (3)	3		17	1
90	2024-03-27 00:08:37.106135+05	2	UserNotifications object (2)	3		17	1
91	2024-03-27 00:08:37.10724+05	1	UserNotifications object (1)	3		17	1
92	2024-03-27 00:08:49.040136+05	10	Booking object (10)	3		20	1
93	2024-03-27 00:08:49.043185+05	9	Booking object (9)	3		20	1
94	2024-03-27 00:08:49.04488+05	8	Booking object (8)	3		20	1
95	2024-03-27 00:08:49.046561+05	7	Booking object (7)	3		20	1
96	2024-03-27 00:31:42.193203+05	15	UserNotifications object (15)	3		17	1
97	2024-03-27 06:55:32.686634+05	43	HostNotifications object (43)	1	[{"added": {}}]	18	1
98	2024-03-27 07:09:07.927449+05	46	HostNotifications object (46)	3		18	1
99	2024-03-27 07:09:07.931448+05	45	HostNotifications object (45)	3		18	1
100	2024-03-27 07:09:07.932267+05	44	HostNotifications object (44)	3		18	1
101	2024-03-27 07:09:07.933012+05	17	HostNotifications object (17)	3		18	1
102	2024-03-27 07:09:15.858795+05	38	UserNotifications object (38)	3		17	1
103	2024-03-27 07:09:15.862325+05	37	UserNotifications object (37)	3		17	1
104	2024-03-27 07:09:15.86483+05	36	UserNotifications object (36)	3		17	1
105	2024-03-27 07:09:15.866108+05	35	UserNotifications object (35)	3		17	1
106	2024-03-27 07:09:15.867141+05	34	UserNotifications object (34)	3		17	1
107	2024-03-27 07:09:15.868046+05	33	UserNotifications object (33)	3		17	1
108	2024-03-27 07:09:15.868881+05	32	UserNotifications object (32)	3		17	1
109	2024-03-27 07:09:15.869693+05	31	UserNotifications object (31)	3		17	1
110	2024-03-27 07:09:15.870573+05	30	UserNotifications object (30)	3		17	1
111	2024-03-27 07:09:15.871487+05	29	UserNotifications object (29)	3		17	1
112	2024-03-27 07:09:15.873504+05	28	UserNotifications object (28)	3		17	1
113	2024-03-27 07:09:15.874482+05	27	UserNotifications object (27)	3		17	1
114	2024-03-27 07:09:15.875328+05	26	UserNotifications object (26)	3		17	1
115	2024-03-27 07:09:15.876216+05	25	UserNotifications object (25)	3		17	1
116	2024-03-27 07:09:15.877304+05	24	UserNotifications object (24)	3		17	1
117	2024-03-27 07:09:15.879479+05	23	UserNotifications object (23)	3		17	1
118	2024-03-27 07:09:15.880689+05	22	UserNotifications object (22)	3		17	1
119	2024-03-27 07:09:15.881485+05	21	UserNotifications object (21)	3		17	1
120	2024-03-27 07:09:15.882234+05	20	UserNotifications object (20)	3		17	1
121	2024-03-27 07:09:15.883074+05	19	UserNotifications object (19)	3		17	1
122	2024-03-27 07:09:15.883872+05	18	UserNotifications object (18)	3		17	1
123	2024-03-27 07:09:15.884671+05	17	UserNotifications object (17)	3		17	1
124	2024-03-27 07:09:15.88563+05	16	UserNotifications object (16)	3		17	1
125	2024-03-27 07:09:15.886784+05	14	UserNotifications object (14)	3		17	1
126	2024-03-27 07:49:45.224841+05	2	Notifications object (2)	3		19	1
127	2024-03-27 09:49:38.327201+05	6	from (admin) to (admin) on 2024-03-27 04:25:17.059611+00:00	3		19	1
128	2024-03-28 07:38:54.097152+05	75	from (lethalboi) to (admin) on 2024-03-28 02:35:38	3		19	1
129	2024-03-28 07:38:54.101413+05	74	from (lethalboi) to (admin) on 2024-03-28 02:34:43	3		19	1
130	2024-03-28 07:38:54.102154+05	73	from (lethalboi) to (admin) on 2024-03-28 02:33:28	3		19	1
131	2024-03-28 07:38:54.102758+05	72	from (admin) to (lethalboi) on 2024-03-28 02:33:19	3		19	1
132	2024-03-28 07:38:54.103332+05	70	from (admin) to (lethalboi) on 2024-03-28 02:32:35	3		19	1
133	2024-03-28 07:38:54.103835+05	68	from (admin) to (lethalboi) on 2024-03-28 02:31:04	3		19	1
134	2024-03-28 07:38:54.104382+05	66	from (admin) to (lethalboi) on 2024-03-28 02:26:57	3		19	1
135	2024-03-28 07:38:54.104863+05	64	from (admin) to (lethalboi) on 2024-03-28 02:23:45	3		19	1
136	2024-03-28 07:38:54.105312+05	62	from (admin) to (lethalboi) on 2024-03-28 02:22:36	3		19	1
137	2024-03-28 07:38:54.10575+05	60	from (admin) to (lethalboi) on 2024-03-28 02:16:51	3		19	1
138	2024-03-28 07:38:54.106166+05	58	from (admin) to (lethalboi) on 2024-03-28 02:12:45	3		19	1
139	2024-03-28 07:38:54.106574+05	56	from (admin) to (lethalboi) on 2024-03-28 02:09:23	3		19	1
140	2024-03-28 07:38:54.10696+05	54	from (admin) to (lethalboi) on 2024-03-28 02:05:54	3		19	1
141	2024-03-28 07:38:54.107357+05	52	from (admin) to (lethalboi) on 2024-03-28 01:58:38	3		19	1
142	2024-03-28 07:38:54.107753+05	50	from (admin) to (lethalboi) on 2024-03-27 21:28:18	3		19	1
143	2024-03-28 07:38:54.108155+05	48	from (admin) to (lethalboi) on 2024-03-27 21:18:56	3		19	1
144	2024-03-28 07:38:54.108574+05	46	from (admin) to (lethalboi) on 2024-03-27 06:35:52	3		19	1
145	2024-03-28 07:38:54.109019+05	44	from (admin) to (lethalboi) on 2024-03-27 06:29:14	3		19	1
146	2024-03-28 07:38:54.109366+05	42	from (admin) to (lethalboi) on 2024-03-27 06:27:29	3		19	1
147	2024-03-28 07:38:54.109978+05	40	from (admin) to (lethalboi) on 2024-03-27 06:26:29	3		19	1
148	2024-03-28 07:38:54.110302+05	38	from (admin) to (lethalboi) on 2024-03-27 06:16:03	3		19	1
149	2024-03-28 07:38:54.110621+05	36	from (admin) to (lethalboi) on 2024-03-27 06:14:47	3		19	1
150	2024-03-28 07:38:54.110946+05	34	from (admin) to (lethalboi) on 2024-03-27 06:02:39	3		19	1
151	2024-03-28 07:38:54.111262+05	32	from (admin) to (lethalboi) on 2024-03-27 05:48:14	3		19	1
152	2024-03-28 07:38:54.111574+05	30	from (admin) to (lethalboi) on 2024-03-27 05:41:17	3		19	1
153	2024-03-28 07:38:54.111884+05	28	from (admin) to (lethalboi) on 2024-03-27 05:37:10	3		19	1
154	2024-03-28 07:38:54.112207+05	26	from (admin) to (lethalboi) on 2024-03-27 05:28:47	3		19	1
155	2024-03-28 07:38:54.112501+05	24	from (admin) to (lethalboi) on 2024-03-27 05:26:11	3		19	1
156	2024-03-28 07:38:54.112788+05	22	from (admin) to (lethalboi) on 2024-03-27 05:21:54	3		19	1
157	2024-03-28 07:38:54.113082+05	20	from (admin) to (lethalboi) on 2024-03-27 05:18:17	3		19	1
158	2024-03-28 07:38:54.113362+05	18	from (admin) to (lethalboi) on 2024-03-27 05:16:36	3		19	1
159	2024-03-28 07:38:54.113642+05	16	from (admin) to (lethalboi) on 2024-03-27 05:15:57	3		19	1
160	2024-03-28 07:38:54.113923+05	15	from (admin) to (lethalboi) on 2024-03-27 05:04:32	3		19	1
161	2024-03-28 07:38:54.114201+05	12	from (admin) to (lethalboi) on 2024-03-27 05:02:31	3		19	1
162	2024-03-28 07:38:54.114481+05	10	from (admin) to (lethalboi) on 2024-03-27 04:27:27	3		19	1
163	2024-03-28 07:38:54.114762+05	8	from (admin) to (lethalboi) on 2024-03-27 04:27:10	3		19	1
164	2024-03-28 07:38:54.115061+05	5	from (damnboi) to (admin) on 2024-03-27 02:52:55	3		19	1
165	2024-03-28 07:38:54.115341+05	4	from (admin) to (damnboi) on 2024-03-27 02:50:04	3		19	1
166	2024-03-28 10:57:11.656959+05	76	from (lethalboi) to (admin) on 2024-03-28 02:39:09	3		19	1
167	2024-03-28 11:00:22.198101+05	80	from (admin) to (lethalboi) on 2024-03-28 05:59:43	3		19	1
168	2024-03-28 11:00:22.204326+05	78	from (admin) to (lethalboi) on 2024-03-28 05:58:26	3		19	1
169	2024-03-28 11:00:41.635076+05	12	Booking object (12)	3		20	1
170	2024-03-28 11:00:41.638619+05	11	Booking object (11)	3		20	1
171	2024-03-28 12:06:58.905382+05	96	from (lethalboi) to (admin) on 2024-03-28 07:03:36	3		19	1
172	2024-03-28 12:06:58.918109+05	95	from (lethalboi) to (admin) on 2024-03-28 07:01:38	3		19	1
173	2024-03-28 12:06:58.919925+05	94	from (lethalboi) to (admin) on 2024-03-28 07:00:32	3		19	1
174	2024-03-28 12:06:58.921025+05	93	from (lethalboi) to (admin) on 2024-03-28 06:59:33	3		19	1
175	2024-03-28 12:06:58.92198+05	92	from (admin) to (lethalboi) on 2024-03-28 06:58:46	3		19	1
176	2024-03-28 12:06:58.923085+05	90	from (admin) to (lethalboi) on 2024-03-28 06:53:39	3		19	1
177	2024-03-28 12:06:58.923961+05	88	from (admin) to (lethalboi) on 2024-03-28 06:45:50	3		19	1
178	2024-03-28 12:06:58.925182+05	86	from (admin) to (lethalboi) on 2024-03-28 06:42:31	3		19	1
179	2024-03-28 12:06:58.92614+05	84	from (admin) to (lethalboi) on 2024-03-28 06:42:07	3		19	1
180	2024-03-28 12:06:58.927096+05	82	from (admin) to (lethalboi) on 2024-03-28 06:22:34	3		19	1
181	2024-03-28 12:23:53.857474+05	100	from (lethalboi) to (admin) on 2024-03-28 07:21:16	3		19	1
182	2024-03-28 12:23:53.860402+05	99	from (lethalboi) to (admin) on 2024-03-28 07:14:26	3		19	1
183	2024-03-28 12:23:53.861415+05	98	from (lethalboi) to (admin) on 2024-03-28 07:11:15	3		19	1
184	2024-03-28 12:23:53.862292+05	97	from (lethalboi) to (admin) on 2024-03-28 07:09:56	3		19	1
185	2024-03-28 12:46:37.518868+05	114	from (admin) to (admin) on 2024-03-28 07:45:04	3		19	1
186	2024-03-28 12:46:37.525295+05	113	from (lethalboi) to (admin) on 2024-03-28 07:43:23	3		19	1
187	2024-03-28 12:46:37.526764+05	112	from (admin) to (lethalboi) on 2024-03-28 07:40:06	3		19	1
188	2024-03-28 12:46:37.528073+05	110	from (admin) to (lethalboi) on 2024-03-28 07:36:20	3		19	1
189	2024-03-28 12:46:37.529609+05	109	from (admin) to (lethalboi) on 2024-03-28 07:36:14	3		19	1
190	2024-03-28 12:46:37.531154+05	106	from (admin) to (lethalboi) on 2024-03-28 07:33:33	3		19	1
191	2024-03-28 12:46:37.532346+05	104	from (admin) to (lethalboi) on 2024-03-28 07:24:56	3		19	1
192	2024-03-28 12:46:37.533414+05	103	from (admin) to (lethalboi) on 2024-03-28 07:24:39	3		19	1
193	2024-03-29 01:52:09.587892+05	135	from (admin) to (lethalboi) on 2024-03-28 20:47:26	3		19	1
194	2024-03-29 01:52:09.597622+05	133	from (lethalboi) to (admin) on 2024-03-28 20:43:20	3		19	1
195	2024-03-29 01:52:09.598759+05	132	from (admin) to (lethalboi) on 2024-03-28 20:00:14	3		19	1
196	2024-03-29 01:52:09.599657+05	130	from (admin) to (lethalboi) on 2024-03-28 16:47:56	3		19	1
197	2024-03-29 01:52:09.600563+05	128	from (admin) to (lethalboi) on 2024-03-28 16:38:39	3		19	1
198	2024-03-29 01:52:09.601946+05	126	from (admin) to (lethalboi) on 2024-03-28 16:15:32	3		19	1
199	2024-03-29 01:52:09.602826+05	124	from (admin) to (lethalboi) on 2024-03-28 08:01:41	3		19	1
200	2024-03-29 01:52:09.603653+05	122	from (admin) to (lethalboi) on 2024-03-28 08:00:13	3		19	1
201	2024-03-29 01:52:09.604926+05	120	from (admin) to (lethalboi) on 2024-03-28 07:53:21	3		19	1
202	2024-03-29 01:52:09.606214+05	118	from (admin) to (lethalboi) on 2024-03-28 07:50:46	3		19	1
203	2024-03-29 01:52:09.607137+05	116	from (admin) to (lethalboi) on 2024-03-28 07:47:53	3		19	1
204	2024-03-30 16:50:18.929831+05	179	from (admin) to (lethalboi) on 2024-03-30 11:47:26	3		19	1
205	2024-03-30 16:50:18.937139+05	177	from (admin) to (lethalboi) on 2024-03-30 11:46:54	3		19	1
206	2024-03-30 16:50:18.939025+05	176	from (lethalboi) to (admin) on 2024-03-30 11:46:39	3		19	1
207	2024-03-30 16:50:18.940697+05	175	from (admin) to (lethalboi) on 2024-03-30 11:43:34	3		19	1
208	2024-03-30 16:50:18.942403+05	173	from (admin) to (lethalboi) on 2024-03-30 11:39:31	3		19	1
209	2024-03-30 16:50:18.94391+05	171	from (admin) to (lethalboi) on 2024-03-29 09:00:53	3		19	1
210	2024-03-30 16:50:18.94531+05	170	from (admin) to (lethalboi) on 2024-03-29 09:00:51	3		19	1
211	2024-03-30 16:50:18.946994+05	169	from (admin) to (lethalboi) on 2024-03-29 09:00:48	3		19	1
212	2024-03-30 16:50:18.948945+05	165	from (admin) to (lethalboi) on 2024-03-29 08:57:36	3		19	1
213	2024-03-30 16:50:18.950011+05	164	from (admin) to (lethalboi) on 2024-03-29 08:55:48	3		19	1
214	2024-03-30 16:50:18.950885+05	161	from (admin) to (lethalboi) on 2024-03-29 08:54:27	3		19	1
215	2024-03-30 16:50:18.951671+05	159	from (admin) to (admin) on 2024-03-29 01:40:23	3		19	1
216	2024-03-30 16:50:18.952644+05	158	from (lethalboi) to (admin) on 2024-03-29 01:34:36	3		19	1
217	2024-03-30 16:50:18.953782+05	157	from (admin) to (lethalboi) on 2024-03-29 01:34:29	3		19	1
218	2024-03-30 16:50:18.955147+05	156	from (admin) to (lethalboi) on 2024-03-29 01:34:26	3		19	1
219	2024-03-30 16:50:18.956577+05	153	from (admin) to (lethalboi) on 2024-03-28 20:58:29	3		19	1
220	2024-03-30 16:50:18.957981+05	152	from (admin) to (lethalboi) on 2024-03-28 20:58:27	3		19	1
221	2024-03-30 16:50:18.958985+05	151	from (admin) to (lethalboi) on 2024-03-28 20:58:24	3		19	1
222	2024-03-30 16:50:18.959997+05	150	from (admin) to (lethalboi) on 2024-03-28 20:58:22	3		19	1
223	2024-03-30 16:50:18.960931+05	145	from (admin) to (lethalboi) on 2024-03-28 20:57:22	3		19	1
224	2024-03-30 16:50:18.96192+05	144	from (admin) to (lethalboi) on 2024-03-28 20:57:21	3		19	1
225	2024-03-30 16:50:18.963669+05	143	from (admin) to (lethalboi) on 2024-03-28 20:57:19	3		19	1
226	2024-03-30 16:50:18.965992+05	142	from (admin) to (lethalboi) on 2024-03-28 20:57:17	3		19	1
227	2024-03-30 16:50:18.968159+05	138	from (admin) to (lethalboi) on 2024-03-28 20:54:56	3		19	1
228	2024-03-30 16:54:55.091968+05	15	Booking object (15)	3		20	1
229	2024-03-30 16:54:55.096263+05	14	Booking object (14)	3		20	1
230	2024-03-30 16:54:55.09756+05	13	Booking object (13)	3		20	1
231	2024-04-16 03:31:28.998199+05	18	Booking object (18)	3		20	1
232	2024-04-16 03:31:29.006624+05	17	Booking object (17)	3		20	1
233	2024-04-16 03:31:29.008026+05	16	Booking object (16)	3		20	1
234	2024-04-16 03:31:36.970195+05	275	from (admin) to (lethalboi) on 2024-04-15 20:45:50	3		19	1
235	2024-04-16 03:31:36.973652+05	274	from (lethalboi) to (admin) on 2024-04-15 20:45:48	3		19	1
236	2024-04-16 03:31:36.974669+05	273	from (admin) to (lethalboi) on 2024-04-15 20:45:44	3		19	1
237	2024-04-16 03:31:36.975464+05	271	from (admin) to (lethalboi) on 2024-04-15 20:45:40	3		19	1
238	2024-04-16 03:31:36.976824+05	269	from (admin) to (lethalboi) on 2024-04-15 20:45:32	3		19	1
239	2024-04-16 03:31:36.977555+05	267	from (admin) to (lethalboi) on 2024-04-15 20:45:02	3		19	1
240	2024-04-16 03:31:36.978277+05	265	from (admin) to (lethalboi) on 2024-04-15 20:15:16	3		19	1
241	2024-04-16 03:31:36.978958+05	263	from (admin) to (lethalboi) on 2024-04-15 20:14:38	3		19	1
242	2024-04-16 03:31:36.979699+05	261	from (admin) to (lethalboi) on 2024-04-15 20:07:43	3		19	1
243	2024-04-16 03:31:36.980909+05	259	from (admin) to (lethalboi) on 2024-04-15 20:07:19	3		19	1
244	2024-04-16 03:31:36.982553+05	257	from (admin) to (lethalboi) on 2024-04-15 20:04:50	3		19	1
245	2024-04-16 03:31:36.98375+05	255	from (admin) to (lethalboi) on 2024-03-31 00:32:21	3		19	1
246	2024-04-16 03:31:36.984598+05	254	from (lethalboi) to (admin) on 2024-03-31 00:32:18	3		19	1
247	2024-04-16 03:31:36.985298+05	253	from (admin) to (lethalboi) on 2024-03-31 00:32:04	3		19	1
248	2024-04-16 03:31:36.986017+05	251	from (admin) to (lethalboi) on 2024-03-31 00:31:59	3		19	1
249	2024-04-16 03:31:36.986734+05	249	from (admin) to (lethalboi) on 2024-03-31 00:27:55	3		19	1
250	2024-04-16 03:31:36.987411+05	248	from (admin) to (lethalboi) on 2024-03-31 00:27:54	3		19	1
251	2024-04-16 03:31:36.98805+05	245	from (admin) to (lethalboi) on 2024-03-31 00:26:45	3		19	1
252	2024-04-16 03:31:36.988749+05	243	from (admin) to (lethalboi) on 2024-03-31 00:25:57	3		19	1
253	2024-04-16 03:31:36.989405+05	241	from (admin) to (lethalboi) on 2024-03-31 00:24:46	3		19	1
254	2024-04-16 03:31:36.990059+05	239	from (admin) to (lethalboi) on 2024-03-31 00:23:40	3		19	1
255	2024-04-16 03:31:36.990778+05	237	from (admin) to (lethalboi) on 2024-03-31 00:17:59	3		19	1
256	2024-04-16 03:31:36.99149+05	235	from (admin) to (lethalboi) on 2024-03-31 00:00:26	3		19	1
257	2024-04-16 03:31:36.992239+05	233	from (admin) to (lethalboi) on 2024-03-30 23:48:27	3		19	1
258	2024-04-16 03:31:36.992951+05	231	from (admin) to (lethalboi) on 2024-03-30 22:43:40	3		19	1
259	2024-04-16 03:31:36.993635+05	229	from (admin) to (lethalboi) on 2024-03-30 22:42:59	3		19	1
260	2024-04-16 03:31:36.994297+05	227	from (admin) to (lethalboi) on 2024-03-30 22:40:35	3		19	1
261	2024-04-16 03:31:36.994972+05	225	from (admin) to (lethalboi) on 2024-03-30 22:39:51	3		19	1
262	2024-04-16 03:31:36.995634+05	223	from (admin) to (lethalboi) on 2024-03-30 22:38:45	3		19	1
263	2024-04-16 03:31:36.996448+05	221	from (admin) to (lethalboi) on 2024-03-30 22:37:00	3		19	1
264	2024-04-16 03:31:36.997375+05	219	from (admin) to (lethalboi) on 2024-03-30 22:36:12	3		19	1
265	2024-04-16 03:31:36.998367+05	217	from (admin) to (lethalboi) on 2024-03-30 22:33:05	3		19	1
266	2024-04-16 03:31:36.999485+05	215	from (admin) to (lethalboi) on 2024-03-30 22:29:30	3		19	1
267	2024-04-16 03:31:37.000639+05	214	from (admin) to (lethalboi) on 2024-03-30 22:29:29	3		19	1
268	2024-04-16 03:31:37.001855+05	213	from (admin) to (lethalboi) on 2024-03-30 22:29:28	3		19	1
269	2024-04-16 03:31:37.002783+05	209	from (admin) to (lethalboi) on 2024-03-30 22:25:55	3		19	1
270	2024-04-16 03:31:37.003629+05	207	from (admin) to (lethalboi) on 2024-03-30 21:57:05	3		19	1
271	2024-04-16 03:31:37.004325+05	205	from (admin) to (lethalboi) on 2024-03-30 21:54:43	3		19	1
272	2024-04-16 03:31:37.004993+05	203	from (admin) to (lethalboi) on 2024-03-30 14:43:12	3		19	1
273	2024-04-16 03:31:37.005644+05	201	from (admin) to (lethalboi) on 2024-03-30 13:42:58	3		19	1
274	2024-04-16 03:31:37.00639+05	199	from (admin) to (lethalboi) on 2024-03-30 13:35:19	3		19	1
275	2024-04-16 03:31:37.007044+05	197	from (admin) to (lethalboi) on 2024-03-30 13:22:49	3		19	1
276	2024-04-16 03:31:37.007705+05	195	from (admin) to (lethalboi) on 2024-03-30 12:56:25	3		19	1
277	2024-04-16 03:31:37.008337+05	193	from (admin) to (lethalboi) on 2024-03-30 12:48:17	3		19	1
278	2024-04-16 03:31:37.008969+05	191	from (admin) to (lethalboi) on 2024-03-30 12:18:24	3		19	1
279	2024-04-16 03:31:37.009617+05	189	from (admin) to (lethalboi) on 2024-03-30 12:14:02	3		19	1
280	2024-04-16 03:31:37.010293+05	187	from (admin) to (lethalboi) on 2024-03-30 12:09:31	3		19	1
281	2024-04-16 03:31:37.010987+05	185	from (admin) to (lethalboi) on 2024-03-30 12:02:05	3		19	1
282	2024-04-16 03:31:37.011681+05	183	from (admin) to (lethalboi) on 2024-03-30 12:00:15	3		19	1
283	2024-04-16 03:31:37.012346+05	181	from (admin) to (lethalboi) on 2024-03-30 11:56:39	3		19	1
284	2024-04-16 03:31:37.013105+05	180	from (lethalboi) to (admin) on 2024-03-30 11:55:07	3		19	1
285	2024-04-16 18:58:03.846998+05	22	Booking object (22)	3		20	1
286	2024-04-16 18:58:03.856606+05	21	Booking object (21)	3		20	1
287	2024-04-16 18:58:03.858296+05	20	Booking object (20)	3		20	1
288	2024-04-16 18:58:03.859193+05	19	Booking object (19)	3		20	1
289	2024-04-16 19:01:32.559951+05	285	from (admin) to (lethalboi) on 2024-04-16 12:10:25	3		19	1
290	2024-04-16 19:01:32.563919+05	284	from (lethalboi) to (admin) on 2024-04-16 12:10:22	3		19	1
291	2024-04-16 19:01:32.565286+05	283	from (admin) to (lethalboi) on 2024-04-16 12:10:14	3		19	1
292	2024-04-16 19:01:32.56692+05	282	from (lethalboi) to (admin) on 2024-04-16 12:10:07	3		19	1
293	2024-04-16 19:01:32.568554+05	281	from (admin) to (lethalboi) on 2024-04-16 12:08:58	3		19	1
294	2024-04-16 19:01:32.569874+05	280	from (lethalboi) to (admin) on 2024-04-16 12:08:56	3		19	1
295	2024-04-16 19:01:32.571012+05	279	from (admin) to (lethalboi) on 2024-04-15 22:46:03	3		19	1
296	2024-04-16 19:01:32.571877+05	278	from (lethalboi) to (admin) on 2024-04-15 22:45:58	3		19	1
297	2024-04-16 19:01:32.572825+05	277	from (admin) to (lethalboi) on 2024-04-15 22:45:04	3		19	1
298	2024-04-17 23:13:12.179759+05	293	from (admin) to (lethalboi) on 2024-04-16 14:03:26	3		19	1
299	2024-04-17 23:13:12.192062+05	292	from (lethalboi) to (admin) on 2024-04-16 14:03:22	3		19	1
300	2024-04-17 23:13:12.193299+05	291	from (admin) to (lethalboi) on 2024-04-16 14:03:15	3		19	1
301	2024-04-17 23:13:12.194219+05	290	from (lethalboi) to (admin) on 2024-04-16 14:03:11	3		19	1
302	2024-04-17 23:13:12.195152+05	289	from (admin) to (lethalboi) on 2024-04-16 14:03:07	3		19	1
303	2024-04-17 23:13:12.195986+05	288	from (lethalboi) to (admin) on 2024-04-16 14:03:03	3		19	1
304	2024-04-17 23:13:12.197504+05	287	from (admin) to (lethalboi) on 2024-04-16 14:02:52	3		19	1
305	2024-04-17 23:13:12.198849+05	286	from (lethalboi) to (admin) on 2024-04-16 14:02:47	3		19	1
306	2024-04-17 23:17:39.13159+05	54	id: 54, on 2024-04-17 00:00:00	3		20	1
307	2024-04-17 23:18:44.7428+05	295	from (admin) to (lethalboi) on 2024-04-17 18:13:40	3		19	1
308	2024-04-17 23:18:44.746341+05	294	from (lethalboi) to (admin) on 2024-04-17 18:13:24	3		19	1
309	2024-04-17 23:26:31.596258+05	55	id: 55, on 2024-04-17 00:00:00	3		20	1
310	2024-04-17 23:26:36.017272+05	297	from (admin) to (lethalboi) on 2024-04-17 18:25:14	3		19	1
311	2024-04-17 23:26:36.019735+05	296	from (lethalboi) to (admin) on 2024-04-17 18:25:12	3		19	1
312	2024-04-18 00:01:35.883237+05	299	from (admin) to (lethalboi) on 2024-04-17 18:26:46	3		19	1
313	2024-04-18 00:01:35.89084+05	298	from (lethalboi) to (admin) on 2024-04-17 18:26:40	3		19	1
314	2024-04-18 00:02:27.445574+05	301	from (admin) to (lethalboi) on 2024-04-17 19:01:47	3		19	1
315	2024-04-18 00:02:52.687359+05	300	from (lethalboi) to (admin) on 2024-04-17 19:01:43	3		19	1
316	2024-04-18 00:11:27.286443+05	303	from (admin) to (lethalboi) on 2024-04-17 19:04:11	3		19	1
317	2024-04-18 00:11:27.291944+05	302	from (lethalboi) to (admin) on 2024-04-17 19:02:56	3		19	1
318	2024-04-18 00:22:13.637628+05	305	from (admin) to (lethalboi) on 2024-04-17 19:13:20	3		19	1
319	2024-04-18 00:22:13.642306+05	304	from (lethalboi) to (admin) on 2024-04-17 19:13:16	3		19	1
320	2024-04-18 00:31:45.316768+05	60	id: 60, on 2024-04-17 19:22:24	3		20	1
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
16	uzrent	notification
17	uzrent	usernotifications
18	uzrent	hostnotifications
19	uzrent	notifications
15	uzrent	bookmark
20	uzrent	booking
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
28	uzrent	0010_remove_notification_user_notification_reciever_and_more	2024-03-20 08:58:27.680005+05
29	uzrent	0011_notification_room_id	2024-03-20 09:12:30.89977+05
30	uzrent	0012_hostnotifications_usernotifications_and_more	2024-03-20 09:18:42.989477+05
31	uzrent	0013_remove_usernotifications_reciever_and_more	2024-03-20 09:41:08.35151+05
32	uzrent	0014_alter_notifications_options	2024-03-24 07:03:57.342354+05
33	uzrent	0015_alter_notifications_created_at	2024-03-24 08:18:24.600704+05
34	uzrent	0016_notifications_check_in_notifications_check_out	2024-03-24 11:50:07.055166+05
35	uzrent	0017_notifications_confirmed	2024-03-24 12:16:16.204912+05
36	uzrent	0018_rename_roomsave_bookmark_booking	2024-03-25 09:32:26.138095+05
37	uzrent	0019_rename_room_id_notifications_room	2024-03-25 21:21:20.58723+05
38	uzrent	0020_hostnotifications_usernotifications_and_more	2024-03-26 02:28:42.393212+05
39	uzrent	0021_remove_usernotifications_reciever_and_more	2024-03-27 07:29:42.549503+05
40	uzrent	0022_booking_created_at	2024-04-16 03:08:19.51657+05
41	uzrent	0022_booking_created_at_booking_user	2024-04-16 03:42:51.015912+05
42	uzrent	0023_merge_20240416_0342	2024-04-16 03:42:51.016671+05
43	uzrent	0024_alter_booking_created_at_alter_bookmark_date_and_more	2024-04-17 23:17:27.293059+05
44	uzrent	0025_alter_booking_created_at	2024-04-17 23:26:21.043141+05
45	uzrent	0026_rename_notifications_notification	2024-04-18 00:24:40.956557+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0l9kx3dhutmrvv0v1ykb6be4zgi52ti4	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1riQqO:ZIegqvbHo4hqehlIGq46wn2jub6YbXL6u7GN1Z_5Juw	2024-03-22 08:24:24.193699+05
n62mb0zn92zgtsmdb9rc5x5ylqe54fvi	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1roD2g:gfLvM-eWoRMJ0cvL9QK1bElixZl82aAAU8SkQnRZrYo	2024-04-07 06:52:58.809728+05
iragoloezydjxmo7ipaqm5pvdtyr2276	.eJxVjDsOwjAQRO_iGlm7-E9Jzxms9drBAeRIcVIh7k4ipYAp572Zt4i0LjWuvcxxzOIitDj9don4WdoO8oPafZI8tWUek9wVedAub1Mur-vh_h1U6nVbG8tnBYAUgjKMaYvzdqDBE1PWGhA0QVaOdXEGPJPGEnJJgFYFj-LzBeFFN7g:1roD3z:ZBCXxK7U4miW0G9CAl0eS9IhXxX2wIkt4IDPcimEH0o	2024-04-07 06:54:19.094234+05
0ku0ybn14iok1dy5ud40hkr89y4aqmqe	.eJxVjDsOwjAQRO_iGlm7-E9Jzxms9drBAeRIcVIh7k4ipYAp572Zt4i0LjWuvcxxzOIitDj9don4WdoO8oPafZI8tWUek9wVedAub1Mur-vh_h1U6nVbG8tnBYAUgjKMaYvzdqDBE1PWGhA0QVaOdXEGPJPGEnJJgFYFj-LzBeFFN7g:1rpJgp:Jxa66RsRHy0Mxmm0vlgwl2gKuJXQWa9T5ffBEyiBnY8	2024-04-10 08:10:59.516443+05
qswp2g6adpi49illb1g4lud8o5nfzxuf	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1rpJh1:fY9grbAUqgjJ5pu-vKmuDwGkwExlzfvnrL7KrrtYMFE	2024-04-10 08:11:11.705418+05
c4hre52yof0p9ne5x004bm13zjq5sc3t	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1rqX2P:ZC0RvfxIMEeKYXqhggU4mxBOYEGODN8iTEwUCqvpfRU	2024-04-13 16:38:17.660336+05
51ihen0r28xx7ysl631vsrd3no04dh95	.eJxVjDsOwjAQRO_iGlm7-E9Jzxms9drBAeRIcVIh7k4ipYAp572Zt4i0LjWuvcxxzOIitDj9don4WdoO8oPafZI8tWUek9wVedAub1Mur-vh_h1U6nVbG8tnBYAUgjKMaYvzdqDBE1PWGhA0QVaOdXEGPJPGEnJJgFYFj-LzBeFFN7g:1rqX2x:hEujmbIX2o05kOAIx-UoOWC7dWlcaVFkehHlyq-lqCQ	2024-04-13 16:38:51.464623+05
jtto6x0kkjl1s5lckgppnv7l61tjfvht	.eJxVjMsOwiAQRf-FtSE8OjC4dO83kKEMUjUlKe3K-O_apAvd3nPOfYlI21rj1nmJUxZnocXpd0s0PnjeQb7TfGtybPO6TEnuijxol9eW-Xk53L-DSr1-a0gWwLuknULQYAanRgbLHgEHT6yKz8FmZNKoEG0xGFzwzhlDjFjE-wOotjZ-:1rvmQd:J8NbmzSR8igCc_Xd_BhoAo2vZApaKRmvjWw1-spleiA	2024-04-28 04:04:59.109195+05
ysqpntqe0q4y4nc83ww0d0pn9mszlojp	.eJxVjDsOwjAQRO_iGlm7-E9Jzxms9drBAeRIcVIh7k4ipYAp572Zt4i0LjWuvcxxzOIitDj9don4WdoO8oPafZI8tWUek9wVedAub1Mur-vh_h1U6nVbG8tnBYAUgjKMaYvzdqDBE1PWGhA0QVaOdXEGPJPGEnJJgFYFj-LzBeFFN7g:1rwSWo:aIabgzgdNGvyC_jMUf4XRRV_2NQm3IbJ9uZjL7KYiOA	2024-04-30 01:02:10.545534+05
\.


--
-- Data for Name: uzrent_amenity; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_amenity (id, name) FROM stdin;
1	Fast Wi-Fi
2	Outdoor Kitchen
\.


--
-- Data for Name: uzrent_booking; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_booking (id, check_in, check_out, room_id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: uzrent_bookmark; Type: TABLE DATA; Schema: public; Owner: abdu
--

COPY public.uzrent_bookmark (id, date, post_id, user_id) FROM stdin;
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

COPY public.uzrent_notification (id, message, check_in, check_out, confirmed, created_at, reciever_id, room_id, sender_id) FROM stdin;
325	Hi, I would like to book your <a class="roomUrl" href="/rooms/2" class="underline" style="color: #06c;">room</a>	2024-03-02	2024-03-26	f	2024-04-18 00:58:52.398676+05	1	2	4
326	Hi, I would like to book your <a class="roomUrl" href="/rooms/3" class="underline" style="color: #06c;">room</a>	2024-03-02	2024-03-26	f	2024-04-18 00:59:06.048872+05	1	3	4
321	Sorry, but the booking for <a class="roomUrl" href="/rooms/2" class="underline" style="color: #06c;">this</a> room has been cancelled by the host	\N	\N	f	2024-04-18 00:57:56.770923+05	4	\N	1
323	Thank you for booking our room, we will be waiting for you on 2024-03-02	\N	\N	f	2024-04-18 00:58:07.889608+05	4	\N	1
324	Sorry, but the booking for <a class="roomUrl" href="/rooms/2" class="underline" style="color: #06c;">this</a> room has been cancelled by the host	\N	\N	f	2024-04-18 00:58:16.005155+05	4	\N	1
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
5		to bottom, #00b8ff, #d01212	damn boi		damn@gmail.com	\N	2024-03-26 03:15:14.072537+05	5
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 320, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);


--
-- Name: uzrent_amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_amenity_id_seq', 2, true);


--
-- Name: uzrent_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_booking_id_seq', 65, true);


--
-- Name: uzrent_houserule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_houserule_id_seq', 1, true);


--
-- Name: uzrent_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_notifications_id_seq', 326, true);


--
-- Name: uzrent_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_photo_id_seq', 5, true);


--
-- Name: uzrent_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abdu
--

SELECT pg_catalog.setval('public.uzrent_profile_id_seq', 5, true);


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
-- Name: uzrent_booking uzrent_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_booking
    ADD CONSTRAINT uzrent_booking_pkey PRIMARY KEY (id);


--
-- Name: uzrent_houserule uzrent_houserule_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_houserule
    ADD CONSTRAINT uzrent_houserule_pkey PRIMARY KEY (id);


--
-- Name: uzrent_notification uzrent_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_notification
    ADD CONSTRAINT uzrent_notifications_pkey PRIMARY KEY (id);


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
-- Name: uzrent_bookmark uzrent_roomsave_pkey; Type: CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_bookmark
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
-- Name: uzrent_booking_room_id_d2652f9c; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_booking_room_id_d2652f9c ON public.uzrent_booking USING btree (room_id);


--
-- Name: uzrent_booking_user_id_39852c9a; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_booking_user_id_39852c9a ON public.uzrent_booking USING btree (user_id);


--
-- Name: uzrent_notifications_reciever_id_c3581c92; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_notifications_reciever_id_c3581c92 ON public.uzrent_notification USING btree (reciever_id);


--
-- Name: uzrent_notifications_room_id_3afe7f9f; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_notifications_room_id_3afe7f9f ON public.uzrent_notification USING btree (room_id);


--
-- Name: uzrent_notifications_sender_id_f06e6b36; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_notifications_sender_id_f06e6b36 ON public.uzrent_notification USING btree (sender_id);


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

CREATE INDEX uzrent_roomsave_post_id_c0c630df ON public.uzrent_bookmark USING btree (post_id);


--
-- Name: uzrent_roomsave_user_id_62e0bc37; Type: INDEX; Schema: public; Owner: abdu
--

CREATE INDEX uzrent_roomsave_user_id_62e0bc37 ON public.uzrent_bookmark USING btree (user_id);


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
-- Name: uzrent_booking uzrent_booking_room_id_d2652f9c_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_booking
    ADD CONSTRAINT uzrent_booking_room_id_d2652f9c_fk_uzrent_room_id FOREIGN KEY (room_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_booking uzrent_booking_user_id_39852c9a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_booking
    ADD CONSTRAINT uzrent_booking_user_id_39852c9a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_notification uzrent_notifications_reciever_id_c3581c92_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_notification
    ADD CONSTRAINT uzrent_notifications_reciever_id_c3581c92_fk_auth_user_id FOREIGN KEY (reciever_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_notification uzrent_notifications_room_id_3afe7f9f_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_notification
    ADD CONSTRAINT uzrent_notifications_room_id_3afe7f9f_fk_uzrent_room_id FOREIGN KEY (room_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_notification uzrent_notifications_sender_id_f06e6b36_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_notification
    ADD CONSTRAINT uzrent_notifications_sender_id_f06e6b36_fk_auth_user_id FOREIGN KEY (sender_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: uzrent_bookmark uzrent_roomsave_post_id_c0c630df_fk_uzrent_room_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_bookmark
    ADD CONSTRAINT uzrent_roomsave_post_id_c0c630df_fk_uzrent_room_id FOREIGN KEY (post_id) REFERENCES public.uzrent_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uzrent_bookmark uzrent_roomsave_user_id_62e0bc37_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abdu
--

ALTER TABLE ONLY public.uzrent_bookmark
    ADD CONSTRAINT uzrent_roomsave_user_id_62e0bc37_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

