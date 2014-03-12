--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_type character varying(255),
    author_id integer,
    namespace character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO postgres;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    operate character varying(255),
    content character varying(255),
    user_id integer,
    shop_id integer NOT NULL,
    class_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activities_id_seq', 6, true);


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(128) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reset_password_sent_at timestamp without time zone
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admin_users_id_seq', 1, true);


--
-- Name: api_clients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE api_clients (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    api_key character varying(32),
    password character varying(32),
    shared_secret character varying(32),
    title character varying(36),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.api_clients OWNER TO postgres;

--
-- Name: api_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE api_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_clients_id_seq OWNER TO postgres;

--
-- Name: api_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE api_clients_id_seq OWNED BY api_clients.id;


--
-- Name: api_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('api_clients_id_seq', 1, true);


--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    blog_id integer NOT NULL,
    title character varying(255),
    body_html text,
    published boolean DEFAULT true,
    user_id integer,
    author character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('articles_id_seq', 1, false);


--
-- Name: articles_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE articles_tags (
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.articles_tags OWNER TO postgres;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blogs (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    title character varying(255) NOT NULL,
    commentable character varying(255),
    handle character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blogs_id_seq', 3, true);


--
-- Name: cancel_reasons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cancel_reasons (
    id integer NOT NULL,
    selection character varying(255),
    detailed character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cancel_reasons OWNER TO postgres;

--
-- Name: cancel_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cancel_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cancel_reasons_id_seq OWNER TO postgres;

--
-- Name: cancel_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cancel_reasons_id_seq OWNED BY cancel_reasons.id;


--
-- Name: cancel_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cancel_reasons_id_seq', 1, false);


--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carts (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    token character varying(32) NOT NULL,
    session_id character varying(32) NOT NULL,
    cart_hash character varying(255) NOT NULL,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    note character varying(255)
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE carts_id_seq OWNED BY carts.id;


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('carts_id_seq', 1, false);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    article_id integer NOT NULL,
    shop_id integer NOT NULL,
    status character varying(255),
    author character varying(255),
    email character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Name: consumptions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE consumptions (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    shop_id integer NOT NULL,
    quantity integer,
    price double precision,
    status boolean,
    plan_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.consumptions OWNER TO postgres;

--
-- Name: consumptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consumptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumptions_id_seq OWNER TO postgres;

--
-- Name: consumptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consumptions_id_seq OWNED BY consumptions.id;


--
-- Name: consumptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('consumptions_id_seq', 1, false);


--
-- Name: custom_collection_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE custom_collection_products (
    id integer NOT NULL,
    custom_collection_id integer NOT NULL,
    product_id integer NOT NULL,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.custom_collection_products OWNER TO postgres;

--
-- Name: custom_collection_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE custom_collection_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_collection_products_id_seq OWNER TO postgres;

--
-- Name: custom_collection_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE custom_collection_products_id_seq OWNED BY custom_collection_products.id;


--
-- Name: custom_collection_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('custom_collection_products_id_seq', 6, true);


--
-- Name: custom_collections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE custom_collections (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    title character varying(255),
    published boolean DEFAULT true,
    handle character varying(255) NOT NULL,
    body_html text,
    products_order character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.custom_collections OWNER TO postgres;

--
-- Name: custom_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE custom_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_collections_id_seq OWNER TO postgres;

--
-- Name: custom_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE custom_collections_id_seq OWNED BY custom_collections.id;


--
-- Name: custom_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('custom_collections_id_seq', 3, true);


--
-- Name: customer_addresses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_addresses (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    name character varying(255),
    company character varying(64),
    province character varying(64),
    city character varying(64),
    district character varying(64),
    address1 character varying(255),
    address2 character varying(255),
    zip character varying(12),
    phone character varying(64),
    default_address boolean DEFAULT false
);


ALTER TABLE public.customer_addresses OWNER TO postgres;

--
-- Name: customer_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_addresses_id_seq OWNER TO postgres;

--
-- Name: customer_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customer_addresses_id_seq OWNED BY customer_addresses.id;


--
-- Name: customer_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customer_addresses_id_seq', 2, true);


--
-- Name: customer_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_groups (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name character varying(32) NOT NULL,
    term character varying(32),
    query character varying(512),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_groups OWNER TO postgres;

--
-- Name: customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_groups_id_seq OWNER TO postgres;

--
-- Name: customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customer_groups_id_seq OWNED BY customer_groups.id;


--
-- Name: customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customer_groups_id_seq', 3, true);


--
-- Name: customer_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_tags (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_tags OWNER TO postgres;

--
-- Name: customer_tags_customers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_tags_customers (
    customer_id integer NOT NULL,
    customer_tag_id integer NOT NULL
);


ALTER TABLE public.customer_tags_customers OWNER TO postgres;

--
-- Name: customer_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_tags_id_seq OWNER TO postgres;

--
-- Name: customer_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customer_tags_id_seq OWNED BY customer_tags.id;


--
-- Name: customer_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customer_tags_id_seq', 1, false);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    status character varying(8) NOT NULL,
    name character varying(16) NOT NULL,
    note character varying(255),
    total_spent double precision DEFAULT 0,
    orders_count integer DEFAULT 0,
    accepts_marketing boolean DEFAULT true,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(128) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    authentication_token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reset_password_sent_at timestamp without time zone
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customers_id_seq', 2, true);


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE discounts (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    code character varying(32),
    discount_type character varying(16),
    value double precision,
    used_times integer DEFAULT 0,
    usage_limit integer
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_id_seq OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE discounts_id_seq OWNED BY discounts.id;


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('discounts_id_seq', 1, false);


--
-- Name: emails; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE emails (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    title character varying(255) NOT NULL,
    mail_type character varying(255) NOT NULL,
    body text NOT NULL,
    include_html boolean DEFAULT false,
    body_html text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.emails OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emails_id_seq OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE emails_id_seq OWNED BY emails.id;


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('emails_id_seq', 21, true);


--
-- Name: kindeditors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kindeditors (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    kindeditor_image_uid character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.kindeditors OWNER TO postgres;

--
-- Name: kindeditors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kindeditors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kindeditors_id_seq OWNER TO postgres;

--
-- Name: kindeditors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kindeditors_id_seq OWNED BY kindeditors.id;


--
-- Name: kindeditors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kindeditors_id_seq', 1, false);


--
-- Name: link_lists; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE link_lists (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    title character varying(255),
    handle character varying(255),
    system_default boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.link_lists OWNER TO postgres;

--
-- Name: link_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE link_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_lists_id_seq OWNER TO postgres;

--
-- Name: link_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE link_lists_id_seq OWNED BY link_lists.id;


--
-- Name: link_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('link_lists_id_seq', 6, true);


--
-- Name: links; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE links (
    id integer NOT NULL,
    link_list_id integer NOT NULL,
    title character varying(255),
    link_type character varying(255),
    subject_handle character varying(255),
    subject_params character varying(255),
    url character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.links OWNER TO postgres;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_id_seq OWNER TO postgres;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('links_id_seq', 15, true);


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying(64) NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying(255)
);


ALTER TABLE public.oauth_access_grants OWNER TO postgres;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_grants_id_seq OWNER TO postgres;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_access_grants_id_seq OWNED BY oauth_access_grants.id;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_access_grants_id_seq', 1, false);


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer NOT NULL,
    token character varying(64) NOT NULL,
    refresh_token character varying(64),
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying(255)
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_access_tokens_id_seq OWNED BY oauth_access_tokens.id;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_access_tokens_id_seq', 3, true);


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth_applications (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    uid character varying(64) NOT NULL,
    secret character varying(64) NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.oauth_applications OWNER TO postgres;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_applications_id_seq OWNER TO postgres;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth_applications_id_seq OWNED BY oauth_applications.id;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth_applications_id_seq', 1, true);


--
-- Name: order_discounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_discounts (
    id integer NOT NULL,
    order_id integer NOT NULL,
    code character varying(32),
    amount double precision
);


ALTER TABLE public.order_discounts OWNER TO postgres;

--
-- Name: order_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_discounts_id_seq OWNER TO postgres;

--
-- Name: order_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_discounts_id_seq OWNED BY order_discounts.id;


--
-- Name: order_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_discounts_id_seq', 1, false);


--
-- Name: order_fulfillments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_fulfillments (
    id integer NOT NULL,
    order_id integer NOT NULL,
    tracking_number character varying(255),
    tracking_company character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.order_fulfillments OWNER TO postgres;

--
-- Name: order_fulfillments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_fulfillments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_fulfillments_id_seq OWNER TO postgres;

--
-- Name: order_fulfillments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_fulfillments_id_seq OWNED BY order_fulfillments.id;


--
-- Name: order_fulfillments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_fulfillments_id_seq', 1, false);


--
-- Name: order_fulfillments_order_line_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_fulfillments_order_line_items (
    order_fulfillment_id integer NOT NULL,
    order_line_item_id integer NOT NULL
);


ALTER TABLE public.order_fulfillments_order_line_items OWNER TO postgres;

--
-- Name: order_histories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_histories (
    id integer NOT NULL,
    order_id integer NOT NULL,
    body character varying(255) NOT NULL,
    url character varying(64),
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.order_histories OWNER TO postgres;

--
-- Name: order_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_histories_id_seq OWNER TO postgres;

--
-- Name: order_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_histories_id_seq OWNED BY order_histories.id;


--
-- Name: order_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_histories_id_seq', 1, false);


--
-- Name: order_line_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_line_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_variant_id integer NOT NULL,
    price double precision NOT NULL,
    quantity integer NOT NULL,
    fulfilled boolean DEFAULT false,
    product_id integer NOT NULL,
    title character varying(255),
    variant_title character varying(255),
    name character varying(255),
    vendor character varying(255),
    requires_shipping boolean,
    grams integer,
    sku character varying(255)
);


ALTER TABLE public.order_line_items OWNER TO postgres;

--
-- Name: order_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_line_items_id_seq OWNER TO postgres;

--
-- Name: order_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_line_items_id_seq OWNED BY order_line_items.id;


--
-- Name: order_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_line_items_id_seq', 1, false);


--
-- Name: order_shipping_addresses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_shipping_addresses (
    id integer NOT NULL,
    order_id integer NOT NULL,
    name character varying(255) NOT NULL,
    company character varying(64),
    province character varying(64),
    city character varying(64),
    district character varying(64),
    address1 character varying(255) NOT NULL,
    address2 character varying(255),
    zip character varying(12),
    phone character varying(64) NOT NULL
);


ALTER TABLE public.order_shipping_addresses OWNER TO postgres;

--
-- Name: order_shipping_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_shipping_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_shipping_addresses_id_seq OWNER TO postgres;

--
-- Name: order_shipping_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_shipping_addresses_id_seq OWNED BY order_shipping_addresses.id;


--
-- Name: order_shipping_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_shipping_addresses_id_seq', 1, false);


--
-- Name: order_transactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_transactions (
    id integer NOT NULL,
    order_id integer NOT NULL,
    kind character varying(16) NOT NULL,
    amount double precision,
    created_at timestamp without time zone NOT NULL,
    status character varying(16),
    batch_no character varying(24)
);


ALTER TABLE public.order_transactions OWNER TO postgres;

--
-- Name: order_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_transactions_id_seq OWNER TO postgres;

--
-- Name: order_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order_transactions_id_seq OWNED BY order_transactions.id;


--
-- Name: order_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order_transactions_id_seq', 1, false);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    customer_id integer,
    token character varying(32) NOT NULL,
    name character varying(32) NOT NULL,
    number integer NOT NULL,
    order_number integer NOT NULL,
    status character varying(16) NOT NULL,
    financial_status character varying(16) NOT NULL,
    fulfillment_status character varying(16) NOT NULL,
    email character varying(32) NOT NULL,
    shipping_rate character varying(32),
    payment_id integer,
    total_line_items_price double precision NOT NULL,
    total_price double precision NOT NULL,
    note character varying(255),
    closed_at timestamp without time zone,
    cancel_reason character varying(16),
    cancelled_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subtotal_price double precision,
    trade_no character varying(16)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    title character varying(255),
    published boolean DEFAULT false,
    handle character varying(255) NOT NULL,
    body_html text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_id_seq', 6, true);


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    email character varying(255),
    payment_type_id integer,
    key character varying(255),
    account character varying(255),
    message text,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    service character varying(32)
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payments_id_seq', 1, false);


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    user_id integer,
    resource_id integer
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permissions_id_seq', 1, false);


--
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    product_id integer NOT NULL,
    product_image_uid character varying(255),
    product_image_format character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photos_id_seq', 1, false);


--
-- Name: price_based_shipping_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE price_based_shipping_rates (
    id integer NOT NULL,
    price double precision,
    min_order_subtotal double precision,
    max_order_subtotal double precision,
    name character varying(32),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shipping_id integer NOT NULL
);


ALTER TABLE public.price_based_shipping_rates OWNER TO postgres;

--
-- Name: price_based_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE price_based_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_based_shipping_rates_id_seq OWNER TO postgres;

--
-- Name: price_based_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE price_based_shipping_rates_id_seq OWNED BY price_based_shipping_rates.id;


--
-- Name: price_based_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('price_based_shipping_rates_id_seq', 1, false);


--
-- Name: product_options; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_options (
    id integer NOT NULL,
    product_id integer NOT NULL,
    name character varying(255),
    "position" integer
);


ALTER TABLE public.product_options OWNER TO postgres;

--
-- Name: product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_options_id_seq OWNER TO postgres;

--
-- Name: product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_options_id_seq OWNED BY product_options.id;


--
-- Name: product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_options_id_seq', 6, true);


--
-- Name: product_variants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_variants (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    product_id integer NOT NULL,
    price double precision DEFAULT 0.0 NOT NULL,
    weight double precision DEFAULT 0.0 NOT NULL,
    compare_at_price double precision,
    option1 character varying(255),
    option2 character varying(255),
    option3 character varying(255),
    sku character varying(255),
    requires_shipping boolean DEFAULT true,
    inventory_quantity integer,
    inventory_management character varying(255),
    inventory_policy character varying(255) DEFAULT 'deny'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.product_variants OWNER TO postgres;

--
-- Name: product_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variants_id_seq OWNER TO postgres;

--
-- Name: product_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_variants_id_seq OWNED BY product_variants.id;


--
-- Name: product_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_variants_id_seq', 6, true);


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    handle character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    published boolean DEFAULT true,
    body_html text,
    price double precision,
    product_type character varying(255),
    vendor character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_id_seq', 6, true);


--
-- Name: products_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products_tags (
    product_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.products_tags OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: shippings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shippings (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    code character varying(8),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shippings OWNER TO postgres;

--
-- Name: shippings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shippings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippings_id_seq OWNER TO postgres;

--
-- Name: shippings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shippings_id_seq OWNED BY shippings.id;


--
-- Name: shippings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shippings_id_seq', 3, true);


--
-- Name: shop_domains; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_domains (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    subdomain character varying(32),
    domain character varying(32),
    host character varying(64),
    "primary" boolean DEFAULT true,
    force_domain boolean DEFAULT false,
    record character varying(32),
    verified boolean DEFAULT true
);


ALTER TABLE public.shop_domains OWNER TO postgres;

--
-- Name: shop_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_domains_id_seq OWNER TO postgres;

--
-- Name: shop_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_domains_id_seq OWNED BY shop_domains.id;


--
-- Name: shop_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_domains_id_seq', 3, true);


--
-- Name: shop_policies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_policies (
    id integer NOT NULL,
    title character varying(255),
    body text,
    shop_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_policies OWNER TO postgres;

--
-- Name: shop_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_policies_id_seq OWNER TO postgres;

--
-- Name: shop_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_policies_id_seq OWNED BY shop_policies.id;


--
-- Name: shop_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_policies_id_seq', 1, false);


--
-- Name: shop_product_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_product_types (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name character varying(32)
);


ALTER TABLE public.shop_product_types OWNER TO postgres;

--
-- Name: shop_product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_types_id_seq OWNER TO postgres;

--
-- Name: shop_product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_product_types_id_seq OWNED BY shop_product_types.id;


--
-- Name: shop_product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_product_types_id_seq', 1, true);


--
-- Name: shop_product_vendors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_product_vendors (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name character varying(32)
);


ALTER TABLE public.shop_product_vendors OWNER TO postgres;

--
-- Name: shop_product_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_product_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_vendors_id_seq OWNER TO postgres;

--
-- Name: shop_product_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_product_vendors_id_seq OWNED BY shop_product_vendors.id;


--
-- Name: shop_product_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_product_vendors_id_seq', 1, true);


--
-- Name: shop_tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_tasks (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name character varying(255),
    completed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_tasks OWNER TO postgres;

--
-- Name: shop_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_tasks_id_seq OWNER TO postgres;

--
-- Name: shop_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_tasks_id_seq OWNED BY shop_tasks.id;


--
-- Name: shop_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_tasks_id_seq', 21, true);


--
-- Name: shop_theme_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_theme_settings (
    id integer NOT NULL,
    shop_theme_id integer NOT NULL,
    name character varying(64) NOT NULL,
    value character varying(128),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_theme_settings OWNER TO postgres;

--
-- Name: shop_theme_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_theme_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_theme_settings_id_seq OWNER TO postgres;

--
-- Name: shop_theme_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_theme_settings_id_seq OWNED BY shop_theme_settings.id;


--
-- Name: shop_theme_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_theme_settings_id_seq', 96, true);


--
-- Name: shop_themes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shop_themes (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    theme_id integer,
    name character varying(32) NOT NULL,
    role character varying(16) NOT NULL,
    load_preset character varying(16),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_themes OWNER TO postgres;

--
-- Name: shop_themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shop_themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_themes_id_seq OWNER TO postgres;

--
-- Name: shop_themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shop_themes_id_seq OWNED BY shop_themes.id;


--
-- Name: shop_themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shop_themes_id_seq', 3, true);


--
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shops (
    id integer NOT NULL,
    name character varying(16),
    phone character varying(16),
    plan character varying(255) DEFAULT 'free'::character varying,
    deadline date,
    province character varying(8),
    city character varying(8),
    district character varying(8),
    zip_code character varying(16),
    address character varying(64),
    email character varying(64),
    password character varying(64),
    password_enabled boolean DEFAULT false,
    password_message character varying(255),
    currency character varying(3),
    money_with_currency_format character varying(32),
    money_format character varying(32),
    money_with_currency_in_emails_format character varying(32),
    money_in_emails_format character varying(32),
    orders_count integer DEFAULT 0,
    order_number_format character varying(32) DEFAULT '#{{number}}'::character varying,
    customer_accounts character varying(255) DEFAULT 'optional'::character varying,
    signup_source character varying(16),
    guided boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    access_enabled boolean DEFAULT true
);


ALTER TABLE public.shops OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO postgres;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shops_id_seq', 3, true);


--
-- Name: smart_collection_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE smart_collection_products (
    id integer NOT NULL,
    smart_collection_id integer NOT NULL,
    product_id integer NOT NULL,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.smart_collection_products OWNER TO postgres;

--
-- Name: smart_collection_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE smart_collection_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.smart_collection_products_id_seq OWNER TO postgres;

--
-- Name: smart_collection_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE smart_collection_products_id_seq OWNED BY smart_collection_products.id;


--
-- Name: smart_collection_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('smart_collection_products_id_seq', 1, false);


--
-- Name: smart_collection_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE smart_collection_rules (
    id integer NOT NULL,
    smart_collection_id integer NOT NULL,
    "column" character varying(255),
    relation character varying(255),
    condition character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.smart_collection_rules OWNER TO postgres;

--
-- Name: smart_collection_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE smart_collection_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.smart_collection_rules_id_seq OWNER TO postgres;

--
-- Name: smart_collection_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE smart_collection_rules_id_seq OWNED BY smart_collection_rules.id;


--
-- Name: smart_collection_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('smart_collection_rules_id_seq', 1, false);


--
-- Name: smart_collections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE smart_collections (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    title character varying(255),
    published boolean DEFAULT true,
    handle character varying(255) NOT NULL,
    body_html text,
    products_order character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.smart_collections OWNER TO postgres;

--
-- Name: smart_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE smart_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.smart_collections_id_seq OWNER TO postgres;

--
-- Name: smart_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE smart_collections_id_seq OWNED BY smart_collections.id;


--
-- Name: smart_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('smart_collections_id_seq', 1, false);


--
-- Name: subscribes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subscribes (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    user_id integer,
    kind character varying(255),
    address character varying(255),
    number character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subscribes OWNER TO postgres;

--
-- Name: subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribes_id_seq OWNER TO postgres;

--
-- Name: subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subscribes_id_seq OWNED BY subscribes.id;


--
-- Name: subscribes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subscribes_id_seq', 3, true);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    name character varying(255) NOT NULL,
    category integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE themes (
    id integer NOT NULL,
    name character varying(16) NOT NULL,
    handle character varying(16),
    style character varying(16) NOT NULL,
    style_handle character varying(16),
    role character varying(16),
    price double precision DEFAULT 0,
    color character varying(8),
    "desc" character varying(255),
    shop character varying(32),
    site character varying(64),
    author character varying(16),
    email character varying(32),
    published boolean DEFAULT false,
    file character varying(64),
    main character varying(64),
    collection character varying(64),
    product character varying(64),
    "position" integer DEFAULT 0
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE themes_id_seq OWNED BY themes.id;


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('themes_id_seq', 1, true);


--
-- Name: translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE translations (
    id integer NOT NULL,
    key character varying(255),
    value character varying(255)
);


ALTER TABLE public.translations OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE translations_id_seq OWNED BY translations.id;


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('translations_id_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(128) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    name character varying(255),
    phone character varying(255),
    bio text,
    receive_announcements boolean DEFAULT true,
    shop_id integer NOT NULL,
    avatar_image_uid character varying(255),
    admin boolean DEFAULT true,
    authentication_token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reset_password_sent_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: webhooks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE webhooks (
    id integer NOT NULL,
    application_id integer,
    shop_id integer NOT NULL,
    event character varying(32) NOT NULL,
    callback_url character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.webhooks OWNER TO postgres;

--
-- Name: webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhooks_id_seq OWNER TO postgres;

--
-- Name: webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE webhooks_id_seq OWNED BY webhooks.id;


--
-- Name: webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('webhooks_id_seq', 1, false);


--
-- Name: weight_based_shipping_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE weight_based_shipping_rates (
    id integer NOT NULL,
    price double precision,
    weight_low double precision,
    weight_high double precision,
    name character varying(32),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shipping_id integer NOT NULL
);


ALTER TABLE public.weight_based_shipping_rates OWNER TO postgres;

--
-- Name: weight_based_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE weight_based_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weight_based_shipping_rates_id_seq OWNER TO postgres;

--
-- Name: weight_based_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE weight_based_shipping_rates_id_seq OWNED BY weight_based_shipping_rates.id;


--
-- Name: weight_based_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('weight_based_shipping_rates_id_seq', 3, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_clients ALTER COLUMN id SET DEFAULT nextval('api_clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cancel_reasons ALTER COLUMN id SET DEFAULT nextval('cancel_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consumptions ALTER COLUMN id SET DEFAULT nextval('consumptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY custom_collection_products ALTER COLUMN id SET DEFAULT nextval('custom_collection_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY custom_collections ALTER COLUMN id SET DEFAULT nextval('custom_collections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer_addresses ALTER COLUMN id SET DEFAULT nextval('customer_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer_groups ALTER COLUMN id SET DEFAULT nextval('customer_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer_tags ALTER COLUMN id SET DEFAULT nextval('customer_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discounts ALTER COLUMN id SET DEFAULT nextval('discounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emails ALTER COLUMN id SET DEFAULT nextval('emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kindeditors ALTER COLUMN id SET DEFAULT nextval('kindeditors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY link_lists ALTER COLUMN id SET DEFAULT nextval('link_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('oauth_access_grants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('oauth_access_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth_applications ALTER COLUMN id SET DEFAULT nextval('oauth_applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_discounts ALTER COLUMN id SET DEFAULT nextval('order_discounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_fulfillments ALTER COLUMN id SET DEFAULT nextval('order_fulfillments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_histories ALTER COLUMN id SET DEFAULT nextval('order_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_line_items ALTER COLUMN id SET DEFAULT nextval('order_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_shipping_addresses ALTER COLUMN id SET DEFAULT nextval('order_shipping_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_transactions ALTER COLUMN id SET DEFAULT nextval('order_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY price_based_shipping_rates ALTER COLUMN id SET DEFAULT nextval('price_based_shipping_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_options ALTER COLUMN id SET DEFAULT nextval('product_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_variants ALTER COLUMN id SET DEFAULT nextval('product_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shippings ALTER COLUMN id SET DEFAULT nextval('shippings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_domains ALTER COLUMN id SET DEFAULT nextval('shop_domains_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_policies ALTER COLUMN id SET DEFAULT nextval('shop_policies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_product_types ALTER COLUMN id SET DEFAULT nextval('shop_product_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_product_vendors ALTER COLUMN id SET DEFAULT nextval('shop_product_vendors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_tasks ALTER COLUMN id SET DEFAULT nextval('shop_tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_theme_settings ALTER COLUMN id SET DEFAULT nextval('shop_theme_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shop_themes ALTER COLUMN id SET DEFAULT nextval('shop_themes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY smart_collection_products ALTER COLUMN id SET DEFAULT nextval('smart_collection_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY smart_collection_rules ALTER COLUMN id SET DEFAULT nextval('smart_collection_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY smart_collections ALTER COLUMN id SET DEFAULT nextval('smart_collections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscribes ALTER COLUMN id SET DEFAULT nextval('subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY themes ALTER COLUMN id SET DEFAULT nextval('themes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY translations ALTER COLUMN id SET DEFAULT nextval('translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY webhooks ALTER COLUMN id SET DEFAULT nextval('webhooks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY weight_based_shipping_rates ALTER COLUMN id SET DEFAULT nextval('weight_based_shipping_rates_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY active_admin_comments (id, resource_id, resource_type, author_type, author_id, namespace, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activities (id, operate, content, user_id, shop_id, class_name, created_at, updated_at) FROM stdin;
1	new	<a href='/admin/custom_collections/1'>首页商品</a>	\N	1	custom_collection	2014-03-12 14:03:40.668095	2014-03-12 14:03:40.668095
2	new	<a href='/admin/blogs/1'>最新动态</a>	\N	1	blog	2014-03-12 14:03:40.92104	2014-03-12 14:03:40.92104
3	new	<a href='/admin/custom_collections/2'>首页商品</a>	\N	2	custom_collection	2014-03-12 14:03:41.557087	2014-03-12 14:03:41.557087
4	new	<a href='/admin/blogs/2'>最新动态</a>	\N	2	blog	2014-03-12 14:03:41.612041	2014-03-12 14:03:41.612041
5	new	<a href='/admin/custom_collections/3'>首页商品</a>	\N	3	custom_collection	2014-03-12 14:03:42.037978	2014-03-12 14:03:42.037978
6	new	<a href='/admin/blogs/3'>最新动态</a>	\N	3	blog	2014-03-12 14:03:42.101149	2014-03-12 14:03:42.101149
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin_users (id, email, encrypted_password, reset_password_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, reset_password_sent_at) FROM stdin;
1	admin@lvh.me	$2a$10$nkX8VIZskrniGDLeJEjbdOQ2Q0Rn4SZKDycD6ys7oV9BtXYkLFJ8m	\N	\N	0	\N	\N	\N	\N	2014-03-12 14:03:38.733594	2014-03-12 14:03:38.733594	\N
\.


--
-- Data for Name: api_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY api_clients (id, shop_id, api_key, password, shared_secret, title, created_at, updated_at) FROM stdin;
1	2	api_key	password	shared_secret	tool - 1	2014-03-12 14:03:44.157718	2014-03-12 14:03:44.157718
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY articles (id, shop_id, blog_id, title, body_html, published, user_id, author, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: articles_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY articles_tags (article_id, tag_id) FROM stdin;
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blogs (id, shop_id, title, commentable, handle, created_at, updated_at) FROM stdin;
1	1	最新动态	no	news	2014-03-12 14:03:40.916562	2014-03-12 14:03:40.916562
2	2	最新动态	no	news	2014-03-12 14:03:41.608621	2014-03-12 14:03:41.608621
3	3	最新动态	no	news	2014-03-12 14:03:42.097589	2014-03-12 14:03:42.097589
\.


--
-- Data for Name: cancel_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cancel_reasons (id, selection, detailed, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carts (id, shop_id, token, session_id, cart_hash, customer_id, created_at, updated_at, note) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments (id, article_id, shop_id, status, author, email, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: consumptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY consumptions (id, token, shop_id, quantity, price, status, plan_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: custom_collection_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY custom_collection_products (id, custom_collection_id, product_id, "position", created_at, updated_at) FROM stdin;
1	2	1	1	2014-03-12 14:03:42.629111	2014-03-12 14:03:42.629111
2	2	2	1	2014-03-12 14:03:43.432494	2014-03-12 14:03:43.432494
3	2	3	1	2014-03-12 14:03:43.522004	2014-03-12 14:03:43.522004
4	2	4	1	2014-03-12 14:03:43.588771	2014-03-12 14:03:43.588771
5	2	5	1	2014-03-12 14:03:43.747221	2014-03-12 14:03:43.747221
6	2	6	1	2014-03-12 14:03:43.814391	2014-03-12 14:03:43.814391
\.


--
-- Data for Name: custom_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY custom_collections (id, shop_id, title, published, handle, body_html, products_order, created_at, updated_at) FROM stdin;
1	1	首页商品	t	frontpage	\N	title.asc	2014-03-12 14:03:40.647984	2014-03-12 14:03:40.647984
2	2	首页商品	t	frontpage	\N	title.asc	2014-03-12 14:03:41.552719	2014-03-12 14:03:41.552719
3	3	首页商品	t	frontpage	\N	title.asc	2014-03-12 14:03:42.034315	2014-03-12 14:03:42.034315
\.


--
-- Data for Name: customer_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_addresses (id, customer_id, name, company, province, city, district, address1, address2, zip, phone, default_address) FROM stdin;
1	1	李卫辉	\N	440000	440300	440305	科技园南区311	\N	517058	13751042627	f
2	2	马海波	\N	440000	440300	440305	科技园南区311	\N	517058	13928452888	f
\.


--
-- Data for Name: customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_groups (id, shop_id, name, term, query, created_at, updated_at) FROM stdin;
1	2	接收营销邮件		accepts_marketing:yes:接收营销邮件:是	2014-03-12 14:03:44.10593	2014-03-12 14:03:44.10593
2	2	潜在顾客		last_abandoned_order_date:last_month:放弃订单时间:在最近一个月	2014-03-12 14:03:44.114979	2014-03-12 14:03:44.114979
3	2	多次消费		orders_count_gt:1:订单数 大于:1	2014-03-12 14:03:44.122738	2014-03-12 14:03:44.122738
\.


--
-- Data for Name: customer_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_tags (id, shop_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customer_tags_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_tags_customers (customer_id, customer_tag_id) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customers (id, shop_id, status, name, note, total_spent, orders_count, accepts_marketing, email, encrypted_password, reset_password_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, authentication_token, created_at, updated_at, reset_password_sent_at) FROM stdin;
1	2	enabled	李卫辉	默认顾客	0	0	t	liwh87@gmail.com	$2a$10$1hke4rj7WV4VGwaYxLaYYO4dmc1UtcfdQA6dM.zSOZc2Fiz1u7Sg6	\N	\N	0	\N	\N	\N	\N	9qayq2iyMYDfxsZsLNai	2014-03-12 14:03:43.967104	2014-03-12 14:03:43.967104	\N
2	2	enabled	马海波	默认顾客	0	0	t	mahb45@gmail.com	$2a$10$og3T1kS..q6cA4qTEO1fF.e2nSVpaC0FkPjqmUcGFlE2gFvlYfhUi	\N	\N	0	\N	\N	\N	\N	N1kx8TAVSYgcAWQY3Ehg	2014-03-12 14:03:44.073958	2014-03-12 14:03:44.073958	\N
\.


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY discounts (id, shop_id, code, discount_type, value, used_times, usage_limit) FROM stdin;
\.


--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY emails (id, shop_id, title, mail_type, body, include_html, body_html, created_at, updated_at) FROM stdin;
1	1	You{{shop_name}}Orders under a single success\n	order_confirm	Dear{{customer.name}}： \n\n   Hello,Congratulations, you've{{shop_name}}Order product success!\n\n   Order Number：{{order_number}}。{% if requires_shipping %} \n\n   Consignee information： {{ shipping_address.name}}： \n              {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} {{ shipping_address.phone}} {% endif %}\n\n   Order Product Details： {% for line in line_items %} \n              {{ line.quantity }} x {{ line.title }}  Unit price： {{ line.price | money }} {% endfor %}\n   Total order： {{ total_price | money_with_currency }}  | Total merchandise： {{ subtotal_price | money_with_currency }} {% if requires_shipping %} | Way of delivery and the amount of： {{ shipping_name }} - {{ shipping_rate_price | money_with_currency }} {% endif %}\n   {% unless total_price == 0 %}\n   Payment： {{ gateway }}   \n   \n   If you have not paid，Please pay as soon as possible。You can be the link address(Copy into your browser address bar) to return order payment page：\n   {{ pay_url }} {% endunless %}\n\n Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.010007	2014-03-12 14:03:41.010007
2	1	[{{shop_name}}] Orders {{ name }} , {{ customer.name }}Single\n	new_order_notify	{{ shop_name }},\n\nToday({{ date | date: "%Y-%m-%d %H:%M" }}), {{ customer.name }} New orders.\n\nPayment:\n  {{ gateway }}{% if requires_shipping %}\n\nDelivery:\n  {{ shipping_method.title }}\n  \nConsignee information:\n  {{ shipping_address.name }}\n  {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} , {{ shipping_address.zip }}\n  {{ shipping_address.phone }}{% endif %}\n\n\n{% for line in line_items %}{{ line.quantity }} x {{line.title }}\t\t(sku: {{ line.sku }})\n{% endfor %}\n	f	\N	2014-03-12 14:03:41.017236	2014-03-12 14:03:41.017236
3	1	Orders {{ name }} Complete payment\n	order_paid	Dear{{customer.name}}：\n\n   Hello，We have received your through {{ gateway }} Payments {{ transaction.amount | money_with_currency }}。\n\n   Order Number：{{name}}。\n\nWelcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.110748	2014-03-12 14:03:41.110748
4	1	[{{shop_name}}] Orders {{ name }} , {{ customer.name }}Complete payment\n	order_paid_notify	{{ shop_name }},\n\nToday({{ date | date: "%Y-%m-%d %H:%M" }}), {{ customer.name }} By {{ gateway }} Successful payments {{ transaction.amount | money_with_currency }}。\n	f	\N	2014-03-12 14:03:41.117985	2014-03-12 14:03:41.117985
5	1	Orders {{ name }} Ship to remind\n	ship_confirm	Dear{{ shipping_address.name }},\n\n   Your ordered products Has shipped:\n\n   {% for line in fulfillment.line_items %}{{ line.quantity }} x {{ line.title }}\n   {% endfor %}\n\n{% if requires_shipping %} By {% if fulfillment.tracking_company %} {{ fulfillment.tracking_company }} {% endif %}Sent to the following address:\n  Consignee information: {{shipping_address.name}}:\n  {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} {{ shipping_address.phone}}\n\n  {% if fulfillment.tracking_number %}\n Waybill number is： {{ fulfillment.tracking_number }}. 您可以通过下面的地址，Check the status of your cargo transport :\n\n{{ fulfillment.tracking_url }}\n\n{% endif %}{% endif %}\n\n  Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.123942	2014-03-12 14:03:41.123942
6	1	Orders {{ name }} Shipping Method Change Alarm\n	ship_update	Dear{{ shipping_address.name }},\n\n  Your order number is{{ name }}Changing the delivery of information goods：\n\n{% for line in fulfillment.line_items %}{{ line.quantity }} x {{ line.title }}\n{% endfor %}\n\n They will pass{% if fulfillment.tracking_company %} {{ fulfillment.tracking_company }}{% endif %} Transport，Waybill number is {{ fulfillment.tracking_number }}. 您可以通过下面链接查询：\n\n  {{ fulfillment.tracking_url }}\n\n Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.129876	2014-03-12 14:03:41.129876
7	1	Orders {{ name }} Cancel reminder\n	order_cancelled	Dear{{ customer.name }},\n\n  Your order{{ name }}Canceled！The reason is canceled:{{ cancel_reason }} 。{% unless cancel_reason == 'Did not make timely payments'%} If you have already paid，We will return the money to you！ {% endunless %}\n\n  If，Do you have any questions，You can reply to this message！\n  \n  Welcome to the re-{{ shop_name }}Shopping，I wish you a happy shopping！\n\n	f	\N	2014-03-12 14:03:41.135639	2014-03-12 14:03:41.135639
8	2	You{{shop_name}}Orders under a single success\n	order_confirm	Dear{{customer.name}}： \n\n   Hello,Congratulations, you've{{shop_name}}Order product success!\n\n   Order Number：{{order_number}}。{% if requires_shipping %} \n\n   Consignee information： {{ shipping_address.name}}： \n              {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} {{ shipping_address.phone}} {% endif %}\n\n   Order Product Details： {% for line in line_items %} \n              {{ line.quantity }} x {{ line.title }}  Unit price： {{ line.price | money }} {% endfor %}\n   Total order： {{ total_price | money_with_currency }}  | Total merchandise： {{ subtotal_price | money_with_currency }} {% if requires_shipping %} | Way of delivery and the amount of： {{ shipping_name }} - {{ shipping_rate_price | money_with_currency }} {% endif %}\n   {% unless total_price == 0 %}\n   Payment： {{ gateway }}   \n   \n   If you have not paid，Please pay as soon as possible。You can be the link address(Copy into your browser address bar) to return order payment page：\n   {{ pay_url }} {% endunless %}\n\n Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.637144	2014-03-12 14:03:41.637144
9	2	[{{shop_name}}] Orders {{ name }} , {{ customer.name }}Single\n	new_order_notify	{{ shop_name }},\n\nToday({{ date | date: "%Y-%m-%d %H:%M" }}), {{ customer.name }} New orders.\n\nPayment:\n  {{ gateway }}{% if requires_shipping %}\n\nDelivery:\n  {{ shipping_method.title }}\n  \nConsignee information:\n  {{ shipping_address.name }}\n  {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} , {{ shipping_address.zip }}\n  {{ shipping_address.phone }}{% endif %}\n\n\n{% for line in line_items %}{{ line.quantity }} x {{line.title }}\t\t(sku: {{ line.sku }})\n{% endfor %}\n	f	\N	2014-03-12 14:03:41.639435	2014-03-12 14:03:41.639435
10	2	Orders {{ name }} Complete payment\n	order_paid	Dear{{customer.name}}：\n\n   Hello，We have received your through {{ gateway }} Payments {{ transaction.amount | money_with_currency }}。\n\n   Order Number：{{name}}。\n\nWelcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.641485	2014-03-12 14:03:41.641485
11	2	[{{shop_name}}] Orders {{ name }} , {{ customer.name }}Complete payment\n	order_paid_notify	{{ shop_name }},\n\nToday({{ date | date: "%Y-%m-%d %H:%M" }}), {{ customer.name }} By {{ gateway }} Successful payments {{ transaction.amount | money_with_currency }}。\n	f	\N	2014-03-12 14:03:41.64365	2014-03-12 14:03:41.64365
12	2	Orders {{ name }} Ship to remind\n	ship_confirm	Dear{{ shipping_address.name }},\n\n   Your ordered products Has shipped:\n\n   {% for line in fulfillment.line_items %}{{ line.quantity }} x {{ line.title }}\n   {% endfor %}\n\n{% if requires_shipping %} By {% if fulfillment.tracking_company %} {{ fulfillment.tracking_company }} {% endif %}Sent to the following address:\n  Consignee information: {{shipping_address.name}}:\n  {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} {{ shipping_address.phone}}\n\n  {% if fulfillment.tracking_number %}\n Waybill number is： {{ fulfillment.tracking_number }}. 您可以通过下面的地址，Check the status of your cargo transport :\n\n{{ fulfillment.tracking_url }}\n\n{% endif %}{% endif %}\n\n  Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.645676	2014-03-12 14:03:41.645676
13	2	Orders {{ name }} Shipping Method Change Alarm\n	ship_update	Dear{{ shipping_address.name }},\n\n  Your order number is{{ name }}Changing the delivery of information goods：\n\n{% for line in fulfillment.line_items %}{{ line.quantity }} x {{ line.title }}\n{% endfor %}\n\n They will pass{% if fulfillment.tracking_company %} {{ fulfillment.tracking_company }}{% endif %} Transport，Waybill number is {{ fulfillment.tracking_number }}. 您可以通过下面链接查询：\n\n  {{ fulfillment.tracking_url }}\n\n Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:41.648052	2014-03-12 14:03:41.648052
14	2	Orders {{ name }} Cancel reminder\n	order_cancelled	Dear{{ customer.name }},\n\n  Your order{{ name }}Canceled！The reason is canceled:{{ cancel_reason }} 。{% unless cancel_reason == 'Did not make timely payments'%} If you have already paid，We will return the money to you！ {% endunless %}\n\n  If，Do you have any questions，You can reply to this message！\n  \n  Welcome to the re-{{ shop_name }}Shopping，I wish you a happy shopping！\n\n	f	\N	2014-03-12 14:03:41.650083	2014-03-12 14:03:41.650083
15	3	You{{shop_name}}Orders under a single success\n	order_confirm	Dear{{customer.name}}： \n\n   Hello,Congratulations, you've{{shop_name}}Order product success!\n\n   Order Number：{{order_number}}。{% if requires_shipping %} \n\n   Consignee information： {{ shipping_address.name}}： \n              {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} {{ shipping_address.phone}} {% endif %}\n\n   Order Product Details： {% for line in line_items %} \n              {{ line.quantity }} x {{ line.title }}  Unit price： {{ line.price | money }} {% endfor %}\n   Total order： {{ total_price | money_with_currency }}  | Total merchandise： {{ subtotal_price | money_with_currency }} {% if requires_shipping %} | Way of delivery and the amount of： {{ shipping_name }} - {{ shipping_rate_price | money_with_currency }} {% endif %}\n   {% unless total_price == 0 %}\n   Payment： {{ gateway }}   \n   \n   If you have not paid，Please pay as soon as possible。You can be the link address(Copy into your browser address bar) to return order payment page：\n   {{ pay_url }} {% endunless %}\n\n Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:42.127512	2014-03-12 14:03:42.127512
16	3	[{{shop_name}}] Orders {{ name }} , {{ customer.name }}Single\n	new_order_notify	{{ shop_name }},\n\nToday({{ date | date: "%Y-%m-%d %H:%M" }}), {{ customer.name }} New orders.\n\nPayment:\n  {{ gateway }}{% if requires_shipping %}\n\nDelivery:\n  {{ shipping_method.title }}\n  \nConsignee information:\n  {{ shipping_address.name }}\n  {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} , {{ shipping_address.zip }}\n  {{ shipping_address.phone }}{% endif %}\n\n\n{% for line in line_items %}{{ line.quantity }} x {{line.title }}\t\t(sku: {{ line.sku }})\n{% endfor %}\n	f	\N	2014-03-12 14:03:42.129766	2014-03-12 14:03:42.129766
17	3	Orders {{ name }} Complete payment\n	order_paid	Dear{{customer.name}}：\n\n   Hello，We have received your through {{ gateway }} Payments {{ transaction.amount | money_with_currency }}。\n\n   Order Number：{{name}}。\n\nWelcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:42.13188	2014-03-12 14:03:42.13188
18	3	[{{shop_name}}] Orders {{ name }} , {{ customer.name }}Complete payment\n	order_paid_notify	{{ shop_name }},\n\nToday({{ date | date: "%Y-%m-%d %H:%M" }}), {{ customer.name }} By {{ gateway }} Successful payments {{ transaction.amount | money_with_currency }}。\n	f	\N	2014-03-12 14:03:42.133925	2014-03-12 14:03:42.133925
19	3	Orders {{ name }} Ship to remind\n	ship_confirm	Dear{{ shipping_address.name }},\n\n   Your ordered products Has shipped:\n\n   {% for line in fulfillment.line_items %}{{ line.quantity }} x {{ line.title }}\n   {% endfor %}\n\n{% if requires_shipping %} By {% if fulfillment.tracking_company %} {{ fulfillment.tracking_company }} {% endif %}Sent to the following address:\n  Consignee information: {{shipping_address.name}}:\n  {{ shipping_address.province}} {{ shipping_address.city}} {{ shipping_address.district}} {{ shipping_address.address1}} {{ shipping_address.phone}}\n\n  {% if fulfillment.tracking_number %}\n Waybill number is： {{ fulfillment.tracking_number }}. 您可以通过下面的地址，Check the status of your cargo transport :\n\n{{ fulfillment.tracking_url }}\n\n{% endif %}{% endif %}\n\n  Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:42.136261	2014-03-12 14:03:42.136261
20	3	Orders {{ name }} Shipping Method Change Alarm\n	ship_update	Dear{{ shipping_address.name }},\n\n  Your order number is{{ name }}Changing the delivery of information goods：\n\n{% for line in fulfillment.line_items %}{{ line.quantity }} x {{ line.title }}\n{% endfor %}\n\n They will pass{% if fulfillment.tracking_company %} {{ fulfillment.tracking_company }}{% endif %} Transport，Waybill number is {{ fulfillment.tracking_number }}. 您可以通过下面链接查询：\n\n  {{ fulfillment.tracking_url }}\n\n Welcome to the re-{{shop_name}}Shopping，I wish you a happy shopping！\n	f	\N	2014-03-12 14:03:42.138798	2014-03-12 14:03:42.138798
21	3	Orders {{ name }} Cancel reminder\n	order_cancelled	Dear{{ customer.name }},\n\n  Your order{{ name }}Canceled！The reason is canceled:{{ cancel_reason }} 。{% unless cancel_reason == 'Did not make timely payments'%} If you have already paid，We will return the money to you！ {% endunless %}\n\n  If，Do you have any questions，You can reply to this message！\n  \n  Welcome to the re-{{ shop_name }}Shopping，I wish you a happy shopping！\n\n	f	\N	2014-03-12 14:03:42.14133	2014-03-12 14:03:42.14133
\.


--
-- Data for Name: kindeditors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kindeditors (id, shop_id, kindeditor_image_uid, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: link_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY link_lists (id, shop_id, title, handle, system_default, created_at, updated_at) FROM stdin;
1	1	主菜单	main-menu	t	2014-03-12 14:03:40.761182	2014-03-12 14:03:40.761182
2	1	页脚	footer	t	2014-03-12 14:03:40.889864	2014-03-12 14:03:40.889864
3	2	主菜单	main-menu	t	2014-03-12 14:03:41.580201	2014-03-12 14:03:41.580201
4	2	页脚	footer	t	2014-03-12 14:03:41.595911	2014-03-12 14:03:41.595911
5	3	主菜单	main-menu	t	2014-03-12 14:03:42.064329	2014-03-12 14:03:42.064329
6	3	页脚	footer	t	2014-03-12 14:03:42.083465	2014-03-12 14:03:42.083465
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY links (id, link_list_id, title, link_type, subject_handle, subject_params, url, "position", created_at, updated_at) FROM stdin;
1	1	首页	frontpage	\N	\N	/	1	2014-03-12 14:03:40.87603	2014-03-12 14:03:40.87603
2	1	商品列表	http	\N	\N	/collections/all	2	2014-03-12 14:03:40.880503	2014-03-12 14:03:40.880503
3	1	关于我们	page	about-us	\N	/pages/about-us	3	2014-03-12 14:03:40.883548	2014-03-12 14:03:40.883548
4	2	查询	search	\N	\N	/search	1	2014-03-12 14:03:40.893506	2014-03-12 14:03:40.893506
5	2	关于我们	page	about-us	\N	/pages/about-us	2	2014-03-12 14:03:40.89655	2014-03-12 14:03:40.89655
6	3	首页	frontpage	\N	\N	/	1	2014-03-12 14:03:41.583852	2014-03-12 14:03:41.583852
7	3	商品列表	http	\N	\N	/collections/all	2	2014-03-12 14:03:41.586795	2014-03-12 14:03:41.586795
8	3	关于我们	page	about-us	\N	/pages/about-us	3	2014-03-12 14:03:41.589598	2014-03-12 14:03:41.589598
9	4	查询	search	\N	\N	/search	1	2014-03-12 14:03:41.599403	2014-03-12 14:03:41.599403
10	4	关于我们	page	about-us	\N	/pages/about-us	2	2014-03-12 14:03:41.602288	2014-03-12 14:03:41.602288
11	5	首页	frontpage	\N	\N	/	1	2014-03-12 14:03:42.06902	2014-03-12 14:03:42.06902
12	5	商品列表	http	\N	\N	/collections/all	2	2014-03-12 14:03:42.072525	2014-03-12 14:03:42.072525
13	5	关于我们	page	about-us	\N	/pages/about-us	3	2014-03-12 14:03:42.076138	2014-03-12 14:03:42.076138
14	6	查询	search	\N	\N	/search	1	2014-03-12 14:03:42.087905	2014-03-12 14:03:42.087905
15	6	关于我们	page	about-us	\N	/pages/about-us	2	2014-03-12 14:03:42.091546	2014-03-12 14:03:42.091546
\.


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes) FROM stdin;
1	1	1	01c60e68f5fa1637a9201af37015624a39ff7846d6881a436c793e089a9df21d	\N	\N	\N	2014-03-12 14:03:41.166494	write_themes
2	2	1	cea8866b492e96338a0977c777a82b6ad92656cabd161a9eb03d5de3dbd75cde	\N	\N	\N	2014-03-12 14:03:41.655158	write_themes
3	3	1	f9a3c407307b5cbe14cfaff3937a6bbc10e9aabcd547e0310d638d7b1e1511fc	\N	\N	\N	2014-03-12 14:03:42.147321	write_themes
\.


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth_applications (id, name, uid, secret, redirect_uri, created_at, updated_at) FROM stdin;
1	themes	3342030c83841d5a7b002d73496c82b820cfa14bc95c67eb2dc1355a85d5873c	3101994a05843c0a143692a75c99becb981325dc622b94b290f9d01f77beb9e3	http://themes.importgenius.in:4000/callback	2014-03-12 14:02:35.652621	2014-03-12 14:02:35.652621
\.


--
-- Data for Name: order_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_discounts (id, order_id, code, amount) FROM stdin;
\.


--
-- Data for Name: order_fulfillments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_fulfillments (id, order_id, tracking_number, tracking_company, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_fulfillments_order_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_fulfillments_order_line_items (order_fulfillment_id, order_line_item_id) FROM stdin;
\.


--
-- Data for Name: order_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_histories (id, order_id, body, url, created_at) FROM stdin;
\.


--
-- Data for Name: order_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_line_items (id, order_id, product_variant_id, price, quantity, fulfilled, product_id, title, variant_title, name, vendor, requires_shipping, grams, sku) FROM stdin;
\.


--
-- Data for Name: order_shipping_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_shipping_addresses (id, order_id, name, company, province, city, district, address1, address2, zip, phone) FROM stdin;
\.


--
-- Data for Name: order_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_transactions (id, order_id, kind, amount, created_at, status, batch_no) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (id, shop_id, customer_id, token, name, number, order_number, status, financial_status, fulfillment_status, email, shipping_rate, payment_id, total_line_items_price, total_price, note, closed_at, cancel_reason, cancelled_at, created_at, updated_at, subtotal_price, trade_no) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pages (id, shop_id, title, published, handle, body_html, created_at, updated_at) FROM stdin;
1	1	欢迎	t	frontpage	\n<p><strong>恭喜！您已成功发布网上商店！</strong></p\n\n<p>这是您的网店首页，当您的顾客进入网店时将看到这里的内容。您可以重新修改此内容。</p>\n\n<p>请您进入<a href="/admin">后台管理</a>，开始为您的网店新增商品。</p>\n\n<p>ShopQi团队。</p>\n    	2014-03-12 14:03:40.707084	2014-03-12 14:03:40.707084
2	1	关于我们	t	about-us	\n<p>商店的<strong>关于我们</strong>页面是非常重要的，因此顾客将通过访问此页面来了解您的商店。此页面的内容可以包括以下部分：</p>\n<ul>\n<li>介绍您的公司</li>\n<li>商店主要销售商品类型</li>\n<li>公司地址</li>\n</ul>\n<p>请进入后台管理的<a href="/admin/pages">页面&博客</a>，修改此页面内容。</p>\n    	2014-03-12 14:03:40.724955	2014-03-12 14:03:40.724955
3	2	欢迎	t	frontpage	\n<p><strong>恭喜！您已成功发布网上商店！</strong></p\n\n<p>这是您的网店首页，当您的顾客进入网店时将看到这里的内容。您可以重新修改此内容。</p>\n\n<p>请您进入<a href="/admin">后台管理</a>，开始为您的网店新增商品。</p>\n\n<p>ShopQi团队。</p>\n    	2014-03-12 14:03:41.564552	2014-03-12 14:03:41.564552
4	2	关于我们	t	about-us	\n<p>商店的<strong>关于我们</strong>页面是非常重要的，因此顾客将通过访问此页面来了解您的商店。此页面的内容可以包括以下部分：</p>\n<ul>\n<li>介绍您的公司</li>\n<li>商店主要销售商品类型</li>\n<li>公司地址</li>\n</ul>\n<p>请进入后台管理的<a href="/admin/pages">页面&博客</a>，修改此页面内容。</p>\n    	2014-03-12 14:03:41.572396	2014-03-12 14:03:41.572396
5	3	欢迎	t	frontpage	\n<p><strong>恭喜！您已成功发布网上商店！</strong></p\n\n<p>这是您的网店首页，当您的顾客进入网店时将看到这里的内容。您可以重新修改此内容。</p>\n\n<p>请您进入<a href="/admin">后台管理</a>，开始为您的网店新增商品。</p>\n\n<p>ShopQi团队。</p>\n    	2014-03-12 14:03:42.045752	2014-03-12 14:03:42.045752
6	3	关于我们	t	about-us	\n<p>商店的<strong>关于我们</strong>页面是非常重要的，因此顾客将通过访问此页面来了解您的商店。此页面的内容可以包括以下部分：</p>\n<ul>\n<li>介绍您的公司</li>\n<li>商店主要销售商品类型</li>\n<li>公司地址</li>\n</ul>\n<p>请进入后台管理的<a href="/admin/pages">页面&博客</a>，修改此页面内容。</p>\n    	2014-03-12 14:03:42.054641	2014-03-12 14:03:42.054641
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payments (id, shop_id, email, payment_type_id, key, account, message, name, created_at, updated_at, service) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permissions (id, user_id, resource_id) FROM stdin;
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photos (id, product_id, product_image_uid, product_image_format, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: price_based_shipping_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY price_based_shipping_rates (id, price, min_order_subtotal, max_order_subtotal, name, created_at, updated_at, shipping_id) FROM stdin;
\.


--
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_options (id, product_id, name, "position") FROM stdin;
1	1	Title	1
2	2	Title	1
3	3	Title	1
4	4	Title	1
5	5	Title	1
6	6	Title	1
\.


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_variants (id, shop_id, product_id, price, weight, compare_at_price, option1, option2, option3, sku, requires_shipping, inventory_quantity, inventory_management, inventory_policy, created_at, updated_at, "position") FROM stdin;
1	2	1	0	0	\N	DefaultTitle	\N	\N	\N	t	\N	\N	deny	2014-03-12 14:03:42.280005	2014-03-12 14:03:42.280005	1
2	2	2	0	0	\N	DefaultTitle	\N	\N	\N	t	\N	\N	deny	2014-03-12 14:03:43.355324	2014-03-12 14:03:43.355324	1
3	2	3	0	0	\N	DefaultTitle	\N	\N	\N	t	\N	\N	deny	2014-03-12 14:03:43.482658	2014-03-12 14:03:43.482658	1
4	2	4	0	0	\N	DefaultTitle	\N	\N	\N	t	\N	\N	deny	2014-03-12 14:03:43.548961	2014-03-12 14:03:43.548961	1
5	2	5	0	0	\N	DefaultTitle	\N	\N	\N	t	\N	\N	deny	2014-03-12 14:03:43.709825	2014-03-12 14:03:43.709825	1
6	2	6	0	0	\N	DefaultTitle	\N	\N	\N	t	\N	\N	deny	2014-03-12 14:03:43.774287	2014-03-12 14:03:43.774287	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products (id, shop_id, handle, title, published, body_html, price, product_type, vendor, created_at, updated_at) FROM stdin;
1	2	example-1	示例商品1	t	\n<p>这是一个商品.</p>\n<p>您在这里看到的文字是商品的描述。每个商品都有价格、重量、照片和说明。您可以打开后台管理的<a href="/admin/products">商品标签页面</a>修改商品说明或者新增一个商品。</p>\n<p>当您已经掌握商品的新增和修改，您会希望商品显示在您的ShopQi网站上。只需要完成以下两个步骤：</p>\n<p>首先，您需要将您的商品添加到集合中。集合是把商品组织在一起的简单方法。如果您打开后台管理的<a href="/admin/custom_collections">集合标签页面</a>，您就可以开始新增集合，并把商品添加进去。</p>\n<p>然后，您需要为商店的导航菜单新增一个链接，指向您的集合。您可以打开后台管理的<a href="/admin/link_lists">链接标签</a>，并点击“新增链接”。</p>\n<p>一切顺利!</p>\n	0	手机	ShopQi	2014-03-12 14:03:42.27179	2014-03-12 14:03:42.291409
2	2	example-2	示例商品2	t	\n<p>这是一个商品.</p>\n<p>您在这里看到的文字是商品的描述。每个商品都有价格、重量、照片和说明。您可以打开后台管理的<a href="/admin/products">商品标签页面</a>修改商品说明或者新增一个商品。</p>\n<p>当您已经掌握商品的新增和修改，您会希望商品显示在您的ShopQi网站上。只需要完成以下两个步骤：</p>\n<p>首先，您需要将您的商品添加到集合中。集合是把商品组织在一起的简单方法。如果您打开后台管理的<a href="/admin/custom_collections">集合标签页面</a>，您就可以开始新增集合，并把商品添加进去。</p>\n<p>然后，您需要为商店的导航菜单新增一个链接，指向您的集合。您可以打开后台管理的<a href="/admin/link_lists">链接标签</a>，并点击“新增链接”。</p>\n<p>一切顺利!</p>\n	0	手机	ShopQi	2014-03-12 14:03:43.346287	2014-03-12 14:03:43.36975
3	2	example-3	示例商品3	t	\n<p>这是一个商品.</p>\n<p>您在这里看到的文字是商品的描述。每个商品都有价格、重量、照片和说明。您可以打开后台管理的<a href="/admin/products">商品标签页面</a>修改商品说明或者新增一个商品。</p>\n<p>当您已经掌握商品的新增和修改，您会希望商品显示在您的ShopQi网站上。只需要完成以下两个步骤：</p>\n<p>首先，您需要将您的商品添加到集合中。集合是把商品组织在一起的简单方法。如果您打开后台管理的<a href="/admin/custom_collections">集合标签页面</a>，您就可以开始新增集合，并把商品添加进去。</p>\n<p>然后，您需要为商店的导航菜单新增一个链接，指向您的集合。您可以打开后台管理的<a href="/admin/link_lists">链接标签</a>，并点击“新增链接”。</p>\n<p>一切顺利!</p>\n	0	手机	ShopQi	2014-03-12 14:03:43.476956	2014-03-12 14:03:43.490065
4	2	example-4	示例商品4	t	\n<p>这是一个商品.</p>\n<p>您在这里看到的文字是商品的描述。每个商品都有价格、重量、照片和说明。您可以打开后台管理的<a href="/admin/products">商品标签页面</a>修改商品说明或者新增一个商品。</p>\n<p>当您已经掌握商品的新增和修改，您会希望商品显示在您的ShopQi网站上。只需要完成以下两个步骤：</p>\n<p>首先，您需要将您的商品添加到集合中。集合是把商品组织在一起的简单方法。如果您打开后台管理的<a href="/admin/custom_collections">集合标签页面</a>，您就可以开始新增集合，并把商品添加进去。</p>\n<p>然后，您需要为商店的导航菜单新增一个链接，指向您的集合。您可以打开后台管理的<a href="/admin/link_lists">链接标签</a>，并点击“新增链接”。</p>\n<p>一切顺利!</p>\n	0	手机	ShopQi	2014-03-12 14:03:43.544435	2014-03-12 14:03:43.556272
5	2	example-5	示例商品5	t	\n<p>这是一个商品.</p>\n<p>您在这里看到的文字是商品的描述。每个商品都有价格、重量、照片和说明。您可以打开后台管理的<a href="/admin/products">商品标签页面</a>修改商品说明或者新增一个商品。</p>\n<p>当您已经掌握商品的新增和修改，您会希望商品显示在您的ShopQi网站上。只需要完成以下两个步骤：</p>\n<p>首先，您需要将您的商品添加到集合中。集合是把商品组织在一起的简单方法。如果您打开后台管理的<a href="/admin/custom_collections">集合标签页面</a>，您就可以开始新增集合，并把商品添加进去。</p>\n<p>然后，您需要为商店的导航菜单新增一个链接，指向您的集合。您可以打开后台管理的<a href="/admin/link_lists">链接标签</a>，并点击“新增链接”。</p>\n<p>一切顺利!</p>\n	0	手机	ShopQi	2014-03-12 14:03:43.703608	2014-03-12 14:03:43.719544
6	2	example-6	示例商品6	t	\n<p>这是一个商品.</p>\n<p>您在这里看到的文字是商品的描述。每个商品都有价格、重量、照片和说明。您可以打开后台管理的<a href="/admin/products">商品标签页面</a>修改商品说明或者新增一个商品。</p>\n<p>当您已经掌握商品的新增和修改，您会希望商品显示在您的ShopQi网站上。只需要完成以下两个步骤：</p>\n<p>首先，您需要将您的商品添加到集合中。集合是把商品组织在一起的简单方法。如果您打开后台管理的<a href="/admin/custom_collections">集合标签页面</a>，您就可以开始新增集合，并把商品添加进去。</p>\n<p>然后，您需要为商店的导航菜单新增一个链接，指向您的集合。您可以打开后台管理的<a href="/admin/link_lists">链接标签</a>，并点击“新增链接”。</p>\n<p>一切顺利!</p>\n	0	手机	ShopQi	2014-03-12 14:03:43.769656	2014-03-12 14:03:43.781934
\.


--
-- Data for Name: products_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products_tags (product_id, tag_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20110419080009
20110420064741
20110422070212
20110422135410
20110423115935
20110425043757
20110426120958
20110505153806
20110511132245
20110511132306
20110605085310
20110609014732
20110609075449
20110622024506
20110623141854
20110717022034
20110722100518
20110728024129
20110804132348
20110926051845
20110926131916
20111001024945
20111019053647
20111123084300
20111125024512
20111125083249
20111208061314
20120103132045
20120113091629
20120206135658
20120219015553
20120303031526
20120405081909
20120414133405
20120521093256
20120524125233
20120530122404
20120707020959
20120729084444
20120729144327
20120810144404
20120815032021
20120913142858
20120920123359
20121016152948
\.


--
-- Data for Name: shippings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shippings (id, shop_id, code, created_at, updated_at) FROM stdin;
1	1	000000	2014-03-12 14:03:40.967733	2014-03-12 14:03:40.967733
2	2	000000	2014-03-12 14:03:41.632014	2014-03-12 14:03:41.632014
3	3	000000	2014-03-12 14:03:42.122382	2014-03-12 14:03:42.122382
\.


--
-- Data for Name: shop_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_domains (id, shop_id, subdomain, domain, host, "primary", force_domain, record, verified) FROM stdin;
1	1	shopqi	.importgenius.in	shopqi.importgenius.in	t	f	粤ICP备11089804号	t
2	2	myshopqi	.importgenius.in	myshopqi.importgenius.in	t	f	粤ICP备11089804号	t
3	3	myshopqi5	.importgenius.in	myshopqi5.importgenius.in	t	f	粤ICP备11089804号	t
\.


--
-- Data for Name: shop_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_policies (id, title, body, shop_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shop_product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_product_types (id, shop_id, name) FROM stdin;
1	2	手机
\.


--
-- Data for Name: shop_product_vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_product_vendors (id, shop_id, name) FROM stdin;
1	2	ShopQi
\.


--
-- Data for Name: shop_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_tasks (id, shop_id, name, completed, created_at, updated_at) FROM stdin;
1	1	add_product	f	2014-03-12 14:03:40.939857	2014-03-12 14:03:40.939857
2	1	customize_theme	f	2014-03-12 14:03:40.943209	2014-03-12 14:03:40.943209
3	1	add_content	f	2014-03-12 14:03:40.945049	2014-03-12 14:03:40.945049
4	1	setup_payment_gateway	f	2014-03-12 14:03:40.946907	2014-03-12 14:03:40.946907
5	1	setup_shipping	f	2014-03-12 14:03:40.948702	2014-03-12 14:03:40.948702
6	1	setup_domain	f	2014-03-12 14:03:40.950312	2014-03-12 14:03:40.950312
7	1	launch	f	2014-03-12 14:03:40.952064	2014-03-12 14:03:40.952064
8	2	add_product	f	2014-03-12 14:03:41.619081	2014-03-12 14:03:41.619081
9	2	customize_theme	f	2014-03-12 14:03:41.621195	2014-03-12 14:03:41.621195
10	2	add_content	f	2014-03-12 14:03:41.622937	2014-03-12 14:03:41.622937
11	2	setup_payment_gateway	f	2014-03-12 14:03:41.624568	2014-03-12 14:03:41.624568
12	2	setup_shipping	f	2014-03-12 14:03:41.626312	2014-03-12 14:03:41.626312
13	2	setup_domain	f	2014-03-12 14:03:41.627958	2014-03-12 14:03:41.627958
14	2	launch	f	2014-03-12 14:03:41.629556	2014-03-12 14:03:41.629556
15	3	add_product	f	2014-03-12 14:03:42.108458	2014-03-12 14:03:42.108458
16	3	customize_theme	f	2014-03-12 14:03:42.110394	2014-03-12 14:03:42.110394
17	3	add_content	f	2014-03-12 14:03:42.112286	2014-03-12 14:03:42.112286
18	3	setup_payment_gateway	f	2014-03-12 14:03:42.114165	2014-03-12 14:03:42.114165
19	3	setup_shipping	f	2014-03-12 14:03:42.116047	2014-03-12 14:03:42.116047
20	3	setup_domain	f	2014-03-12 14:03:42.117868	2014-03-12 14:03:42.117868
21	3	launch	f	2014-03-12 14:03:42.119748	2014-03-12 14:03:42.119748
\.


--
-- Data for Name: shop_theme_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_theme_settings (id, shop_theme_id, name, value, created_at, updated_at) FROM stdin;
1	1	regular_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:40.440558	2014-03-12 14:03:40.440558
2	1	use_logo_image	t	2014-03-12 14:03:40.444097	2014-03-12 14:03:40.444097
3	1	link_color	#69941e	2014-03-12 14:03:40.44668	2014-03-12 14:03:40.44668
4	1	rounded-corners	t	2014-03-12 14:03:40.449113	2014-03-12 14:03:40.449113
5	1	show_facebook	t	2014-03-12 14:03:40.451418	2014-03-12 14:03:40.451418
6	1	email_url	support@shopqi.com	2014-03-12 14:03:40.453744	2014-03-12 14:03:40.453744
7	1	button_color	#5f9819	2014-03-12 14:03:40.456024	2014-03-12 14:03:40.456024
8	1	nav_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:40.458404	2014-03-12 14:03:40.458404
9	1	use_banner_image	t	2014-03-12 14:03:40.460719	2014-03-12 14:03:40.460719
10	1	navigationhover_color	#cacaca	2014-03-12 14:03:40.463083	2014-03-12 14:03:40.463083
11	1	pagebackground_color	#ffffff	2014-03-12 14:03:40.465399	2014-03-12 14:03:40.465399
12	1	bg_image	bg-slate.jpg	2014-03-12 14:03:40.467702	2014-03-12 14:03:40.467702
13	1	show_phone	t	2014-03-12 14:03:40.470072	2014-03-12 14:03:40.470072
14	1	contentbackground_color	#ffffff	2014-03-12 14:03:40.472389	2014-03-12 14:03:40.472389
15	1	facebook_name	ShopQi	2014-03-12 14:03:40.474666	2014-03-12 14:03:40.474666
16	1	buttonhover_color	#39600c	2014-03-12 14:03:40.477108	2014-03-12 14:03:40.477108
17	1	buttontext_color	#fff	2014-03-12 14:03:40.479657	2014-03-12 14:03:40.479657
18	1	text_color	#333333	2014-03-12 14:03:40.481978	2014-03-12 14:03:40.481978
19	1	logo_color	#ffffff	2014-03-12 14:03:40.484311	2014-03-12 14:03:40.484311
20	1	heading_color	#676161	2014-03-12 14:03:40.486569	2014-03-12 14:03:40.486569
21	1	navigation_color	#ffffff	2014-03-12 14:03:40.488914	2014-03-12 14:03:40.488914
22	1	show_email	t	2014-03-12 14:03:40.491304	2014-03-12 14:03:40.491304
23	1	productborder	#f9f9f9	2014-03-12 14:03:40.493654	2014-03-12 14:03:40.493654
24	1	productborderhover	#e2e2e2	2014-03-12 14:03:40.495958	2014-03-12 14:03:40.495958
25	1	show_homepage	f	2014-03-12 14:03:40.498324	2014-03-12 14:03:40.498324
26	1	contentborder_border	#ffffff	2014-03-12 14:03:40.500704	2014-03-12 14:03:40.500704
27	1	banner_url	/collections/all	2014-03-12 14:03:40.50307	2014-03-12 14:03:40.50307
28	1	productbackground	#ffffff	2014-03-12 14:03:40.505414	2014-03-12 14:03:40.505414
29	1	logo_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:40.507739	2014-03-12 14:03:40.507739
30	1	linkhover_color	#5c850f	2014-03-12 14:03:40.510102	2014-03-12 14:03:40.510102
31	1	shadows	t	2014-03-12 14:03:40.512405	2014-03-12 14:03:40.512405
32	1	phone_url	400-123-4567	2014-03-12 14:03:40.514823	2014-03-12 14:03:40.514823
33	2	regular_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:41.467098	2014-03-12 14:03:41.467098
34	2	use_logo_image	t	2014-03-12 14:03:41.469666	2014-03-12 14:03:41.469666
35	2	link_color	#69941e	2014-03-12 14:03:41.472239	2014-03-12 14:03:41.472239
36	2	rounded-corners	t	2014-03-12 14:03:41.474782	2014-03-12 14:03:41.474782
37	2	show_facebook	t	2014-03-12 14:03:41.477326	2014-03-12 14:03:41.477326
38	2	email_url	support@shopqi.com	2014-03-12 14:03:41.479797	2014-03-12 14:03:41.479797
39	2	button_color	#5f9819	2014-03-12 14:03:41.482266	2014-03-12 14:03:41.482266
40	2	nav_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:41.484598	2014-03-12 14:03:41.484598
41	2	use_banner_image	t	2014-03-12 14:03:41.48702	2014-03-12 14:03:41.48702
42	2	navigationhover_color	#cacaca	2014-03-12 14:03:41.489351	2014-03-12 14:03:41.489351
43	2	pagebackground_color	#ffffff	2014-03-12 14:03:41.49183	2014-03-12 14:03:41.49183
44	2	bg_image	bg-slate.jpg	2014-03-12 14:03:41.49456	2014-03-12 14:03:41.49456
45	2	show_phone	t	2014-03-12 14:03:41.496964	2014-03-12 14:03:41.496964
46	2	contentbackground_color	#ffffff	2014-03-12 14:03:41.499365	2014-03-12 14:03:41.499365
47	2	facebook_name	ShopQi	2014-03-12 14:03:41.501685	2014-03-12 14:03:41.501685
48	2	buttonhover_color	#39600c	2014-03-12 14:03:41.504173	2014-03-12 14:03:41.504173
49	2	buttontext_color	#fff	2014-03-12 14:03:41.506465	2014-03-12 14:03:41.506465
50	2	text_color	#333333	2014-03-12 14:03:41.508815	2014-03-12 14:03:41.508815
51	2	logo_color	#ffffff	2014-03-12 14:03:41.511153	2014-03-12 14:03:41.511153
52	2	heading_color	#676161	2014-03-12 14:03:41.513572	2014-03-12 14:03:41.513572
53	2	navigation_color	#ffffff	2014-03-12 14:03:41.515893	2014-03-12 14:03:41.515893
54	2	show_email	t	2014-03-12 14:03:41.518245	2014-03-12 14:03:41.518245
55	2	productborder	#f9f9f9	2014-03-12 14:03:41.52062	2014-03-12 14:03:41.52062
56	2	productborderhover	#e2e2e2	2014-03-12 14:03:41.523015	2014-03-12 14:03:41.523015
57	2	show_homepage	f	2014-03-12 14:03:41.525372	2014-03-12 14:03:41.525372
58	2	contentborder_border	#ffffff	2014-03-12 14:03:41.527722	2014-03-12 14:03:41.527722
59	2	banner_url	/collections/all	2014-03-12 14:03:41.530159	2014-03-12 14:03:41.530159
60	2	productbackground	#ffffff	2014-03-12 14:03:41.532597	2014-03-12 14:03:41.532597
61	2	logo_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:41.535085	2014-03-12 14:03:41.535085
62	2	linkhover_color	#5c850f	2014-03-12 14:03:41.537581	2014-03-12 14:03:41.537581
63	2	shadows	t	2014-03-12 14:03:41.539939	2014-03-12 14:03:41.539939
64	2	phone_url	400-123-4567	2014-03-12 14:03:41.542279	2014-03-12 14:03:41.542279
65	3	regular_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:41.935313	2014-03-12 14:03:41.935313
66	3	use_logo_image	t	2014-03-12 14:03:41.938675	2014-03-12 14:03:41.938675
67	3	link_color	#69941e	2014-03-12 14:03:41.941902	2014-03-12 14:03:41.941902
68	3	rounded-corners	t	2014-03-12 14:03:41.945226	2014-03-12 14:03:41.945226
69	3	show_facebook	t	2014-03-12 14:03:41.9487	2014-03-12 14:03:41.9487
70	3	email_url	support@shopqi.com	2014-03-12 14:03:41.951994	2014-03-12 14:03:41.951994
71	3	button_color	#5f9819	2014-03-12 14:03:41.955262	2014-03-12 14:03:41.955262
72	3	nav_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:41.958485	2014-03-12 14:03:41.958485
73	3	use_banner_image	t	2014-03-12 14:03:41.961731	2014-03-12 14:03:41.961731
74	3	navigationhover_color	#cacaca	2014-03-12 14:03:41.964982	2014-03-12 14:03:41.964982
75	3	pagebackground_color	#ffffff	2014-03-12 14:03:41.968252	2014-03-12 14:03:41.968252
76	3	bg_image	bg-slate.jpg	2014-03-12 14:03:41.971457	2014-03-12 14:03:41.971457
77	3	show_phone	t	2014-03-12 14:03:41.974828	2014-03-12 14:03:41.974828
78	3	contentbackground_color	#ffffff	2014-03-12 14:03:41.978166	2014-03-12 14:03:41.978166
79	3	facebook_name	ShopQi	2014-03-12 14:03:41.980723	2014-03-12 14:03:41.980723
80	3	buttonhover_color	#39600c	2014-03-12 14:03:41.983248	2014-03-12 14:03:41.983248
81	3	buttontext_color	#fff	2014-03-12 14:03:41.985631	2014-03-12 14:03:41.985631
82	3	text_color	#333333	2014-03-12 14:03:41.988028	2014-03-12 14:03:41.988028
83	3	logo_color	#ffffff	2014-03-12 14:03:41.990399	2014-03-12 14:03:41.990399
84	3	heading_color	#676161	2014-03-12 14:03:41.992755	2014-03-12 14:03:41.992755
85	3	navigation_color	#ffffff	2014-03-12 14:03:41.995258	2014-03-12 14:03:41.995258
86	3	show_email	t	2014-03-12 14:03:41.997621	2014-03-12 14:03:41.997621
87	3	productborder	#f9f9f9	2014-03-12 14:03:42.000041	2014-03-12 14:03:42.000041
88	3	productborderhover	#e2e2e2	2014-03-12 14:03:42.002369	2014-03-12 14:03:42.002369
89	3	show_homepage	f	2014-03-12 14:03:42.005011	2014-03-12 14:03:42.005011
90	3	contentborder_border	#ffffff	2014-03-12 14:03:42.007634	2014-03-12 14:03:42.007634
91	3	banner_url	/collections/all	2014-03-12 14:03:42.010187	2014-03-12 14:03:42.010187
92	3	productbackground	#ffffff	2014-03-12 14:03:42.012848	2014-03-12 14:03:42.012848
93	3	logo_font	Helvetica, Arial, sans-serif	2014-03-12 14:03:42.015492	2014-03-12 14:03:42.015492
94	3	linkhover_color	#5c850f	2014-03-12 14:03:42.018084	2014-03-12 14:03:42.018084
95	3	shadows	t	2014-03-12 14:03:42.020686	2014-03-12 14:03:42.020686
96	3	phone_url	400-123-4567	2014-03-12 14:03:42.023202	2014-03-12 14:03:42.023202
\.


--
-- Data for Name: shop_themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shop_themes (id, shop_id, theme_id, name, role, load_preset, created_at, updated_at) FROM stdin;
1	1	1	乔木林地	main	\N	2014-03-12 14:03:40.241427	2014-03-12 14:03:40.241427
2	2	1	乔木林地	main	\N	2014-03-12 14:03:41.402537	2014-03-12 14:03:41.402537
3	3	1	乔木林地	main	\N	2014-03-12 14:03:41.75882	2014-03-12 14:03:41.75882
\.


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shops (id, name, phone, plan, deadline, province, city, district, zip_code, address, email, password, password_enabled, password_message, currency, money_with_currency_format, money_format, money_with_currency_in_emails_format, money_in_emails_format, orders_count, order_number_format, customer_accounts, signup_source, guided, created_at, updated_at, access_enabled) FROM stdin;
1	shopqi	\N	free	\N	\N	\N	\N	\N	\N	admin@shopqi.com	6039	t	\N	CNY	&#165;{{amount}} 元	&#165;{{amount}}	¥{{amount}} 元	¥{{amount}}	0	#{{number}}	optional	\N	f	2014-03-12 14:03:40.234641	2014-03-12 14:03:40.234641	t
3	myshopqi5	\N	free	\N	\N	\N	\N	\N	\N	admin@myshopqi5.com	3069	t	\N	CNY	&#165;{{amount}} 元	&#165;{{amount}}	¥{{amount}} 元	¥{{amount}}	0	#{{number}}	optional	\N	f	2014-03-12 14:03:41.75545	2014-03-12 14:03:41.75545	t
2	myshopqi	\N	free	\N	\N	\N	\N	\N	\N	admin@myshopqi.com	6486	f	\N	CNY	&#165;{{amount}} 元	&#165;{{amount}}	¥{{amount}} 元	¥{{amount}}	0	#{{number}}	optional	\N	t	2014-03-12 14:03:41.398733	2014-03-12 14:03:44.164774	t
\.


--
-- Data for Name: smart_collection_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY smart_collection_products (id, smart_collection_id, product_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: smart_collection_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY smart_collection_rules (id, smart_collection_id, "column", relation, condition, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: smart_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY smart_collections (id, shop_id, title, published, handle, body_html, products_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscribes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subscribes (id, shop_id, user_id, kind, address, number, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N	2014-03-12 14:03:41.283726	2014-03-12 14:03:41.283726
2	2	2	\N	\N	\N	2014-03-12 14:03:41.661651	2014-03-12 14:03:41.661651
3	3	3	\N	\N	\N	2014-03-12 14:03:42.153044	2014-03-12 14:03:42.153044
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tags (id, shop_id, name, category, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY themes (id, name, handle, style, style_handle, role, price, color, "desc", shop, site, author, email, published, file, main, collection, product, "position") FROM stdin;
1	乔木林地	woodland	石板	slate	main	0	grey	Woodland 是ShopQi官方模板之一，除提供具体模板功能外还提供丰富的自定义配置。	woodland	http://www.shopqi.com	ShopQi	support@shopqi.com	f	woodland.tar.bz2	original.jpg	original.jpg	original.jpg	0
\.


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY translations (id, key, value) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, name, phone, bio, receive_announcements, shop_id, avatar_image_uid, admin, authentication_token, created_at, updated_at, reset_password_sent_at) FROM stdin;
1	admin@shopqi.com	$2a$10$b11EInUrDyyYV7WMfDZTK.6xO14p74EQUXqVoL48P8UPkZHpH7Bwm	\N	\N	0	\N	\N	\N	\N	admin	\N	\N	t	1	\N	t	xsh6GT2zaPCAsirExCvp	2014-03-12 14:03:41.171747	2014-03-12 14:03:41.171747	\N
2	admin@myshopqi.com	$2a$10$TL7g.LZ.qE/jPJU45j5tjuTKSWevBNu8ekvTVuDje6DeA.LELto9K	\N	\N	0	\N	\N	\N	\N	admin	\N	\N	t	2	\N	t	W4Xiudux1aWVCzTtB3ep	2014-03-12 14:03:41.658464	2014-03-12 14:03:41.658464	\N
3	admin@myshopqi5.com	$2a$10$CfFaE1Vfdy/4eI.LJ9SZ8u8rsRALmGaxR0uC0dhBe7Huey14pZbGq	\N	\N	0	\N	\N	\N	\N	admin	\N	\N	t	3	\N	t	Jp8pKjzAPdYpUyh4xmrM	2014-03-12 14:03:42.150407	2014-03-12 14:03:42.150407	\N
\.


--
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY webhooks (id, application_id, shop_id, event, callback_url, created_at) FROM stdin;
\.


--
-- Data for Name: weight_based_shipping_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY weight_based_shipping_rates (id, price, weight_low, weight_high, name, created_at, updated_at, shipping_id) FROM stdin;
1	10	0	25	General delivery	2014-03-12 14:03:40.98528	2014-03-12 14:03:40.98528	1
2	10	0	25	General delivery	2014-03-12 14:03:41.634629	2014-03-12 14:03:41.634629	2
3	10	0	25	General delivery	2014-03-12 14:03:42.12503	2014-03-12 14:03:42.12503	3
\.


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: api_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY api_clients
    ADD CONSTRAINT api_clients_pkey PRIMARY KEY (id);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: cancel_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cancel_reasons
    ADD CONSTRAINT cancel_reasons_pkey PRIMARY KEY (id);


--
-- Name: carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: consumptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY consumptions
    ADD CONSTRAINT consumptions_pkey PRIMARY KEY (id);


--
-- Name: custom_collection_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY custom_collection_products
    ADD CONSTRAINT custom_collection_products_pkey PRIMARY KEY (id);


--
-- Name: custom_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY custom_collections
    ADD CONSTRAINT custom_collections_pkey PRIMARY KEY (id);


--
-- Name: customer_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer_addresses
    ADD CONSTRAINT customer_addresses_pkey PRIMARY KEY (id);


--
-- Name: customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer_groups
    ADD CONSTRAINT customer_groups_pkey PRIMARY KEY (id);


--
-- Name: customer_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer_tags
    ADD CONSTRAINT customer_tags_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: kindeditors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kindeditors
    ADD CONSTRAINT kindeditors_pkey PRIMARY KEY (id);


--
-- Name: link_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY link_lists
    ADD CONSTRAINT link_lists_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: order_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_discounts
    ADD CONSTRAINT order_discounts_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_fulfillments
    ADD CONSTRAINT order_fulfillments_pkey PRIMARY KEY (id);


--
-- Name: order_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_histories
    ADD CONSTRAINT order_histories_pkey PRIMARY KEY (id);


--
-- Name: order_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_line_items
    ADD CONSTRAINT order_line_items_pkey PRIMARY KEY (id);


--
-- Name: order_shipping_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_shipping_addresses
    ADD CONSTRAINT order_shipping_addresses_pkey PRIMARY KEY (id);


--
-- Name: order_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_transactions
    ADD CONSTRAINT order_transactions_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: price_based_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY price_based_shipping_rates
    ADD CONSTRAINT price_based_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (id);


--
-- Name: product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: shippings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shippings
    ADD CONSTRAINT shippings_pkey PRIMARY KEY (id);


--
-- Name: shop_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_domains
    ADD CONSTRAINT shop_domains_pkey PRIMARY KEY (id);


--
-- Name: shop_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_policies
    ADD CONSTRAINT shop_policies_pkey PRIMARY KEY (id);


--
-- Name: shop_product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_product_types
    ADD CONSTRAINT shop_product_types_pkey PRIMARY KEY (id);


--
-- Name: shop_product_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_product_vendors
    ADD CONSTRAINT shop_product_vendors_pkey PRIMARY KEY (id);


--
-- Name: shop_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_tasks
    ADD CONSTRAINT shop_tasks_pkey PRIMARY KEY (id);


--
-- Name: shop_theme_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_theme_settings
    ADD CONSTRAINT shop_theme_settings_pkey PRIMARY KEY (id);


--
-- Name: shop_themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shop_themes
    ADD CONSTRAINT shop_themes_pkey PRIMARY KEY (id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: smart_collection_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY smart_collection_products
    ADD CONSTRAINT smart_collection_products_pkey PRIMARY KEY (id);


--
-- Name: smart_collection_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY smart_collection_rules
    ADD CONSTRAINT smart_collection_rules_pkey PRIMARY KEY (id);


--
-- Name: smart_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY smart_collections
    ADD CONSTRAINT smart_collections_pkey PRIMARY KEY (id);


--
-- Name: subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subscribes
    ADD CONSTRAINT subscribes_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: weight_based_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY weight_based_shipping_rates
    ADD CONSTRAINT weight_based_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_articles_on_blog_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_articles_on_blog_id ON articles USING btree (blog_id);


--
-- Name: index_articles_tags_on_article_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_articles_tags_on_article_id ON articles_tags USING btree (article_id);


--
-- Name: index_articles_tags_on_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_articles_tags_on_tag_id ON articles_tags USING btree (tag_id);


--
-- Name: index_blogs_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_blogs_on_shop_id ON blogs USING btree (shop_id);


--
-- Name: index_carts_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_carts_on_shop_id ON carts USING btree (shop_id);


--
-- Name: index_carts_on_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_carts_on_token ON carts USING btree (token);


--
-- Name: index_comments_on_article_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comments_on_article_id ON comments USING btree (article_id);


--
-- Name: index_custom_collection_products_on_custom_collection_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_custom_collection_products_on_custom_collection_id ON custom_collection_products USING btree (custom_collection_id);


--
-- Name: index_custom_collections_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_custom_collections_on_shop_id ON custom_collections USING btree (shop_id);


--
-- Name: index_customer_addresses_on_customer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_customer_addresses_on_customer_id ON customer_addresses USING btree (customer_id);


--
-- Name: index_customer_groups_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_customer_groups_on_shop_id ON customer_groups USING btree (shop_id);


--
-- Name: index_customer_tags_customers_on_customer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_customer_tags_customers_on_customer_id ON customer_tags_customers USING btree (customer_id);


--
-- Name: index_customer_tags_customers_on_customer_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_customer_tags_customers_on_customer_tag_id ON customer_tags_customers USING btree (customer_tag_id);


--
-- Name: index_customer_tags_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_customer_tags_on_shop_id ON customer_tags USING btree (shop_id);


--
-- Name: index_customers_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_customers_on_shop_id ON customers USING btree (shop_id);


--
-- Name: index_customers_on_shop_id_and_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_customers_on_shop_id_and_email ON customers USING btree (shop_id, email);


--
-- Name: index_link_lists_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_link_lists_on_shop_id ON link_lists USING btree (shop_id);


--
-- Name: index_links_on_link_list_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_links_on_link_list_id ON links USING btree (link_list_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON oauth_applications USING btree (uid);


--
-- Name: index_order_fulfillments_items; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_fulfillments_items ON order_fulfillments_order_line_items USING btree (order_fulfillment_id, order_line_item_id);


--
-- Name: index_order_fulfillments_items_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_fulfillments_items_id ON order_fulfillments_order_line_items USING btree (order_fulfillment_id);


--
-- Name: index_order_fulfillments_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_fulfillments_on_order_id ON order_fulfillments USING btree (order_id);


--
-- Name: index_order_histories_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_histories_on_order_id ON order_histories USING btree (order_id);


--
-- Name: index_order_line_items_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_line_items_on_order_id ON order_line_items USING btree (order_id);


--
-- Name: index_order_shipping_addresses_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_shipping_addresses_on_order_id ON order_shipping_addresses USING btree (order_id);


--
-- Name: index_order_transactions_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_order_transactions_on_order_id ON order_transactions USING btree (order_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_orders_on_customer_id ON orders USING btree (customer_id);


--
-- Name: index_orders_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_orders_on_shop_id ON orders USING btree (shop_id);


--
-- Name: index_orders_on_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_orders_on_token ON orders USING btree (token);


--
-- Name: index_pages_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pages_on_shop_id ON pages USING btree (shop_id);


--
-- Name: index_permissions_on_user_id_and_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_permissions_on_user_id_and_resource_id ON permissions USING btree (user_id, resource_id);


--
-- Name: index_photos_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_photos_on_product_id ON photos USING btree (product_id);


--
-- Name: index_price_based_shipping_rates_on_shipping_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_price_based_shipping_rates_on_shipping_id ON price_based_shipping_rates USING btree (shipping_id);


--
-- Name: index_product_options_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_product_options_on_product_id ON product_options USING btree (product_id);


--
-- Name: index_product_variants_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_product_variants_on_product_id ON product_variants USING btree (product_id);


--
-- Name: index_products_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_on_shop_id ON products USING btree (shop_id);


--
-- Name: index_products_tags_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_tags_on_product_id ON products_tags USING btree (product_id);


--
-- Name: index_products_tags_on_tag_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_tags_on_tag_id ON products_tags USING btree (tag_id);


--
-- Name: index_shippings_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shippings_on_shop_id ON shippings USING btree (shop_id);


--
-- Name: index_shop_domains_on_host; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_domains_on_host ON shop_domains USING btree (host);


--
-- Name: index_shop_domains_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_domains_on_shop_id ON shop_domains USING btree (shop_id);


--
-- Name: index_shop_policies_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_policies_on_shop_id ON shop_policies USING btree (shop_id);


--
-- Name: index_shop_product_types_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_product_types_on_shop_id ON shop_product_types USING btree (shop_id);


--
-- Name: index_shop_product_vendors_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_product_vendors_on_shop_id ON shop_product_vendors USING btree (shop_id);


--
-- Name: index_shop_tasks_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_tasks_on_shop_id ON shop_tasks USING btree (shop_id);


--
-- Name: index_shop_theme_settings_on_shop_theme_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_theme_settings_on_shop_theme_id ON shop_theme_settings USING btree (shop_theme_id);


--
-- Name: index_shop_themes_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shop_themes_on_shop_id ON shop_themes USING btree (shop_id);


--
-- Name: index_smart_collection_products_on_smart_collection_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_smart_collection_products_on_smart_collection_id ON smart_collection_products USING btree (smart_collection_id);


--
-- Name: index_smart_collection_rules_on_smart_collection_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_smart_collection_rules_on_smart_collection_id ON smart_collection_rules USING btree (smart_collection_id);


--
-- Name: index_smart_collections_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_smart_collections_on_shop_id ON smart_collections USING btree (shop_id);


--
-- Name: index_tags_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tags_on_shop_id ON tags USING btree (shop_id);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_shop_id ON users USING btree (shop_id);


--
-- Name: index_users_on_shop_id_and_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_shop_id_and_email ON users USING btree (shop_id, email);


--
-- Name: index_weight_based_shipping_rates_on_shipping_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_weight_based_shipping_rates_on_shipping_id ON weight_based_shipping_rates USING btree (shipping_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

