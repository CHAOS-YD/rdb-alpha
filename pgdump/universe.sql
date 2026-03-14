--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    galaxy_types character varying(50),
    distance_from_earth numeric(10,2)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    moon_types character varying(50),
    distance_from_earth numeric(10,2)
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
    name character varying(100) NOT NULL,
    star_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(50),
    distance_from_earth numeric(10,2)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_types character varying(50),
    distance_from_earth numeric(10,2)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'Famous periodic comet', NULL, NULL);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Great comet of 1997', NULL, NULL);
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 'Comet of 2020', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', NULL, 13600, 'Spiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', NULL, 10000, 'Spiral', 2.50);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest local group galaxy', NULL, 1000, 'Spiral', 3.00);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Bode''s Galaxy', NULL, 13000, 'Spiral', 11.80);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Radio galaxy', NULL, 12000, 'Elliptical', 13.70);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Unusual galaxy', NULL, 13200, 'Spiral', 29.30);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earth''s moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Mars moon', NULL, false, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Mars moon', NULL, false, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 3, 'Jupiter moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Jupiter moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 'Jupiter moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'Jupiter moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Saturn moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 'Saturn moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Dione', 4, 'Saturn moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 'Saturn moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4, 'Saturn moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Mimas', 4, 'Saturn moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Miranda', 5, 'Uranus moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Ariel', 5, 'Uranus moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Umbriel', 5, 'Uranus moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Titania', 5, 'Uranus moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Oberon', 5, 'Uranus moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Triton', 6, 'Neptune moon', NULL, true, 4500, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Nereid', 6, 'Neptune moon', NULL, false, 4500, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Our planet', true, true, 4500, 'Terrestrial', 0.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Red planet', false, true, 4500, 'Terrestrial', 0.50);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas giant', false, true, 4500, 'Gas giant', 4.20);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Ringed planet', false, true, 4500, 'Gas giant', 8.50);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Ice giant', false, true, 4500, 'Ice giant', 18.20);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Ice giant', false, true, 4500, 'Ice giant', 29.10);
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, 'Exoplanet', false, true, 4850, 'Terrestrial', 4.24);
INSERT INTO public.planet VALUES (8, 'Proxima c', 2, 'Exoplanet', false, true, 4850, 'Terrestrial', 4.24);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 3, 'Hypothetical planet', false, true, 8, 'Gas giant', 642.50);
INSERT INTO public.planet VALUES (10, 'Vega b', 4, 'Exoplanet', false, true, 455, 'Terrestrial', 25.00);
INSERT INTO public.planet VALUES (11, 'Sirius b', 5, 'White dwarf companion', false, true, 200, 'Unknown', 8.60);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 6, 'Exoplanet', false, true, 5000, 'Terrestrial', 4.37);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our star', false, true, 4600, 'Yellow Dwarf', 0.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest star to the Sun', false, true, 4850, 'Red Dwarf', 4.24);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant in Orion', false, true, 8, 'Red Supergiant', 642.50);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'Bright star in Lyra', false, true, 455, 'White Dwarf', 25.00);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 'Brightest star', false, true, 200, 'White Dwarf', 8.60);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'Triple star system', false, true, 5000, 'Yellow Dwarf', 4.37);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

