-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.candidates
(
    id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL,
    identity_number character varying(11) NOT NULL,
    birth_year integer NOT NULL,
    is_active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL,
    is_active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_titles
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 1247483647 CACHE 1 ),
    title character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.system_user_confirm_employers
(
    id integer NOT NULL,
    employer_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.system_user_confirms
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 1247483647 CACHE 1 ),
    system_user_id integer NOT NULL,
    is_confirmed boolean NOT NULL,
    confirm_date date,
    PRIMARY KEY (id)
);

CREATE TABLE public.system_users
(
    id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 1247483647 CACHE 1 ),
    email character varying(320) NOT NULL,
    password character varying(25) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification_code_candidates
(
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification_code_employers
(
    id integer NOT NULL,
    employers_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.verification_codes
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 1247483647 CACHE 1 ),
    code character varying(38) NOT NULL,
    is_verified boolean NOT NULL,
    verified_date date,
    PRIMARY KEY (id)
);

ALTER TABLE public.candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.system_user_confirm_employers
    ADD FOREIGN KEY (id)
    REFERENCES public.system_user_confirms (id)
    NOT VALID;


ALTER TABLE public.system_user_confirm_employers
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.system_user_confirms
    ADD FOREIGN KEY (system_user_id)
    REFERENCES public.system_users (id)
    NOT VALID;


ALTER TABLE public.system_users
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.verification_code_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.verification_code_candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.verification_codes (id)
    NOT VALID;


ALTER TABLE public.verification_code_employers
    ADD FOREIGN KEY (employers_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.verification_code_employers
    ADD FOREIGN KEY (id)
    REFERENCES public.verification_codes (id)
    NOT VALID;

END;