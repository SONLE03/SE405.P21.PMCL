--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-0+deb12u1)

-- Started on 2025-06-09 13:57:59 UTC

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
-- TOC entry 6 (class 2615 OID 16977)
-- Name: hangfire; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hangfire;


ALTER SCHEMA hangfire OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 275 (class 1259 OID 17269)
-- Name: aggregatedcounter; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.aggregatedcounter (
    id bigint NOT NULL,
    key text NOT NULL,
    value bigint NOT NULL,
    expireat timestamp with time zone
);


ALTER TABLE hangfire.aggregatedcounter OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17268)
-- Name: aggregatedcounter_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.aggregatedcounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.aggregatedcounter_id_seq OWNER TO postgres;

--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 274
-- Name: aggregatedcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.aggregatedcounter_id_seq OWNED BY hangfire.aggregatedcounter.id;


--
-- TOC entry 257 (class 1259 OID 16984)
-- Name: counter; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.counter (
    id bigint NOT NULL,
    key text NOT NULL,
    value bigint NOT NULL,
    expireat timestamp with time zone
);


ALTER TABLE hangfire.counter OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16983)
-- Name: counter_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.counter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.counter_id_seq OWNER TO postgres;

--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 256
-- Name: counter_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.counter_id_seq OWNED BY hangfire.counter.id;


--
-- TOC entry 259 (class 1259 OID 16992)
-- Name: hash; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.hash (
    id bigint NOT NULL,
    key text NOT NULL,
    field text NOT NULL,
    value text,
    expireat timestamp with time zone,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.hash OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16991)
-- Name: hash_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.hash_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.hash_id_seq OWNER TO postgres;

--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 258
-- Name: hash_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.hash_id_seq OWNED BY hangfire.hash.id;


--
-- TOC entry 261 (class 1259 OID 17003)
-- Name: job; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.job (
    id bigint NOT NULL,
    stateid bigint,
    statename text,
    invocationdata jsonb NOT NULL,
    arguments jsonb NOT NULL,
    createdat timestamp with time zone NOT NULL,
    expireat timestamp with time zone,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.job OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17002)
-- Name: job_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.job_id_seq OWNER TO postgres;

--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 260
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.job_id_seq OWNED BY hangfire.job.id;


--
-- TOC entry 272 (class 1259 OID 17063)
-- Name: jobparameter; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.jobparameter (
    id bigint NOT NULL,
    jobid bigint NOT NULL,
    name text NOT NULL,
    value text,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.jobparameter OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17062)
-- Name: jobparameter_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.jobparameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.jobparameter_id_seq OWNER TO postgres;

--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 271
-- Name: jobparameter_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.jobparameter_id_seq OWNED BY hangfire.jobparameter.id;


--
-- TOC entry 265 (class 1259 OID 17028)
-- Name: jobqueue; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.jobqueue (
    id bigint NOT NULL,
    jobid bigint NOT NULL,
    queue text NOT NULL,
    fetchedat timestamp with time zone,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.jobqueue OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17027)
-- Name: jobqueue_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.jobqueue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.jobqueue_id_seq OWNER TO postgres;

--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 264
-- Name: jobqueue_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.jobqueue_id_seq OWNED BY hangfire.jobqueue.id;


--
-- TOC entry 267 (class 1259 OID 17036)
-- Name: list; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.list (
    id bigint NOT NULL,
    key text NOT NULL,
    value text,
    expireat timestamp with time zone,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.list OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17035)
-- Name: list_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.list_id_seq OWNER TO postgres;

--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 266
-- Name: list_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.list_id_seq OWNED BY hangfire.list.id;


--
-- TOC entry 273 (class 1259 OID 17077)
-- Name: lock; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.lock (
    resource text NOT NULL,
    updatecount integer DEFAULT 0 NOT NULL,
    acquired timestamp with time zone
);


ALTER TABLE hangfire.lock OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16978)
-- Name: schema; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.schema (
    version integer NOT NULL
);


ALTER TABLE hangfire.schema OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17044)
-- Name: server; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.server (
    id text NOT NULL,
    data jsonb,
    lastheartbeat timestamp with time zone NOT NULL,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.server OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17052)
-- Name: set; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.set (
    id bigint NOT NULL,
    key text NOT NULL,
    score double precision NOT NULL,
    value text NOT NULL,
    expireat timestamp with time zone,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.set OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 17051)
-- Name: set_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.set_id_seq OWNER TO postgres;

--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 269
-- Name: set_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.set_id_seq OWNED BY hangfire.set.id;


--
-- TOC entry 263 (class 1259 OID 17013)
-- Name: state; Type: TABLE; Schema: hangfire; Owner: postgres
--

CREATE TABLE hangfire.state (
    id bigint NOT NULL,
    jobid bigint NOT NULL,
    name text NOT NULL,
    reason text,
    createdat timestamp with time zone NOT NULL,
    data jsonb,
    updatecount integer DEFAULT 0 NOT NULL
);


ALTER TABLE hangfire.state OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17012)
-- Name: state_id_seq; Type: SEQUENCE; Schema: hangfire; Owner: postgres
--

CREATE SEQUENCE hangfire.state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hangfire.state_id_seq OWNER TO postgres;

--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 262
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: hangfire; Owner: postgres
--

ALTER SEQUENCE hangfire.state_id_seq OWNED BY hangfire.state.id;


--
-- TOC entry 224 (class 1259 OID 16444)
-- Name: Address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Address" (
    "Id" uuid NOT NULL,
    "Province" text NOT NULL,
    "District" text NOT NULL,
    "Ward" text NOT NULL,
    "SpecificAddress" text NOT NULL,
    "PostalCode" text NOT NULL,
    "IsDefault" boolean NOT NULL,
    "IsDeleted" boolean NOT NULL,
    "UserId" text NOT NULL
);


ALTER TABLE public."Address" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16427)
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "RoleId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "Discriminator" character varying(34) NOT NULL,
    "AspNetTypeClaimsId" integer
);


ALTER TABLE public."AspNetRoleClaims" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16426)
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."AspNetRoleClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetRoleClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16390)
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetRoles" (
    "Id" text NOT NULL,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);


ALTER TABLE public."AspNetRoles" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16398)
-- Name: AspNetTypeClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetTypeClaims" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public."AspNetTypeClaims" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16397)
-- Name: AspNetTypeClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."AspNetTypeClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetTypeClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16452)
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserClaims" (
    "Id" integer NOT NULL,
    "UserId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."AspNetUserClaims" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16451)
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."AspNetUserClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16459)
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE public."AspNetUserLogins" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16466)
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE public."AspNetUserRoles" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16485)
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


ALTER TABLE public."AspNetUserTokens" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16478)
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUsers" (
    "Id" text NOT NULL,
    "FullName" text,
    "DateOfBirth" date,
    "AssetId" uuid,
    "IsDeleted" boolean,
    "IsLocked" boolean,
    "Role" text NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL
);


ALTER TABLE public."AspNetUsers" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16538)
-- Name: Asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Asset" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "URL" text NOT NULL,
    "CloudinaryId" text NOT NULL,
    "FolderName" text NOT NULL,
    "ProductVariantId" uuid,
    "ReviewId" uuid,
    "OrderStatusId" uuid
);


ALTER TABLE public."Asset" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16545)
-- Name: Brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brand" (
    "Id" uuid NOT NULL,
    "BrandName" text NOT NULL,
    "Description" text,
    "AssetId" uuid,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Brand" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16497)
-- Name: Cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cart" (
    "Id" uuid NOT NULL,
    "UserId" text NOT NULL
);


ALTER TABLE public."Cart" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16678)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    "Id" uuid NOT NULL,
    "CategoryName" text NOT NULL,
    "Description" text,
    "AssetId" uuid,
    "FurnitureTypeId" uuid NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16405)
-- Name: Color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Color" (
    "Id" uuid NOT NULL,
    "ColorName" text NOT NULL,
    "ColorCode" text,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Color" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16557)
-- Name: Coupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Coupon" (
    "Id" uuid NOT NULL,
    "Code" text NOT NULL,
    "AssetId" uuid,
    "Description" text,
    "Quantity" bigint NOT NULL,
    "UsageCount" bigint NOT NULL,
    "MinOrderValue" numeric(18,2) NOT NULL,
    "DiscountValue" numeric(18,2) NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    "ECouponType" integer NOT NULL,
    "ECouponStatus" integer NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Coupon" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16569)
-- Name: Designer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Designer" (
    "Id" uuid NOT NULL,
    "DesignerName" text NOT NULL,
    "Description" text,
    "AssetId" uuid,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Designer" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16717)
-- Name: Favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Favorite" (
    "UserId" text NOT NULL,
    "ProductId" uuid NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Favorite" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16644)
-- Name: FurnitureType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FurnitureType" (
    "Id" uuid NOT NULL,
    "FurnitureTypeName" text NOT NULL,
    "Description" text,
    "AssetId" uuid,
    "RoomSpaceId" uuid NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."FurnitureType" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16412)
-- Name: ImportInvoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ImportInvoice" (
    "Id" uuid NOT NULL,
    "Total" numeric(18,2) NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."ImportInvoice" OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16847)
-- Name: ImportItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ImportItem" (
    "ImportInvoiceId" uuid NOT NULL,
    "ProductVariantId" uuid NOT NULL,
    "Quantity" bigint NOT NULL,
    "Price" numeric(18,2) NOT NULL,
    "Total" numeric(18,2) NOT NULL
);


