pg_dump -cC --inserts -U freecodecamp universe > universe.sql--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

psql --username=freecodecamp --dbname=postgres

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    has_life boolean,
    age_in_mil_of_years numeric,
    dist_from_earth_in_ly integer,
    name character varying(60) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_stars (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40),
    galaxy_stars_id integer NOT NULL
);


ALTER TABLE public.galaxy_stars OWNER TO freecodecamp;

--
-- Name: galaxy_stars_galaxy_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_stars_galaxy_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_stars_galaxy_stars_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_stars_galaxy_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_stars_galaxy_stars_id_seq OWNED BY public.galaxy_stars.galaxy_stars_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_m integer NOT NULL,
    dist_from_p integer,
    has_oxygen boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(70) NOT NULL,
    age_p integer NOT NULL,
    dist_in_ly integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planets_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_moons (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(70),
    planets_moons_id integer NOT NULL
);


ALTER TABLE public.planets_moons OWNER TO freecodecamp;

--
-- Name: planets_moons_planets_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_moons_planets_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_moons_planets_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planets_moons_planets_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_moons_planets_moons_id_seq OWNED BY public.planets_moons.planets_moons_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age numeric NOT NULL,
    dist_in_ly integer,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: stars_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stars_planets (
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(60),
    stars_planets_id integer NOT NULL
);


ALTER TABLE public.stars_planets OWNER TO freecodecamp;

--
-- Name: stars_planets_stars_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_planets_stars_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_planets_stars_planets_id_seq OWNER TO freecodecamp;