ALTER TABLE public."ImportItem" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16581)
-- Name: Material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Material" (
    "Id" uuid NOT NULL,
    "MaterialName" text NOT NULL,
    "Description" text,
    "AssetId" uuid,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Material" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: Notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notification" (
    "Id" uuid NOT NULL,
    "Content" text NOT NULL,
    "Title" text NOT NULL,
    "RedirectUrl" text NOT NULL,
    "Read" boolean NOT NULL,
    "ENotificationType" integer NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Notification" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16605)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "Id" uuid NOT NULL,
    "PhoneNumber" text NOT NULL,
    "Email" text NOT NULL,
    "PaymentMethod" integer NOT NULL,
    "CanceledAt" timestamp without time zone,
    "CompletedAt" timestamp without time zone,
    "DeliveredAt" timestamp without time zone,
    "Note" text,
    "ShippingFee" numeric(18,2) NOT NULL,
    "OrderStatus" integer NOT NULL,
    "CouponId" uuid,
    "ShipperId" text,
    "UserId" text NOT NULL,
    "AddressId" uuid NOT NULL,
    "TaxFee" numeric(18,2) NOT NULL,
    "SubTotal" numeric(18,2) NOT NULL,
    "Total" numeric(18,2) NOT NULL,
    "AccountsReceivable" numeric NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16734)
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItem" (
    "Id" uuid NOT NULL,
    "ProductId" uuid NOT NULL,
    "UserId" text NOT NULL,
    "Dimension" text NOT NULL,
    "ColorId" uuid NOT NULL,
    "Price" numeric(18,2) NOT NULL,
    "Quantity" bigint NOT NULL,
    "SubTotal" numeric(18,2) NOT NULL,
    "CartId" uuid,
    "OrderId" uuid
);


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16661)
-- Name: OrderStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderStatus" (
    "Id" uuid NOT NULL,
    "OrderId" uuid NOT NULL,
    "ShipperId" text,
    "UserId" text,
    "Status" integer NOT NULL,
    "Note" text,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."OrderStatus" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16695)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "Id" uuid NOT NULL,
    "ProductName" text NOT NULL,
    "Description" text,
    "MinPrice" numeric(18,2) NOT NULL,
    "MaxPrice" numeric(18,2) NOT NULL,
    "Discount" numeric(18,2) NOT NULL,
    "Sold" bigint NOT NULL,
    "Unit" text NOT NULL,
    "RatingCount" integer NOT NULL,
    "RatingValue" real NOT NULL,
    "Status" integer NOT NULL,
    "AssetId" uuid,
    "BrandId" uuid,
    "CategoryId" uuid,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16766)
-- Name: ProductDesigner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductDesigner" (
    "DesignerId" uuid NOT NULL,
    "ProductId" uuid NOT NULL
);


ALTER TABLE public."ProductDesigner" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16781)
-- Name: ProductMaterial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductMaterial" (
    "MaterialId" uuid NOT NULL,
    "ProductId" uuid NOT NULL
);


ALTER TABLE public."ProductMaterial" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16796)
-- Name: ProductVariant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductVariant" (
    "Id" uuid NOT NULL,
    "ProductId" uuid NOT NULL,
    "ColorId" uuid NOT NULL,
    "DisplayDimension" text NOT NULL,
    "Length" numeric(18,2) NOT NULL,
    "Width" numeric(18,2) NOT NULL,
    "Height" numeric(18,2) NOT NULL,
    "Quantity" bigint NOT NULL,
    "Price" numeric(18,2) NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."ProductVariant" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16813)
-- Name: Question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Question" (
    "Id" uuid NOT NULL,
    "Content" text NOT NULL,
    "UserId" text NOT NULL,
    "ProductId" uuid NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Question" OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16862)
-- Name: Reply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Reply" (
    "Id" uuid NOT NULL,
    "Content" text NOT NULL,
    "UserId" text NOT NULL,
    "ReviewId" uuid,
    "QuestionId" uuid,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Reply" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16830)
-- Name: Review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Review" (
    "Id" uuid NOT NULL,
    "Content" text NOT NULL,
    "UserId" text NOT NULL,
    "ProductId" uuid NOT NULL,
    "Rate" integer NOT NULL,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."Review" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16593)
-- Name: RoomSpace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RoomSpace" (
    "Id" uuid NOT NULL,
    "RoomSpaceName" text NOT NULL,
    "Description" text,
    "AssetId" uuid,
    "CreatedDate" timestamp without time zone,
    "UpdatedDate" timestamp without time zone,
    "CreatedBy" text,
    "UpdatedBy" text,
    "IsDeleted" boolean NOT NULL,
    "DeleteDate" timestamp with time zone
);


ALTER TABLE public."RoomSpace" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16509)
-- Name: Token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Token" (
    "Id" uuid NOT NULL,
    "Token" text NOT NULL,
    "ExpiredDate" timestamp with time zone NOT NULL,
    "IpAddress" text NOT NULL,
    "UserAgent" text NOT NULL,
    "UserId" text NOT NULL
);


ALTER TABLE public."Token" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16521)
-- Name: UserNotification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserNotification" (
    "NotificationId" uuid NOT NULL,
    "UserId" text NOT NULL
);


ALTER TABLE public."UserNotification" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16627)
-- Name: UserUsedCoupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserUsedCoupon" (
    "UserId" text NOT NULL,
    "CouponId" uuid NOT NULL,
    "Quantity" bigint NOT NULL
);


ALTER TABLE public."UserUsedCoupon" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16385)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 3420 (class 2604 OID 17272)
-- Name: aggregatedcounter id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.aggregatedcounter ALTER COLUMN id SET DEFAULT nextval('hangfire.aggregatedcounter_id_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 17110)
-- Name: counter id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.counter ALTER COLUMN id SET DEFAULT nextval('hangfire.counter_id_seq'::regclass);


--
-- TOC entry 3404 (class 2604 OID 17119)
-- Name: hash id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.hash ALTER COLUMN id SET DEFAULT nextval('hangfire.hash_id_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 17129)
-- Name: job id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.job ALTER COLUMN id SET DEFAULT nextval('hangfire.job_id_seq'::regclass);


--
-- TOC entry 3417 (class 2604 OID 17179)
-- Name: jobparameter id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.jobparameter ALTER COLUMN id SET DEFAULT nextval('hangfire.jobparameter_id_seq'::regclass);


--
-- TOC entry 3410 (class 2604 OID 17202)
-- Name: jobqueue id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.jobqueue ALTER COLUMN id SET DEFAULT nextval('hangfire.jobqueue_id_seq'::regclass);


--
-- TOC entry 3412 (class 2604 OID 17222)
-- Name: list id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.list ALTER COLUMN id SET DEFAULT nextval('hangfire.list_id_seq'::regclass);


--
-- TOC entry 3415 (class 2604 OID 17231)
-- Name: set id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.set ALTER COLUMN id SET DEFAULT nextval('hangfire.set_id_seq'::regclass);


--
-- TOC entry 3408 (class 2604 OID 17156)
-- Name: state id; Type: DEFAULT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.state ALTER COLUMN id SET DEFAULT nextval('hangfire.state_id_seq'::regclass);


--
-- TOC entry 3853 (class 0 OID 17269)
-- Dependencies: 275
-- Data for Name: aggregatedcounter; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--



--
-- TOC entry 3835 (class 0 OID 16984)
-- Dependencies: 257
-- Data for Name: counter; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--



--
-- TOC entry 3837 (class 0 OID 16992)
-- Dependencies: 259
-- Data for Name: hash; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.hash VALUES (1, 'recurring-job:PostgresBackupJob', 'Queue', 'default', NULL, 0);
INSERT INTO hangfire.hash VALUES (2, 'recurring-job:PostgresBackupJob', 'Cron', '0 2 * * *', NULL, 0);
INSERT INTO hangfire.hash VALUES (3, 'recurring-job:PostgresBackupJob', 'TimeZoneId', 'UTC', NULL, 0);
INSERT INTO hangfire.hash VALUES (4, 'recurring-job:PostgresBackupJob', 'Job', '{"Type":"FurnitureStoreBE.Services.ScheduledTasks, FurnitureStoreBE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"BackupPostgresDatabase","ParameterTypes":"[]","Arguments":"[]"}', NULL, 0);
INSERT INTO hangfire.hash VALUES (5, 'recurring-job:PostgresBackupJob', 'CreatedAt', '2025-06-08T16:05:15.1502966Z', NULL, 0);
INSERT INTO hangfire.hash VALUES (7, 'recurring-job:PostgresBackupJob', 'V', '2', NULL, 0);
INSERT INTO hangfire.hash VALUES (8, 'recurring-job:PostgresBackupJob', 'LastExecution', '2025-06-09T13:57:59.4745444Z', NULL, 0);
INSERT INTO hangfire.hash VALUES (6, 'recurring-job:PostgresBackupJob', 'NextExecution', '2025-06-10T02:00:00.0000000Z', NULL, 0);
INSERT INTO hangfire.hash VALUES (9, 'recurring-job:PostgresBackupJob', 'LastJobId', '1', NULL, 0);


--
-- TOC entry 3839 (class 0 OID 17003)
-- Dependencies: 261
-- Data for Name: job; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.job VALUES (1, 2, 'Processing', '{"Type": "FurnitureStoreBE.Services.ScheduledTasks, FurnitureStoreBE, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "Method": "BackupPostgresDatabase", "Arguments": "[]", "ParameterTypes": "[]"}', '[]', '2025-06-09 13:57:59.575647+00', NULL, 0);


--
-- TOC entry 3850 (class 0 OID 17063)
-- Dependencies: 272
-- Data for Name: jobparameter; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.jobparameter VALUES (1, 1, 'RecurringJobId', '"PostgresBackupJob"', 0);
INSERT INTO hangfire.jobparameter VALUES (2, 1, 'Time', '1749477479', 0);
INSERT INTO hangfire.jobparameter VALUES (3, 1, 'CurrentCulture', '""', 0);
INSERT INTO hangfire.jobparameter VALUES (4, 1, 'CurrentUICulture', '""', 0);


--
-- TOC entry 3843 (class 0 OID 17028)
-- Dependencies: 265
-- Data for Name: jobqueue; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.jobqueue VALUES (1, 1, 'default', '2025-06-09 13:57:59.665365+00', 0);


--
-- TOC entry 3845 (class 0 OID 17036)
-- Dependencies: 267
-- Data for Name: list; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--



--
-- TOC entry 3851 (class 0 OID 17077)
-- Dependencies: 273
-- Data for Name: lock; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--



--
-- TOC entry 3833 (class 0 OID 16978)
-- Dependencies: 255
-- Data for Name: schema; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.schema VALUES (23);


--
-- TOC entry 3846 (class 0 OID 17044)
-- Dependencies: 268
-- Data for Name: server; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.server VALUES ('d1c7a8ce1714:79:c51f2c25-ad31-41d3-81df-22ae4213fd40', '{"Queues": ["default"], "StartedAt": "2025-06-09T13:57:58.9899466Z", "WorkerCount": 20}', '2025-06-09 13:57:59.002538+00', 0);


--
-- TOC entry 3848 (class 0 OID 17052)
-- Dependencies: 270
-- Data for Name: set; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.set VALUES (1, 'recurring-jobs', 1749520800, 'PostgresBackupJob', NULL, 0);


--
-- TOC entry 3841 (class 0 OID 17013)
-- Dependencies: 263
-- Data for Name: state; Type: TABLE DATA; Schema: hangfire; Owner: postgres
--

INSERT INTO hangfire.state VALUES (1, 1, 'Enqueued', 'Triggered by recurring job scheduler', '2025-06-09 13:57:59.638447+00', '{"Queue": "default", "EnqueuedAt": "2025-06-09T13:57:59.6200718Z"}', 0);
INSERT INTO hangfire.state VALUES (2, 1, 'Processing', NULL, '2025-06-09 13:57:59.688876+00', '{"ServerId": "d1c7a8ce1714:79:c51f2c25-ad31-41d3-81df-22ae4213fd40", "WorkerId": "df628b42-0cad-43c4-8740-cabf8ec84176", "StartedAt": "2025-06-09T13:57:59.6713836Z"}', 0);


--
-- TOC entry 3802 (class 0 OID 16444)
-- Dependencies: 224
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3801 (class 0 OID 16427)
-- Dependencies: 223
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AspNetRoleClaims" VALUES (1, '1', 'CreateUser', 'CreateUser', 'AspNetRoleClaims<string>', 1);
INSERT INTO public."AspNetRoleClaims" VALUES (2, '1', 'UpdateUser', 'UpdateUser', 'AspNetRoleClaims<string>', 1);
INSERT INTO public."AspNetRoleClaims" VALUES (3, '1', 'DeleteUser', 'DeleteUser', 'AspNetRoleClaims<string>', 1);
INSERT INTO public."AspNetRoleClaims" VALUES (4, '1', 'CreateBrand', 'CreateBrand', 'AspNetRoleClaims<string>', 2);
INSERT INTO public."AspNetRoleClaims" VALUES (5, '1', 'UpdateBrand', 'UpdateBrand', 'AspNetRoleClaims<string>', 2);
INSERT INTO public."AspNetRoleClaims" VALUES (6, '1', 'DeleteBrand', 'DeleteBrand', 'AspNetRoleClaims<string>', 2);
INSERT INTO public."AspNetRoleClaims" VALUES (7, '1', 'CreateCategory', 'CreateCategory', 'AspNetRoleClaims<string>', 3);
INSERT INTO public."AspNetRoleClaims" VALUES (8, '1', 'UpdateCategory', 'UpdateCategory', 'AspNetRoleClaims<string>', 3);
INSERT INTO public."AspNetRoleClaims" VALUES (9, '1', 'DeleteCategory', 'DeleteCategory', 'AspNetRoleClaims<string>', 3);
INSERT INTO public."AspNetRoleClaims" VALUES (10, '1', 'CreateColor', 'CreateColor', 'AspNetRoleClaims<string>', 4);
INSERT INTO public."AspNetRoleClaims" VALUES (11, '1', 'UpdateColor', 'UpdateColor', 'AspNetRoleClaims<string>', 4);
INSERT INTO public."AspNetRoleClaims" VALUES (12, '1', 'DeleteColor', 'DeleteColor', 'AspNetRoleClaims<string>', 4);
INSERT INTO public."AspNetRoleClaims" VALUES (13, '1', 'CreateCoupon', 'CreateCoupon', 'AspNetRoleClaims<string>', 5);
INSERT INTO public."AspNetRoleClaims" VALUES (14, '1', 'UpdateCoupon', 'UpdateCoupon', 'AspNetRoleClaims<string>', 5);
INSERT INTO public."AspNetRoleClaims" VALUES (15, '1', 'DeleteCoupon', 'DeleteCoupon', 'AspNetRoleClaims<string>', 5);
INSERT INTO public."AspNetRoleClaims" VALUES (16, '1', 'CreateCustomer', 'CreateCustomer', 'AspNetRoleClaims<string>', 6);
INSERT INTO public."AspNetRoleClaims" VALUES (17, '1', 'UpdateCustomer', 'UpdateCustomer', 'AspNetRoleClaims<string>', 6);
INSERT INTO public."AspNetRoleClaims" VALUES (18, '1', 'DeleteCustomer', 'DeleteCustomer', 'AspNetRoleClaims<string>', 6);
INSERT INTO public."AspNetRoleClaims" VALUES (19, '1', 'CreateDesigner', 'CreateDesigner', 'AspNetRoleClaims<string>', 7);
INSERT INTO public."AspNetRoleClaims" VALUES (20, '1', 'UpdateDesigner', 'UpdateDesigner', 'AspNetRoleClaims<string>', 7);
INSERT INTO public."AspNetRoleClaims" VALUES (21, '1', 'DeleteDesigner', 'DeleteDesigner', 'AspNetRoleClaims<string>', 7);
INSERT INTO public."AspNetRoleClaims" VALUES (22, '1', 'CreateFurnitureType', 'CreateFurnitureType', 'AspNetRoleClaims<string>', 8);
INSERT INTO public."AspNetRoleClaims" VALUES (23, '1', 'UpdateFurnitureType', 'UpdateFurnitureType', 'AspNetRoleClaims<string>', 8);
INSERT INTO public."AspNetRoleClaims" VALUES (24, '1', 'DeleteFurnitureType', 'DeleteFurnitureType', 'AspNetRoleClaims<string>', 8);
INSERT INTO public."AspNetRoleClaims" VALUES (25, '1', 'CreateMaterial', 'CreateMaterial', 'AspNetRoleClaims<string>', 9);
INSERT INTO public."AspNetRoleClaims" VALUES (26, '1', 'UpdateMaterial', 'UpdateMaterial', 'AspNetRoleClaims<string>', 9);
INSERT INTO public."AspNetRoleClaims" VALUES (27, '1', 'DeleteMaterial', 'DeleteMaterial', 'AspNetRoleClaims<string>', 9);
INSERT INTO public."AspNetRoleClaims" VALUES (28, '1', 'CreateMaterialType', 'CreateMaterialType', 'AspNetRoleClaims<string>', 10);
INSERT INTO public."AspNetRoleClaims" VALUES (29, '1', 'UpdateMaterialType', 'UpdateMaterialType', 'AspNetRoleClaims<string>', 10);
INSERT INTO public."AspNetRoleClaims" VALUES (30, '1', 'DeleteMaterialType', 'DeleteMaterialType', 'AspNetRoleClaims<string>', 10);
INSERT INTO public."AspNetRoleClaims" VALUES (31, '1', 'CreateNotification', 'CreateNotification', 'AspNetRoleClaims<string>', 11);
INSERT INTO public."AspNetRoleClaims" VALUES (32, '1', 'UpdateNotification', 'UpdateNotification', 'AspNetRoleClaims<string>', 11);
INSERT INTO public."AspNetRoleClaims" VALUES (33, '1', 'DeleteNotification', 'DeleteNotification', 'AspNetRoleClaims<string>', 11);
INSERT INTO public."AspNetRoleClaims" VALUES (34, '1', 'CreateRole', 'CreateRole', 'AspNetRoleClaims<string>', 12);
INSERT INTO public."AspNetRoleClaims" VALUES (35, '1', 'UpdateRole', 'UpdateRole', 'AspNetRoleClaims<string>', 12);
INSERT INTO public."AspNetRoleClaims" VALUES (36, '1', 'DeleteRole', 'DeleteRole', 'AspNetRoleClaims<string>', 12);
INSERT INTO public."AspNetRoleClaims" VALUES (37, '1', 'CreateOrder', 'CreateOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (38, '1', 'UpdateOrder', 'UpdateOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (39, '1', 'DeleteOrder', 'DeleteOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (40, '1', 'CreateProduct', 'CreateProduct', 'AspNetRoleClaims<string>', 14);
INSERT INTO public."AspNetRoleClaims" VALUES (41, '1', 'UpdateProduct', 'UpdateProduct', 'AspNetRoleClaims<string>', 14);
INSERT INTO public."AspNetRoleClaims" VALUES (42, '1', 'DeleteProduct', 'DeleteProduct', 'AspNetRoleClaims<string>', 14);
INSERT INTO public."AspNetRoleClaims" VALUES (43, '1', 'CreateQuestion', 'CreateQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (44, '1', 'UpdateQuestion', 'UpdateQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (45, '1', 'DeleteQuestion', 'DeleteQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (46, '1', 'CreateReply', 'CreateReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (47, '1', 'UpdateReply', 'UpdateReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (48, '1', 'DeleteReply', 'DeleteReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (49, '1', 'CreateReview', 'CreateReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (50, '1', 'UpdateReview', 'UpdateReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (51, '1', 'DeleteReview', 'DeleteReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (52, '1', 'CreateRoomSpace', 'CreateRoomSpace', 'AspNetRoleClaims<string>', 18);
INSERT INTO public."AspNetRoleClaims" VALUES (53, '1', 'UpdateRoomSpace', 'UpdateRoomSpace', 'AspNetRoleClaims<string>', 18);
INSERT INTO public."AspNetRoleClaims" VALUES (54, '1', 'DeleteRoomSpace', 'DeleteRoomSpace', 'AspNetRoleClaims<string>', 18);
INSERT INTO public."AspNetRoleClaims" VALUES (55, '1', 'CreateReport', 'CreateReport', 'AspNetRoleClaims<string>', 19);
INSERT INTO public."AspNetRoleClaims" VALUES (56, '2', 'CreateUser', 'CreateUser', 'AspNetRoleClaims<string>', 1);
INSERT INTO public."AspNetRoleClaims" VALUES (57, '2', 'UpdateUser', 'UpdateUser', 'AspNetRoleClaims<string>', 1);
INSERT INTO public."AspNetRoleClaims" VALUES (58, '2', 'DeleteUser', 'DeleteUser', 'AspNetRoleClaims<string>', 1);
INSERT INTO public."AspNetRoleClaims" VALUES (59, '2', 'CreateBrand', 'CreateBrand', 'AspNetRoleClaims<string>', 2);
INSERT INTO public."AspNetRoleClaims" VALUES (60, '2', 'UpdateBrand', 'UpdateBrand', 'AspNetRoleClaims<string>', 2);
INSERT INTO public."AspNetRoleClaims" VALUES (61, '2', 'DeleteBrand', 'DeleteBrand', 'AspNetRoleClaims<string>', 2);
INSERT INTO public."AspNetRoleClaims" VALUES (62, '2', 'CreateCategory', 'CreateCategory', 'AspNetRoleClaims<string>', 3);
INSERT INTO public."AspNetRoleClaims" VALUES (63, '2', 'UpdateCategory', 'UpdateCategory', 'AspNetRoleClaims<string>', 3);
INSERT INTO public."AspNetRoleClaims" VALUES (64, '2', 'DeleteCategory', 'DeleteCategory', 'AspNetRoleClaims<string>', 3);
INSERT INTO public."AspNetRoleClaims" VALUES (65, '2', 'CreateColor', 'CreateColor', 'AspNetRoleClaims<string>', 4);
INSERT INTO public."AspNetRoleClaims" VALUES (66, '2', 'UpdateColor', 'UpdateColor', 'AspNetRoleClaims<string>', 4);
INSERT INTO public."AspNetRoleClaims" VALUES (67, '2', 'DeleteColor', 'DeleteColor', 'AspNetRoleClaims<string>', 4);
INSERT INTO public."AspNetRoleClaims" VALUES (68, '2', 'CreateCoupon', 'CreateCoupon', 'AspNetRoleClaims<string>', 5);
INSERT INTO public."AspNetRoleClaims" VALUES (69, '2', 'UpdateCoupon', 'UpdateCoupon', 'AspNetRoleClaims<string>', 5);
INSERT INTO public."AspNetRoleClaims" VALUES (70, '2', 'DeleteCoupon', 'DeleteCoupon', 'AspNetRoleClaims<string>', 5);
INSERT INTO public."AspNetRoleClaims" VALUES (71, '2', 'CreateCustomer', 'CreateCustomer', 'AspNetRoleClaims<string>', 6);
INSERT INTO public."AspNetRoleClaims" VALUES (72, '2', 'UpdateCustomer', 'UpdateCustomer', 'AspNetRoleClaims<string>', 6);
INSERT INTO public."AspNetRoleClaims" VALUES (73, '2', 'DeleteCustomer', 'DeleteCustomer', 'AspNetRoleClaims<string>', 6);
INSERT INTO public."AspNetRoleClaims" VALUES (74, '2', 'CreateDesigner', 'CreateDesigner', 'AspNetRoleClaims<string>', 7);
INSERT INTO public."AspNetRoleClaims" VALUES (75, '2', 'UpdateDesigner', 'UpdateDesigner', 'AspNetRoleClaims<string>', 7);
INSERT INTO public."AspNetRoleClaims" VALUES (76, '2', 'DeleteDesigner', 'DeleteDesigner', 'AspNetRoleClaims<string>', 7);
INSERT INTO public."AspNetRoleClaims" VALUES (77, '2', 'CreateFurnitureType', 'CreateFurnitureType', 'AspNetRoleClaims<string>', 8);
INSERT INTO public."AspNetRoleClaims" VALUES (78, '2', 'UpdateFurnitureType', 'UpdateFurnitureType', 'AspNetRoleClaims<string>', 8);
INSERT INTO public."AspNetRoleClaims" VALUES (79, '2', 'DeleteFurnitureType', 'DeleteFurnitureType', 'AspNetRoleClaims<string>', 8);
INSERT INTO public."AspNetRoleClaims" VALUES (80, '2', 'CreateMaterial', 'CreateMaterial', 'AspNetRoleClaims<string>', 9);
INSERT INTO public."AspNetRoleClaims" VALUES (81, '2', 'UpdateMaterial', 'UpdateMaterial', 'AspNetRoleClaims<string>', 9);
INSERT INTO public."AspNetRoleClaims" VALUES (82, '2', 'DeleteMaterial', 'DeleteMaterial', 'AspNetRoleClaims<string>', 9);
INSERT INTO public."AspNetRoleClaims" VALUES (83, '2', 'CreateMaterialType', 'CreateMaterialType', 'AspNetRoleClaims<string>', 10);
INSERT INTO public."AspNetRoleClaims" VALUES (84, '2', 'UpdateMaterialType', 'UpdateMaterialType', 'AspNetRoleClaims<string>', 10);
INSERT INTO public."AspNetRoleClaims" VALUES (85, '2', 'DeleteMaterialType', 'DeleteMaterialType', 'AspNetRoleClaims<string>', 10);
INSERT INTO public."AspNetRoleClaims" VALUES (86, '2', 'CreateNotification', 'CreateNotification', 'AspNetRoleClaims<string>', 11);
INSERT INTO public."AspNetRoleClaims" VALUES (87, '2', 'UpdateNotification', 'UpdateNotification', 'AspNetRoleClaims<string>', 11);
INSERT INTO public."AspNetRoleClaims" VALUES (88, '2', 'DeleteNotification', 'DeleteNotification', 'AspNetRoleClaims<string>', 11);
INSERT INTO public."AspNetRoleClaims" VALUES (89, '2', 'CreateRole', 'CreateRole', 'AspNetRoleClaims<string>', 12);
INSERT INTO public."AspNetRoleClaims" VALUES (90, '2', 'UpdateRole', 'UpdateRole', 'AspNetRoleClaims<string>', 12);
INSERT INTO public."AspNetRoleClaims" VALUES (91, '2', 'DeleteRole', 'DeleteRole', 'AspNetRoleClaims<string>', 12);
INSERT INTO public."AspNetRoleClaims" VALUES (92, '2', 'CreateOrder', 'CreateOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (93, '2', 'UpdateOrder', 'UpdateOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (94, '2', 'DeleteOrder', 'DeleteOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (95, '2', 'CreateProduct', 'CreateProduct', 'AspNetRoleClaims<string>', 14);
INSERT INTO public."AspNetRoleClaims" VALUES (96, '2', 'UpdateProduct', 'UpdateProduct', 'AspNetRoleClaims<string>', 14);
INSERT INTO public."AspNetRoleClaims" VALUES (97, '2', 'DeleteProduct', 'DeleteProduct', 'AspNetRoleClaims<string>', 14);
INSERT INTO public."AspNetRoleClaims" VALUES (98, '2', 'CreateQuestion', 'CreateQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (99, '2', 'UpdateQuestion', 'UpdateQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (100, '2', 'DeleteQuestion', 'DeleteQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (101, '2', 'CreateReply', 'CreateReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (102, '2', 'UpdateReply', 'UpdateReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (103, '2', 'DeleteReply', 'DeleteReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (104, '2', 'CreateReview', 'CreateReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (105, '2', 'UpdateReview', 'UpdateReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (106, '2', 'DeleteReview', 'DeleteReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (107, '2', 'CreateRoomSpace', 'CreateRoomSpace', 'AspNetRoleClaims<string>', 18);
INSERT INTO public."AspNetRoleClaims" VALUES (108, '2', 'UpdateRoomSpace', 'UpdateRoomSpace', 'AspNetRoleClaims<string>', 18);
INSERT INTO public."AspNetRoleClaims" VALUES (109, '2', 'DeleteRoomSpace', 'DeleteRoomSpace', 'AspNetRoleClaims<string>', 18);
INSERT INTO public."AspNetRoleClaims" VALUES (110, '2', 'CreateReport', 'CreateReport', 'AspNetRoleClaims<string>', 19);
INSERT INTO public."AspNetRoleClaims" VALUES (111, '3', 'CreateOrder', 'CreateOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (112, '3', 'UpdateOrder', 'UpdateOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (113, '3', 'DeleteOrder', 'DeleteOrder', 'AspNetRoleClaims<string>', 13);
INSERT INTO public."AspNetRoleClaims" VALUES (114, '3', 'CreateQuestion', 'CreateQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (115, '3', 'UpdateQuestion', 'UpdateQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (116, '3', 'DeleteQuestion', 'DeleteQuestion', 'AspNetRoleClaims<string>', 15);
INSERT INTO public."AspNetRoleClaims" VALUES (117, '3', 'CreateReply', 'CreateReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (118, '3', 'UpdateReply', 'UpdateReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (119, '3', 'DeleteReply', 'DeleteReply', 'AspNetRoleClaims<string>', 16);
INSERT INTO public."AspNetRoleClaims" VALUES (120, '3', 'CreateReview', 'CreateReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (121, '3', 'UpdateReview', 'UpdateReview', 'AspNetRoleClaims<string>', 17);
INSERT INTO public."AspNetRoleClaims" VALUES (122, '3', 'DeleteReview', 'DeleteReview', 'AspNetRoleClaims<string>', 17);


--
-- TOC entry 3794 (class 0 OID 16390)
-- Dependencies: 216
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AspNetRoles" VALUES ('1', 'Owner', 'OWNER', NULL);
INSERT INTO public."AspNetRoles" VALUES ('2', 'Staff', 'STAFF', NULL);
INSERT INTO public."AspNetRoles" VALUES ('3', 'Customer', 'CUSTOMER', NULL);
INSERT INTO public."AspNetRoles" VALUES ('4', 'Shipper', 'SHIPPER', NULL);


--
-- TOC entry 3796 (class 0 OID 16398)
-- Dependencies: 218
-- Data for Name: AspNetTypeClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AspNetTypeClaims" VALUES (1, 'ManageUser');
INSERT INTO public."AspNetTypeClaims" VALUES (2, 'ManageBrand');
INSERT INTO public."AspNetTypeClaims" VALUES (3, 'ManageCategory');
INSERT INTO public."AspNetTypeClaims" VALUES (4, 'ManageColor');
INSERT INTO public."AspNetTypeClaims" VALUES (5, 'ManageCoupon');
INSERT INTO public."AspNetTypeClaims" VALUES (6, 'ManageCustomer');
INSERT INTO public."AspNetTypeClaims" VALUES (7, 'ManageDesigner');
INSERT INTO public."AspNetTypeClaims" VALUES (8, 'ManageFurnitureType');
INSERT INTO public."AspNetTypeClaims" VALUES (9, 'ManageMaterial');
INSERT INTO public."AspNetTypeClaims" VALUES (10, 'ManageMaterialType');
INSERT INTO public."AspNetTypeClaims" VALUES (11, 'ManageNotification');
INSERT INTO public."AspNetTypeClaims" VALUES (12, 'ManageRole');
INSERT INTO public."AspNetTypeClaims" VALUES (13, 'ManageOrder');
INSERT INTO public."AspNetTypeClaims" VALUES (14, 'ManageProduct');
INSERT INTO public."AspNetTypeClaims" VALUES (15, 'ManageQuestion');
INSERT INTO public."AspNetTypeClaims" VALUES (16, 'ManageReply');
INSERT INTO public."AspNetTypeClaims" VALUES (17, 'ManageReview');
INSERT INTO public."AspNetTypeClaims" VALUES (18, 'ManageRoomSpace');
INSERT INTO public."AspNetTypeClaims" VALUES (19, 'ManageReport');


--
-- TOC entry 3804 (class 0 OID 16452)
-- Dependencies: 226
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AspNetUserClaims" VALUES (1, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateUser', 'CreateUser');
INSERT INTO public."AspNetUserClaims" VALUES (2, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateUser', 'UpdateUser');
INSERT INTO public."AspNetUserClaims" VALUES (3, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteUser', 'DeleteUser');
INSERT INTO public."AspNetUserClaims" VALUES (4, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateBrand', 'CreateBrand');
INSERT INTO public."AspNetUserClaims" VALUES (5, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateBrand', 'UpdateBrand');
INSERT INTO public."AspNetUserClaims" VALUES (6, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteBrand', 'DeleteBrand');
INSERT INTO public."AspNetUserClaims" VALUES (7, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateCategory', 'CreateCategory');
INSERT INTO public."AspNetUserClaims" VALUES (8, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateCategory', 'UpdateCategory');
INSERT INTO public."AspNetUserClaims" VALUES (9, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteCategory', 'DeleteCategory');
INSERT INTO public."AspNetUserClaims" VALUES (10, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateColor', 'CreateColor');
INSERT INTO public."AspNetUserClaims" VALUES (11, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateColor', 'UpdateColor');
INSERT INTO public."AspNetUserClaims" VALUES (12, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteColor', 'DeleteColor');
INSERT INTO public."AspNetUserClaims" VALUES (13, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateCoupon', 'CreateCoupon');
INSERT INTO public."AspNetUserClaims" VALUES (14, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateCoupon', 'UpdateCoupon');
INSERT INTO public."AspNetUserClaims" VALUES (15, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteCoupon', 'DeleteCoupon');
INSERT INTO public."AspNetUserClaims" VALUES (16, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateCustomer', 'CreateCustomer');
INSERT INTO public."AspNetUserClaims" VALUES (17, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateCustomer', 'UpdateCustomer');
INSERT INTO public."AspNetUserClaims" VALUES (18, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteCustomer', 'DeleteCustomer');
INSERT INTO public."AspNetUserClaims" VALUES (19, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateDesigner', 'CreateDesigner');
INSERT INTO public."AspNetUserClaims" VALUES (20, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateDesigner', 'UpdateDesigner');
INSERT INTO public."AspNetUserClaims" VALUES (21, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteDesigner', 'DeleteDesigner');
INSERT INTO public."AspNetUserClaims" VALUES (22, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateFurnitureType', 'CreateFurnitureType');
INSERT INTO public."AspNetUserClaims" VALUES (23, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateFurnitureType', 'UpdateFurnitureType');
INSERT INTO public."AspNetUserClaims" VALUES (24, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteFurnitureType', 'DeleteFurnitureType');
INSERT INTO public."AspNetUserClaims" VALUES (25, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateMaterial', 'CreateMaterial');
INSERT INTO public."AspNetUserClaims" VALUES (26, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateMaterial', 'UpdateMaterial');
INSERT INTO public."AspNetUserClaims" VALUES (27, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteMaterial', 'DeleteMaterial');
INSERT INTO public."AspNetUserClaims" VALUES (28, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateMaterialType', 'CreateMaterialType');
INSERT INTO public."AspNetUserClaims" VALUES (29, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateMaterialType', 'UpdateMaterialType');
INSERT INTO public."AspNetUserClaims" VALUES (30, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteMaterialType', 'DeleteMaterialType');
INSERT INTO public."AspNetUserClaims" VALUES (31, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateNotification', 'CreateNotification');
INSERT INTO public."AspNetUserClaims" VALUES (32, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateNotification', 'UpdateNotification');
INSERT INTO public."AspNetUserClaims" VALUES (33, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteNotification', 'DeleteNotification');
INSERT INTO public."AspNetUserClaims" VALUES (34, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateRole', 'CreateRole');
INSERT INTO public."AspNetUserClaims" VALUES (35, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateRole', 'UpdateRole');
INSERT INTO public."AspNetUserClaims" VALUES (36, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteRole', 'DeleteRole');
INSERT INTO public."AspNetUserClaims" VALUES (37, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateOrder', 'CreateOrder');
INSERT INTO public."AspNetUserClaims" VALUES (38, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateOrder', 'UpdateOrder');
INSERT INTO public."AspNetUserClaims" VALUES (39, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteOrder', 'DeleteOrder');
INSERT INTO public."AspNetUserClaims" VALUES (40, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateProduct', 'CreateProduct');
INSERT INTO public."AspNetUserClaims" VALUES (41, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateProduct', 'UpdateProduct');
INSERT INTO public."AspNetUserClaims" VALUES (42, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteProduct', 'DeleteProduct');
INSERT INTO public."AspNetUserClaims" VALUES (43, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateQuestion', 'CreateQuestion');
INSERT INTO public."AspNetUserClaims" VALUES (44, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateQuestion', 'UpdateQuestion');
INSERT INTO public."AspNetUserClaims" VALUES (45, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteQuestion', 'DeleteQuestion');
INSERT INTO public."AspNetUserClaims" VALUES (46, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateReply', 'CreateReply');
INSERT INTO public."AspNetUserClaims" VALUES (47, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateReply', 'UpdateReply');
INSERT INTO public."AspNetUserClaims" VALUES (48, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteReply', 'DeleteReply');
INSERT INTO public."AspNetUserClaims" VALUES (49, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateReview', 'CreateReview');
INSERT INTO public."AspNetUserClaims" VALUES (50, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateReview', 'UpdateReview');
INSERT INTO public."AspNetUserClaims" VALUES (51, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteReview', 'DeleteReview');
INSERT INTO public."AspNetUserClaims" VALUES (52, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateRoomSpace', 'CreateRoomSpace');
INSERT INTO public."AspNetUserClaims" VALUES (53, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'UpdateRoomSpace', 'UpdateRoomSpace');
INSERT INTO public."AspNetUserClaims" VALUES (54, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'DeleteRoomSpace', 'DeleteRoomSpace');
INSERT INTO public."AspNetUserClaims" VALUES (55, '74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'CreateReport', 'CreateReport');


--
-- TOC entry 3805 (class 0 OID 16459)
-- Dependencies: 227
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3806 (class 0 OID 16466)
-- Dependencies: 228
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AspNetUserRoles" VALUES ('74f658d4-79b0-46c5-b88e-be076f4b6fc9', '1');


--
-- TOC entry 3808 (class 0 OID 16485)
-- Dependencies: 230
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3807 (class 0 OID 16478)
-- Dependencies: 229
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."AspNetUsers" VALUES ('74f658d4-79b0-46c5-b88e-be076f4b6fc9', 'Root Administrator', NULL, NULL, false, false, 'Owner', 'sonle102003@gmail.com', 'SONLE102003@GMAIL.COM', 'sonle102003@gmail.com', 'SONLE102003@GMAIL.COM', false, 'AQAAAAIAAYagAAAAEJ82MHh6t/mVW09r5U8omSNhPRGhwMU0DTpoDZxQ6vUwPnU0cJUgxJDUKQtfj/zJiA==', 'DCH7FPQFPS5HTFWF5EAFPWJLV7RAYERS', 'e5d6f530-5fd7-4175-ae0b-d90366b33675', NULL, false, false, NULL, true, 0);


--
-- TOC entry 3812 (class 0 OID 16538)
-- Dependencies: 234
-- Data for Name: Asset; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3813 (class 0 OID 16545)
-- Dependencies: 235
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3809 (class 0 OID 16497)
-- Dependencies: 231
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cart" VALUES ('f4f11fa8-3624-4ccc-b661-1794d26f209d', '74f658d4-79b0-46c5-b88e-be076f4b6fc9');


--
-- TOC entry 3822 (class 0 OID 16678)
-- Dependencies: 244
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3797 (class 0 OID 16405)
-- Dependencies: 219
-- Data for Name: Color; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3814 (class 0 OID 16557)
-- Dependencies: 236
-- Data for Name: Coupon; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3815 (class 0 OID 16569)
-- Dependencies: 237
-- Data for Name: Designer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3824 (class 0 OID 16717)
-- Dependencies: 246
-- Data for Name: Favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3820 (class 0 OID 16644)
-- Dependencies: 242
-- Data for Name: FurnitureType; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3798 (class 0 OID 16412)
-- Dependencies: 220
-- Data for Name: ImportInvoice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3831 (class 0 OID 16847)
-- Dependencies: 253
-- Data for Name: ImportItem; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3816 (class 0 OID 16581)
-- Dependencies: 238
-- Data for Name: Material; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3799 (class 0 OID 16419)
-- Dependencies: 221
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3818 (class 0 OID 16605)
-- Dependencies: 240
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3825 (class 0 OID 16734)
-- Dependencies: 247
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3821 (class 0 OID 16661)
-- Dependencies: 243
-- Data for Name: OrderStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3823 (class 0 OID 16695)
-- Dependencies: 245
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3826 (class 0 OID 16766)
-- Dependencies: 248
-- Data for Name: ProductDesigner; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3827 (class 0 OID 16781)
-- Dependencies: 249
-- Data for Name: ProductMaterial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3828 (class 0 OID 16796)
-- Dependencies: 250
-- Data for Name: ProductVariant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3829 (class 0 OID 16813)
-- Dependencies: 251
-- Data for Name: Question; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3832 (class 0 OID 16862)
-- Dependencies: 254
-- Data for Name: Reply; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3830 (class 0 OID 16830)
-- Dependencies: 252
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3817 (class 0 OID 16593)
-- Dependencies: 239
-- Data for Name: RoomSpace; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RoomSpace" VALUES ('cbd697c3-e938-4bd5-82bc-5be9bed087f4', 'abv', NULL, NULL, '2025-06-08 16:06:58.096124', '2025-06-08 16:06:58.096303', NULL, NULL, false, NULL);


--
-- TOC entry 3810 (class 0 OID 16509)
-- Dependencies: 232
-- Data for Name: Token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3811 (class 0 OID 16521)
-- Dependencies: 233
-- Data for Name: UserNotification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3819 (class 0 OID 16627)
-- Dependencies: 241
-- Data for Name: UserUsedCoupon; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3793 (class 0 OID 16385)
-- Dependencies: 215
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."__EFMigrationsHistory" VALUES ('20250531111451_InitDb', '8.0.8');


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 274
-- Name: aggregatedcounter_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.aggregatedcounter_id_seq', 1, false);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 256
-- Name: counter_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.counter_id_seq', 1, false);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 258
-- Name: hash_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.hash_id_seq', 9, true);


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 260
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.job_id_seq', 1, true);


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 271
-- Name: jobparameter_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.jobparameter_id_seq', 4, true);


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 264
-- Name: jobqueue_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.jobqueue_id_seq', 1, true);


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 266
-- Name: list_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.list_id_seq', 1, false);


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 269
-- Name: set_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.set_id_seq', 2, true);


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 262
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: hangfire; Owner: postgres
--

SELECT pg_catalog.setval('hangfire.state_id_seq', 2, true);


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 222
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AspNetRoleClaims_Id_seq"', 123, false);


--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 217
-- Name: AspNetTypeClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AspNetTypeClaims_Id_seq"', 20, false);


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 225
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AspNetUserClaims_Id_seq"', 55, true);


--
-- TOC entry 3589 (class 2606 OID 17278)
-- Name: aggregatedcounter aggregatedcounter_key_key; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.aggregatedcounter
    ADD CONSTRAINT aggregatedcounter_key_key UNIQUE (key);


--
-- TOC entry 3591 (class 2606 OID 17276)
-- Name: aggregatedcounter aggregatedcounter_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.aggregatedcounter
    ADD CONSTRAINT aggregatedcounter_pkey PRIMARY KEY (id);


--
-- TOC entry 3551 (class 2606 OID 17112)
-- Name: counter counter_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.counter
    ADD CONSTRAINT counter_pkey PRIMARY KEY (id);


--
-- TOC entry 3555 (class 2606 OID 17247)
-- Name: hash hash_key_field_key; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.hash
    ADD CONSTRAINT hash_key_field_key UNIQUE (key, field);


--
-- TOC entry 3557 (class 2606 OID 17121)
-- Name: hash hash_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.hash
    ADD CONSTRAINT hash_pkey PRIMARY KEY (id);


--
-- TOC entry 3563 (class 2606 OID 17131)
-- Name: job job_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 3585 (class 2606 OID 17181)
-- Name: jobparameter jobparameter_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.jobparameter
    ADD CONSTRAINT jobparameter_pkey PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 17204)
-- Name: jobqueue jobqueue_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.jobqueue
    ADD CONSTRAINT jobqueue_pkey PRIMARY KEY (id);


--
-- TOC entry 3574 (class 2606 OID 17224)
-- Name: list list_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.list
    ADD CONSTRAINT list_pkey PRIMARY KEY (id);


--
-- TOC entry 3587 (class 2606 OID 17103)
-- Name: lock lock_resource_key; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.lock
    ADD CONSTRAINT lock_resource_key UNIQUE (resource);

ALTER TABLE ONLY hangfire.lock REPLICA IDENTITY USING INDEX lock_resource_key;


--
-- TOC entry 3549 (class 2606 OID 16982)
-- Name: schema schema_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.schema
    ADD CONSTRAINT schema_pkey PRIMARY KEY (version);


--
-- TOC entry 3576 (class 2606 OID 17250)
-- Name: server server_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.server
    ADD CONSTRAINT server_pkey PRIMARY KEY (id);


--
-- TOC entry 3580 (class 2606 OID 17252)
-- Name: set set_key_value_key; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.set
    ADD CONSTRAINT set_key_value_key UNIQUE (key, value);


--
-- TOC entry 3582 (class 2606 OID 17233)
-- Name: set set_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.set
    ADD CONSTRAINT set_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 17158)
-- Name: state state_pkey; Type: CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- TOC entry 3440 (class 2606 OID 16450)
-- Name: Address PK_Address; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "PK_Address" PRIMARY KEY ("Id");


--
-- TOC entry 3437 (class 2606 OID 16433)
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- TOC entry 3424 (class 2606 OID 16396)
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- TOC entry 3427 (class 2606 OID 16404)
-- Name: AspNetTypeClaims PK_AspNetTypeClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetTypeClaims"
    ADD CONSTRAINT "PK_AspNetTypeClaims" PRIMARY KEY ("Id");


--
-- TOC entry 3443 (class 2606 OID 16458)
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- TOC entry 3446 (class 2606 OID 16465)
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- TOC entry 3449 (class 2606 OID 16472)
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 3456 (class 2606 OID 16491)
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- TOC entry 3453 (class 2606 OID 16484)
-- Name: AspNetUsers PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- TOC entry 3470 (class 2606 OID 16544)
-- Name: Asset PK_Asset; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asset"
    ADD CONSTRAINT "PK_Asset" PRIMARY KEY ("Id");


--
-- TOC entry 3473 (class 2606 OID 16551)
-- Name: Brand PK_Brand; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "PK_Brand" PRIMARY KEY ("Id");


--
-- TOC entry 3459 (class 2606 OID 16503)
-- Name: Cart PK_Cart; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "PK_Cart" PRIMARY KEY ("Id");


--
-- TOC entry 3506 (class 2606 OID 16684)
-- Name: Category PK_Category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "PK_Category" PRIMARY KEY ("Id");


--
-- TOC entry 3429 (class 2606 OID 16411)
-- Name: Color PK_Color; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "PK_Color" PRIMARY KEY ("Id");


--
-- TOC entry 3477 (class 2606 OID 16563)
-- Name: Coupon PK_Coupon; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Coupon"
    ADD CONSTRAINT "PK_Coupon" PRIMARY KEY ("Id");


--
-- TOC entry 3480 (class 2606 OID 16575)
-- Name: Designer PK_Designer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Designer"
    ADD CONSTRAINT "PK_Designer" PRIMARY KEY ("Id");


--
-- TOC entry 3514 (class 2606 OID 16723)
-- Name: Favorite PK_Favorite; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "PK_Favorite" PRIMARY KEY ("UserId", "ProductId");


--
-- TOC entry 3498 (class 2606 OID 16650)
-- Name: FurnitureType PK_FurnitureType; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FurnitureType"
    ADD CONSTRAINT "PK_FurnitureType" PRIMARY KEY ("Id");


--
-- TOC entry 3431 (class 2606 OID 16418)
-- Name: ImportInvoice PK_ImportInvoice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ImportInvoice"
    ADD CONSTRAINT "PK_ImportInvoice" PRIMARY KEY ("Id");


--
-- TOC entry 3542 (class 2606 OID 16851)
-- Name: ImportItem PK_ImportItem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ImportItem"
    ADD CONSTRAINT "PK_ImportItem" PRIMARY KEY ("ProductVariantId", "ImportInvoiceId");


--
-- TOC entry 3483 (class 2606 OID 16587)
-- Name: Material PK_Material; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Material"
    ADD CONSTRAINT "PK_Material" PRIMARY KEY ("Id");


--
-- TOC entry 3433 (class 2606 OID 16425)
-- Name: Notification PK_Notification; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "PK_Notification" PRIMARY KEY ("Id");


--
-- TOC entry 3491 (class 2606 OID 16611)
-- Name: Order PK_Order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "PK_Order" PRIMARY KEY ("Id");


--
-- TOC entry 3521 (class 2606 OID 16740)
-- Name: OrderItem PK_OrderItem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "PK_OrderItem" PRIMARY KEY ("Id");


--
-- TOC entry 3502 (class 2606 OID 16667)
-- Name: OrderStatus PK_OrderStatus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderStatus"
    ADD CONSTRAINT "PK_OrderStatus" PRIMARY KEY ("Id");


--
-- TOC entry 3511 (class 2606 OID 16701)
-- Name: Product PK_Product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "PK_Product" PRIMARY KEY ("Id");


--
-- TOC entry 3524 (class 2606 OID 16770)
-- Name: ProductDesigner PK_ProductDesigner; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDesigner"
    ADD CONSTRAINT "PK_ProductDesigner" PRIMARY KEY ("DesignerId", "ProductId");


--
-- TOC entry 3527 (class 2606 OID 16785)
-- Name: ProductMaterial PK_ProductMaterial; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductMaterial"
    ADD CONSTRAINT "PK_ProductMaterial" PRIMARY KEY ("MaterialId", "ProductId");


--
-- TOC entry 3531 (class 2606 OID 16802)
-- Name: ProductVariant PK_ProductVariant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductVariant"
    ADD CONSTRAINT "PK_ProductVariant" PRIMARY KEY ("Id");


--
-- TOC entry 3535 (class 2606 OID 16819)
-- Name: Question PK_Question; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "PK_Question" PRIMARY KEY ("Id");


--
-- TOC entry 3547 (class 2606 OID 16868)
-- Name: Reply PK_Reply; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reply"
    ADD CONSTRAINT "PK_Reply" PRIMARY KEY ("Id");


--
-- TOC entry 3539 (class 2606 OID 16836)
-- Name: Review PK_Review; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "PK_Review" PRIMARY KEY ("Id");


--
-- TOC entry 3486 (class 2606 OID 16599)
-- Name: RoomSpace PK_RoomSpace; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoomSpace"
    ADD CONSTRAINT "PK_RoomSpace" PRIMARY KEY ("Id");


--
-- TOC entry 3462 (class 2606 OID 16515)
-- Name: Token PK_Token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "PK_Token" PRIMARY KEY ("Id");


--
-- TOC entry 3465 (class 2606 OID 16527)
-- Name: UserNotification PK_UserNotification; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserNotification"
    ADD CONSTRAINT "PK_UserNotification" PRIMARY KEY ("NotificationId", "UserId");


--
-- TOC entry 3494 (class 2606 OID 16633)
-- Name: UserUsedCoupon PK_UserUsedCoupon; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserUsedCoupon"
    ADD CONSTRAINT "PK_UserUsedCoupon" PRIMARY KEY ("UserId", "CouponId");


--
-- TOC entry 3422 (class 2606 OID 16389)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 3552 (class 1259 OID 17279)
-- Name: ix_hangfire_counter_expireat; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_counter_expireat ON hangfire.counter USING btree (expireat);


--
-- TOC entry 3553 (class 1259 OID 17241)
-- Name: ix_hangfire_counter_key; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_counter_key ON hangfire.counter USING btree (key);


--
-- TOC entry 3558 (class 1259 OID 17280)
-- Name: ix_hangfire_hash_expireat; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_hash_expireat ON hangfire.hash USING btree (expireat);


--
-- TOC entry 3559 (class 1259 OID 17281)
-- Name: ix_hangfire_job_expireat; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_job_expireat ON hangfire.job USING btree (expireat);


--
-- TOC entry 3560 (class 1259 OID 17248)
-- Name: ix_hangfire_job_statename; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_job_statename ON hangfire.job USING btree (statename);


--
-- TOC entry 3561 (class 1259 OID 17316)
-- Name: ix_hangfire_job_statename_is_not_null; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_job_statename_is_not_null ON hangfire.job USING btree (statename) INCLUDE (id) WHERE (statename IS NOT NULL);


--
-- TOC entry 3583 (class 1259 OID 17253)
-- Name: ix_hangfire_jobparameter_jobidandname; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_jobparameter_jobidandname ON hangfire.jobparameter USING btree (jobid, name);


--
-- TOC entry 3567 (class 1259 OID 17315)
-- Name: ix_hangfire_jobqueue_fetchedat_queue_jobid; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_jobqueue_fetchedat_queue_jobid ON hangfire.jobqueue USING btree (fetchedat NULLS FIRST, queue, jobid);


--
-- TOC entry 3568 (class 1259 OID 17213)
-- Name: ix_hangfire_jobqueue_jobidandqueue; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_jobqueue_jobidandqueue ON hangfire.jobqueue USING btree (jobid, queue);


--
-- TOC entry 3569 (class 1259 OID 17282)
-- Name: ix_hangfire_jobqueue_queueandfetchedat; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_jobqueue_queueandfetchedat ON hangfire.jobqueue USING btree (queue, fetchedat);


--
-- TOC entry 3572 (class 1259 OID 17284)
-- Name: ix_hangfire_list_expireat; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_list_expireat ON hangfire.list USING btree (expireat);


--
-- TOC entry 3577 (class 1259 OID 17285)
-- Name: ix_hangfire_set_expireat; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_set_expireat ON hangfire.set USING btree (expireat);


--
-- TOC entry 3578 (class 1259 OID 17267)
-- Name: ix_hangfire_set_key_score; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_set_key_score ON hangfire.set USING btree (key, score);


--
-- TOC entry 3564 (class 1259 OID 17166)
-- Name: ix_hangfire_state_jobid; Type: INDEX; Schema: hangfire; Owner: postgres
--

CREATE INDEX ix_hangfire_state_jobid ON hangfire.state USING btree (jobid);


--
-- TOC entry 3450 (class 1259 OID 16891)
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "EmailIndex" ON public."AspNetUsers" USING btree ("NormalizedEmail");


--
-- TOC entry 3438 (class 1259 OID 16884)
-- Name: IX_Address_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Address_UserId" ON public."Address" USING btree ("UserId");


--
-- TOC entry 3434 (class 1259 OID 16885)
-- Name: IX_AspNetRoleClaims_AspNetTypeClaimsId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetRoleClaims_AspNetTypeClaimsId" ON public."AspNetRoleClaims" USING btree ("AspNetTypeClaimsId");


--
-- TOC entry 3435 (class 1259 OID 16886)
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON public."AspNetRoleClaims" USING btree ("RoleId");


--
-- TOC entry 3441 (class 1259 OID 16888)
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON public."AspNetUserClaims" USING btree ("UserId");


--
-- TOC entry 3444 (class 1259 OID 16889)
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON public."AspNetUserLogins" USING btree ("UserId");


--
-- TOC entry 3447 (class 1259 OID 16890)
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON public."AspNetUserRoles" USING btree ("RoleId");


--
-- TOC entry 3451 (class 1259 OID 16892)
-- Name: IX_AspNetUsers_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_AspNetUsers_AssetId" ON public."AspNetUsers" USING btree ("AssetId");


--
-- TOC entry 3466 (class 1259 OID 16894)
-- Name: IX_Asset_OrderStatusId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Asset_OrderStatusId" ON public."Asset" USING btree ("OrderStatusId");


--
-- TOC entry 3467 (class 1259 OID 16895)
-- Name: IX_Asset_ProductVariantId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Asset_ProductVariantId" ON public."Asset" USING btree ("ProductVariantId");


--
-- TOC entry 3468 (class 1259 OID 16896)
-- Name: IX_Asset_ReviewId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Asset_ReviewId" ON public."Asset" USING btree ("ReviewId");


--
-- TOC entry 3471 (class 1259 OID 16897)
-- Name: IX_Brand_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Brand_AssetId" ON public."Brand" USING btree ("AssetId");


--
-- TOC entry 3457 (class 1259 OID 16898)
-- Name: IX_Cart_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Cart_UserId" ON public."Cart" USING btree ("UserId");


--
-- TOC entry 3503 (class 1259 OID 16899)
-- Name: IX_Category_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Category_AssetId" ON public."Category" USING btree ("AssetId");


--
-- TOC entry 3504 (class 1259 OID 16900)
-- Name: IX_Category_FurnitureTypeId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Category_FurnitureTypeId" ON public."Category" USING btree ("FurnitureTypeId");


--
-- TOC entry 3474 (class 1259 OID 16901)
-- Name: IX_Coupon_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Coupon_AssetId" ON public."Coupon" USING btree ("AssetId");


--
-- TOC entry 3475 (class 1259 OID 16902)
-- Name: IX_Coupon_Code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Coupon_Code" ON public."Coupon" USING btree ("Code");


--
-- TOC entry 3478 (class 1259 OID 16903)
-- Name: IX_Designer_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Designer_AssetId" ON public."Designer" USING btree ("AssetId");


--
-- TOC entry 3512 (class 1259 OID 16904)
-- Name: IX_Favorite_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Favorite_ProductId" ON public."Favorite" USING btree ("ProductId");


--
-- TOC entry 3495 (class 1259 OID 16905)
-- Name: IX_FurnitureType_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_FurnitureType_AssetId" ON public."FurnitureType" USING btree ("AssetId");


--
-- TOC entry 3496 (class 1259 OID 16906)
-- Name: IX_FurnitureType_RoomSpaceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_FurnitureType_RoomSpaceId" ON public."FurnitureType" USING btree ("RoomSpaceId");


--
-- TOC entry 3540 (class 1259 OID 16907)
-- Name: IX_ImportItem_ImportInvoiceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ImportItem_ImportInvoiceId" ON public."ImportItem" USING btree ("ImportInvoiceId");


--
-- TOC entry 3481 (class 1259 OID 16908)
-- Name: IX_Material_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Material_AssetId" ON public."Material" USING btree ("AssetId");


--
-- TOC entry 3515 (class 1259 OID 16912)
-- Name: IX_OrderItem_CartId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderItem_CartId" ON public."OrderItem" USING btree ("CartId");


--
-- TOC entry 3516 (class 1259 OID 16913)
-- Name: IX_OrderItem_ColorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderItem_ColorId" ON public."OrderItem" USING btree ("ColorId");


--
-- TOC entry 3517 (class 1259 OID 16914)
-- Name: IX_OrderItem_OrderId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderItem_OrderId" ON public."OrderItem" USING btree ("OrderId");


--
-- TOC entry 3518 (class 1259 OID 16915)
-- Name: IX_OrderItem_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderItem_ProductId" ON public."OrderItem" USING btree ("ProductId");


--
-- TOC entry 3519 (class 1259 OID 16916)
-- Name: IX_OrderItem_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderItem_UserId" ON public."OrderItem" USING btree ("UserId");


--
-- TOC entry 3499 (class 1259 OID 16917)
-- Name: IX_OrderStatus_OrderId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderStatus_OrderId" ON public."OrderStatus" USING btree ("OrderId");


--
-- TOC entry 3500 (class 1259 OID 16918)
-- Name: IX_OrderStatus_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_OrderStatus_UserId" ON public."OrderStatus" USING btree ("UserId");


--
-- TOC entry 3487 (class 1259 OID 16909)
-- Name: IX_Order_AddressId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Order_AddressId" ON public."Order" USING btree ("AddressId");


--
-- TOC entry 3488 (class 1259 OID 16910)
-- Name: IX_Order_CouponId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Order_CouponId" ON public."Order" USING btree ("CouponId");


--
-- TOC entry 3489 (class 1259 OID 16911)
-- Name: IX_Order_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Order_UserId" ON public."Order" USING btree ("UserId");


--
-- TOC entry 3522 (class 1259 OID 16922)
-- Name: IX_ProductDesigner_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ProductDesigner_ProductId" ON public."ProductDesigner" USING btree ("ProductId");


--
-- TOC entry 3525 (class 1259 OID 16923)
-- Name: IX_ProductMaterial_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ProductMaterial_ProductId" ON public."ProductMaterial" USING btree ("ProductId");


--
-- TOC entry 3528 (class 1259 OID 16924)
-- Name: IX_ProductVariant_ColorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ProductVariant_ColorId" ON public."ProductVariant" USING btree ("ColorId");


--
-- TOC entry 3529 (class 1259 OID 16925)
-- Name: IX_ProductVariant_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ProductVariant_ProductId" ON public."ProductVariant" USING btree ("ProductId");


--
-- TOC entry 3507 (class 1259 OID 16919)
-- Name: IX_Product_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Product_AssetId" ON public."Product" USING btree ("AssetId");


--
-- TOC entry 3508 (class 1259 OID 16920)
-- Name: IX_Product_BrandId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Product_BrandId" ON public."Product" USING btree ("BrandId");


--
-- TOC entry 3509 (class 1259 OID 16921)
-- Name: IX_Product_CategoryId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Product_CategoryId" ON public."Product" USING btree ("CategoryId");


--
-- TOC entry 3532 (class 1259 OID 16926)
-- Name: IX_Question_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Question_ProductId" ON public."Question" USING btree ("ProductId");


--
-- TOC entry 3533 (class 1259 OID 16927)
-- Name: IX_Question_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Question_UserId" ON public."Question" USING btree ("UserId");


--
-- TOC entry 3543 (class 1259 OID 16928)
-- Name: IX_Reply_QuestionId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Reply_QuestionId" ON public."Reply" USING btree ("QuestionId");


--
-- TOC entry 3544 (class 1259 OID 16929)
-- Name: IX_Reply_ReviewId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Reply_ReviewId" ON public."Reply" USING btree ("ReviewId");


--
-- TOC entry 3545 (class 1259 OID 16930)
-- Name: IX_Reply_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Reply_UserId" ON public."Reply" USING btree ("UserId");


--
-- TOC entry 3536 (class 1259 OID 16931)
-- Name: IX_Review_ProductId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Review_ProductId" ON public."Review" USING btree ("ProductId");


--
-- TOC entry 3537 (class 1259 OID 16932)
-- Name: IX_Review_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Review_UserId" ON public."Review" USING btree ("UserId");


--
-- TOC entry 3484 (class 1259 OID 16933)
-- Name: IX_RoomSpace_AssetId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_RoomSpace_AssetId" ON public."RoomSpace" USING btree ("AssetId");


--
-- TOC entry 3460 (class 1259 OID 16934)
-- Name: IX_Token_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Token_UserId" ON public."Token" USING btree ("UserId");


--
-- TOC entry 3463 (class 1259 OID 16935)
-- Name: IX_UserNotification_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserNotification_UserId" ON public."UserNotification" USING btree ("UserId");


--
-- TOC entry 3492 (class 1259 OID 16936)
-- Name: IX_UserUsedCoupon_CouponId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserUsedCoupon_CouponId" ON public."UserUsedCoupon" USING btree ("CouponId");


--
-- TOC entry 3425 (class 1259 OID 16887)
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RoleNameIndex" ON public."AspNetRoles" USING btree ("NormalizedName");


--
-- TOC entry 3454 (class 1259 OID 16893)
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserNameIndex" ON public."AspNetUsers" USING btree ("NormalizedUserName");


--
-- TOC entry 3650 (class 2606 OID 17190)
-- Name: jobparameter jobparameter_jobid_fkey; Type: FK CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.jobparameter
    ADD CONSTRAINT jobparameter_jobid_fkey FOREIGN KEY (jobid) REFERENCES hangfire.job(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3649 (class 2606 OID 17167)
-- Name: state state_jobid_fkey; Type: FK CONSTRAINT; Schema: hangfire; Owner: postgres
--

ALTER TABLE ONLY hangfire.state
    ADD CONSTRAINT state_jobid_fkey FOREIGN KEY (jobid) REFERENCES hangfire.job(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3594 (class 2606 OID 16937)
-- Name: Address FK_Address_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "FK_Address_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3592 (class 2606 OID 16434)
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 3593 (class 2606 OID 16439)
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetTypeClaims_AspNetTypeClaimsId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetTypeClaims_AspNetTypeClaimsId" FOREIGN KEY ("AspNetTypeClaimsId") REFERENCES public."AspNetTypeClaims"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3595 (class 2606 OID 16942)
-- Name: AspNetUserClaims FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3596 (class 2606 OID 16947)
-- Name: AspNetUserLogins FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3597 (class 2606 OID 16473)
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 3598 (class 2606 OID 16952)
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3600 (class 2606 OID 16492)
-- Name: AspNetUserTokens FK_AspNetUserTokens_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3599 (class 2606 OID 16957)
-- Name: AspNetUsers FK_AspNetUsers_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "FK_AspNetUsers_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3605 (class 2606 OID 16962)
-- Name: Asset FK_Asset_OrderStatus_OrderStatusId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asset"
    ADD CONSTRAINT "FK_Asset_OrderStatus_OrderStatusId" FOREIGN KEY ("OrderStatusId") REFERENCES public."OrderStatus"("Id");


--
-- TOC entry 3606 (class 2606 OID 16967)
-- Name: Asset FK_Asset_ProductVariant_ProductVariantId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asset"
    ADD CONSTRAINT "FK_Asset_ProductVariant_ProductVariantId" FOREIGN KEY ("ProductVariantId") REFERENCES public."ProductVariant"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3607 (class 2606 OID 16972)
-- Name: Asset FK_Asset_Review_ReviewId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asset"
    ADD CONSTRAINT "FK_Asset_Review_ReviewId" FOREIGN KEY ("ReviewId") REFERENCES public."Review"("Id") ON DELETE CASCADE;


--
-- TOC entry 3608 (class 2606 OID 16552)
-- Name: Brand FK_Brand_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "FK_Brand_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3601 (class 2606 OID 16504)
-- Name: Cart FK_Cart_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "FK_Cart_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3622 (class 2606 OID 16685)
-- Name: Category FK_Category_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "FK_Category_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3623 (class 2606 OID 16690)
-- Name: Category FK_Category_FurnitureType_FurnitureTypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "FK_Category_FurnitureType_FurnitureTypeId" FOREIGN KEY ("FurnitureTypeId") REFERENCES public."FurnitureType"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3609 (class 2606 OID 16564)
-- Name: Coupon FK_Coupon_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Coupon"
    ADD CONSTRAINT "FK_Coupon_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3610 (class 2606 OID 16576)
-- Name: Designer FK_Designer_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Designer"
    ADD CONSTRAINT "FK_Designer_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3627 (class 2606 OID 16724)
-- Name: Favorite FK_Favorite_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "FK_Favorite_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3628 (class 2606 OID 16729)
-- Name: Favorite FK_Favorite_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "FK_Favorite_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3618 (class 2606 OID 16651)
-- Name: FurnitureType FK_FurnitureType_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FurnitureType"
    ADD CONSTRAINT "FK_FurnitureType_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3619 (class 2606 OID 16656)
-- Name: FurnitureType FK_FurnitureType_RoomSpace_RoomSpaceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FurnitureType"
    ADD CONSTRAINT "FK_FurnitureType_RoomSpace_RoomSpaceId" FOREIGN KEY ("RoomSpaceId") REFERENCES public."RoomSpace"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3644 (class 2606 OID 16852)
-- Name: ImportItem FK_ImportItem_ImportInvoice_ImportInvoiceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ImportItem"
    ADD CONSTRAINT "FK_ImportItem_ImportInvoice_ImportInvoiceId" FOREIGN KEY ("ImportInvoiceId") REFERENCES public."ImportInvoice"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3645 (class 2606 OID 16857)
-- Name: ImportItem FK_ImportItem_ProductVariant_ProductVariantId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ImportItem"
    ADD CONSTRAINT "FK_ImportItem_ProductVariant_ProductVariantId" FOREIGN KEY ("ProductVariantId") REFERENCES public."ProductVariant"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3611 (class 2606 OID 16588)
-- Name: Material FK_Material_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Material"
    ADD CONSTRAINT "FK_Material_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3629 (class 2606 OID 16741)
-- Name: OrderItem FK_OrderItem_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "FK_OrderItem_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3630 (class 2606 OID 16746)
-- Name: OrderItem FK_OrderItem_Cart_CartId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "FK_OrderItem_Cart_CartId" FOREIGN KEY ("CartId") REFERENCES public."Cart"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3631 (class 2606 OID 16751)
-- Name: OrderItem FK_OrderItem_Color_ColorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "FK_OrderItem_Color_ColorId" FOREIGN KEY ("ColorId") REFERENCES public."Color"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3632 (class 2606 OID 16756)
-- Name: OrderItem FK_OrderItem_Order_OrderId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "FK_OrderItem_Order_OrderId" FOREIGN KEY ("OrderId") REFERENCES public."Order"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3633 (class 2606 OID 16761)
-- Name: OrderItem FK_OrderItem_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "FK_OrderItem_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3620 (class 2606 OID 16668)
-- Name: OrderStatus FK_OrderStatus_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderStatus"
    ADD CONSTRAINT "FK_OrderStatus_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id");


--
-- TOC entry 3621 (class 2606 OID 16673)
-- Name: OrderStatus FK_OrderStatus_Order_OrderId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderStatus"
    ADD CONSTRAINT "FK_OrderStatus_Order_OrderId" FOREIGN KEY ("OrderId") REFERENCES public."Order"("Id") ON DELETE CASCADE;


--
-- TOC entry 3613 (class 2606 OID 16612)
-- Name: Order FK_Order_Address_AddressId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "FK_Order_Address_AddressId" FOREIGN KEY ("AddressId") REFERENCES public."Address"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3614 (class 2606 OID 16617)
-- Name: Order FK_Order_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "FK_Order_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3615 (class 2606 OID 16622)
-- Name: Order FK_Order_Coupon_CouponId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "FK_Order_Coupon_CouponId" FOREIGN KEY ("CouponId") REFERENCES public."Coupon"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3634 (class 2606 OID 16771)
-- Name: ProductDesigner FK_ProductDesigner_Designer_DesignerId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDesigner"
    ADD CONSTRAINT "FK_ProductDesigner_Designer_DesignerId" FOREIGN KEY ("DesignerId") REFERENCES public."Designer"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3635 (class 2606 OID 16776)
-- Name: ProductDesigner FK_ProductDesigner_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductDesigner"
    ADD CONSTRAINT "FK_ProductDesigner_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3636 (class 2606 OID 16786)
-- Name: ProductMaterial FK_ProductMaterial_Material_MaterialId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductMaterial"
    ADD CONSTRAINT "FK_ProductMaterial_Material_MaterialId" FOREIGN KEY ("MaterialId") REFERENCES public."Material"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3637 (class 2606 OID 16791)
-- Name: ProductMaterial FK_ProductMaterial_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductMaterial"
    ADD CONSTRAINT "FK_ProductMaterial_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3638 (class 2606 OID 16803)
-- Name: ProductVariant FK_ProductVariant_Color_ColorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductVariant"
    ADD CONSTRAINT "FK_ProductVariant_Color_ColorId" FOREIGN KEY ("ColorId") REFERENCES public."Color"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3639 (class 2606 OID 16808)
-- Name: ProductVariant FK_ProductVariant_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductVariant"
    ADD CONSTRAINT "FK_ProductVariant_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3624 (class 2606 OID 16702)
-- Name: Product FK_Product_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "FK_Product_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3625 (class 2606 OID 16707)
-- Name: Product FK_Product_Brand_BrandId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "FK_Product_Brand_BrandId" FOREIGN KEY ("BrandId") REFERENCES public."Brand"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3626 (class 2606 OID 16712)
-- Name: Product FK_Product_Category_CategoryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "FK_Product_Category_CategoryId" FOREIGN KEY ("CategoryId") REFERENCES public."Category"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3640 (class 2606 OID 16820)
-- Name: Question FK_Question_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "FK_Question_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3641 (class 2606 OID 16825)
-- Name: Question FK_Question_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "FK_Question_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3646 (class 2606 OID 16869)
-- Name: Reply FK_Reply_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reply"
    ADD CONSTRAINT "FK_Reply_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3647 (class 2606 OID 16874)
-- Name: Reply FK_Reply_Question_QuestionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reply"
    ADD CONSTRAINT "FK_Reply_Question_QuestionId" FOREIGN KEY ("QuestionId") REFERENCES public."Question"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3648 (class 2606 OID 16879)
-- Name: Reply FK_Reply_Review_ReviewId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reply"
    ADD CONSTRAINT "FK_Reply_Review_ReviewId" FOREIGN KEY ("ReviewId") REFERENCES public."Review"("Id") ON DELETE SET NULL;


--
-- TOC entry 3642 (class 2606 OID 16837)
-- Name: Review FK_Review_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "FK_Review_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3643 (class 2606 OID 16842)
-- Name: Review FK_Review_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "FK_Review_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3612 (class 2606 OID 16600)
-- Name: RoomSpace FK_RoomSpace_Asset_AssetId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoomSpace"
    ADD CONSTRAINT "FK_RoomSpace_Asset_AssetId" FOREIGN KEY ("AssetId") REFERENCES public."Asset"("Id");


--
-- TOC entry 3602 (class 2606 OID 16516)
-- Name: Token FK_Token_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "FK_Token_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 3603 (class 2606 OID 16528)
-- Name: UserNotification FK_UserNotification_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserNotification"
    ADD CONSTRAINT "FK_UserNotification_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3604 (class 2606 OID 16533)
-- Name: UserNotification FK_UserNotification_Notification_NotificationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserNotification"
    ADD CONSTRAINT "FK_UserNotification_Notification_NotificationId" FOREIGN KEY ("NotificationId") REFERENCES public."Notification"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3616 (class 2606 OID 16634)
-- Name: UserUsedCoupon FK_UserUsedCoupon_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserUsedCoupon"
    ADD CONSTRAINT "FK_UserUsedCoupon_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- TOC entry 3617 (class 2606 OID 16639)
-- Name: UserUsedCoupon FK_UserUsedCoupon_Coupon_CouponId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserUsedCoupon"
    ADD CONSTRAINT "FK_UserUsedCoupon_Coupon_CouponId" FOREIGN KEY ("CouponId") REFERENCES public."Coupon"("Id") ON DELETE RESTRICT;


-- Completed on 2025-06-09 13:58:00 UTC

--
-- PostgreSQL database dump complete
--