--
-- Name: stars_planets_stars_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_planets_stars_planets_id_seq OWNED BY public.stars_planets.stars_planets_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_stars galaxy_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars ALTER COLUMN galaxy_stars_id SET DEFAULT nextval('public.galaxy_stars_galaxy_stars_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planets_moons planets_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons ALTER COLUMN planets_moons_id SET DEFAULT nextval('public.planets_moons_planets_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: stars_planets stars_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets ALTER COLUMN stars_planets_id SET DEFAULT nextval('public.stars_planets_stars_planets_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, true, 13.6, 26000, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, false, 2.5, 250000, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, false, 10600.5, 656000, 'Eye of God');
INSERT INTO public.galaxy VALUES (4, false, 11.01, 43000, 'Eye of Sauron');
INSERT INTO public.galaxy VALUES (5, false, 8.03, 13000, 'Medusa Merger');
INSERT INTO public.galaxy VALUES (6, false, 11.05, 110000, 'Sculptor');


--
-- Data for Name: galaxy_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_stars VALUES (1, 1, NULL, 1);
INSERT INTO public.galaxy_stars VALUES (2, 2, NULL, 2);
INSERT INTO public.galaxy_stars VALUES (3, 3, NULL, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Harambe', 34667, 3657, true, 1);
INSERT INTO public.moon VALUES (2, 'Caca', 34636756, 36534, false, 1);
INSERT INTO public.moon VALUES (3, 'Mi foame', 453647567, 3457, true, 1);
INSERT INTO public.moon VALUES (4, 'Dor', 32456, 2346, false, 2);
INSERT INTO public.moon VALUES (5, 'Bla', 3456, 24673, true, 2);
INSERT INTO public.moon VALUES (6, 'Bleah', 43568, 24357, false, 2);
INSERT INTO public.moon VALUES (7, 'Niu', 678, 4476, false, 3);
INSERT INTO public.moon VALUES (8, 'Nini', 3246, 32436, true, 3);
INSERT INTO public.moon VALUES (9, 'Kits', 436, 2436, false, 3);
INSERT INTO public.moon VALUES (10, 'Mickey', 32467, 23466, false, 4);
INSERT INTO public.moon VALUES (11, 'Minnie', 325, 3264, true, 4);
INSERT INTO public.moon VALUES (12, 'Luxemburg', 32457, 374, false, 4);
INSERT INTO public.moon VALUES (13, ' Italia', 324, 2346787, true, 5);
INSERT INTO public.moon VALUES (14, 'Espain', 2364, 24, false, 5);
INSERT INTO public.moon VALUES (15, 'Portugal', 324, 2634, false, 5);
INSERT INTO public.moon VALUES (16, 'Miilano', 3446, 264, true, 5);
INSERT INTO public.moon VALUES (17, 'Aries', 26457, 243745, true, 5);
INSERT INTO public.moon VALUES (18, 'Athena', 34457, 2436, false, 6);
INSERT INTO public.moon VALUES (19, 'Chiron', 2364, 356, true, 6);
INSERT INTO public.moon VALUES (20, 'Hades', 347, 3548, false, 6);
INSERT INTO public.moon VALUES (21, 'Pershephone', 347, 347, true, 6);
INSERT INTO public.moon VALUES (22, ' Poseidon', 23457, 3457, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 34566, 32456, false, 1);
INSERT INTO public.planet VALUES (2, 'MERCURY', 336585, 3445754, false, 1);
INSERT INTO public.planet VALUES (3, ' Venus', 365884, 45754, false, 2);
INSERT INTO public.planet VALUES (4, ' Jupiter', 8347896, 457436, false, 2);
INSERT INTO public.planet VALUES (5, ' Niagra Falss', 346658, 457568, false, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 3468, 34657, false, 3);
INSERT INTO public.planet VALUES (7, ' Oceania', 348765, 4578, true, 4);
INSERT INTO public.planet VALUES (8, 'Miguel', 35676857, 2467554, false, 4);
INSERT INTO public.planet VALUES (9, 'Reptilian', 24357, 37565, true, 5);
INSERT INTO public.planet VALUES (10, ' Pluto', 266875, 36844, false, 6);
INSERT INTO public.planet VALUES (11, 'Rabbit', 2568745, 357656, true, 6);
INSERT INTO public.planet VALUES (12, 'Paraguay', 43547867, 45754, true, 6);


--
-- Data for Name: planets_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_moons VALUES (1, 1, NULL, 1);
INSERT INTO public.planets_moons VALUES (2, 2, NULL, 2);
INSERT INTO public.planets_moons VALUES (3, 3, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Earth', 13.6, 1, 'planet home', 1);
INSERT INTO public.star VALUES (2, 'PA-99-N2', 2.5, 63000, 'not confirmed', 2);
INSERT INTO public.star VALUES (3, 'NGC 7293', 6.7, 45000, 'planetary nebula', 3);
INSERT INTO public.star VALUES (4, 'HR 4796A', 5.6, 674000, 'blackhole', 4);
INSERT INTO public.star VALUES (5, 'NGC 4194', 5.7, 4246760, 'const Ursa Major', 5);
INSERT INTO public.star VALUES (6, 'Wolf Rayet', 6.78, 246943, 'youngstar', 6);


--
-- Data for Name: stars_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stars_planets VALUES (1, 1, NULL, 1);
INSERT INTO public.stars_planets VALUES (2, 2, NULL, 2);
INSERT INTO public.stars_planets VALUES (3, 3, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_stars_galaxy_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_stars_galaxy_stars_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planets_moons_planets_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_moons_planets_moons_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: stars_planets_stars_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_planets_stars_planets_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_stars galaxy_stars_galaxy_stars_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_galaxy_stars_id_key UNIQUE (galaxy_stars_id);


--
-- Name: galaxy_stars galaxy_stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_name_key UNIQUE (name);


--
-- Name: galaxy_stars galaxy_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_pkey PRIMARY KEY (galaxy_stars_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planets_moons planets_moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_name_key UNIQUE (name);


--
-- Name: planets_moons planets_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_pkey PRIMARY KEY (planets_moons_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: stars_planets stars_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets
    ADD CONSTRAINT stars_planets_name_key UNIQUE (name);


--
-- Name: stars_planets stars_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets
    ADD CONSTRAINT stars_planets_pkey PRIMARY KEY (stars_planets_id);


--
-- Name: galaxy_stars galaxy_stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_stars galaxy_stars_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planets_moons planets_moons_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planets_moons planets_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_moons
    ADD CONSTRAINT planets_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: stars_planets stars_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets
    ADD CONSTRAINT stars_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: stars_planets stars_planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_planets
    ADD CONSTRAINT stars_planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

