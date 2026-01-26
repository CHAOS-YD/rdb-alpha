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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    inner_radius_in_au numeric NOT NULL,
    outer_radius_in_au numeric NOT NULL,
    estimated_number_of_asteroids integer NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(100) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    diameter_in_light_years numeric,
    has_life boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    notes text
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    orbital_period_in_days numeric NOT NULL,
    has_water boolean NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_details text
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    diameter_in_km integer NOT NULL,
    orbital_period_in_days numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(100) NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    is_spherical boolean NOT NULL,
    mass_relative_to_sun numeric NOT NULL
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Fascia Principale', 1, 2.1, 3.3, 1000000);
INSERT INTO public.asteroid_belt VALUES (2, 'Fascia di Kuiper', 1, 30, 50, 100000);
INSERT INTO public.asteroid_belt VALUES (3, 'Fascia di Vega', 5, 2.5, 4.0, 500000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lattea', 'Spirale', 13600, 105700, true, 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spirale', 10000, 220000, true, 2537000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangolo', 'Spirale', 3000, 60000, false, 3000000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Mulinello', 'Spirale', 4000, 76000, false, 31000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spirale', 13200, 50000, false, 29000000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Girandola', 'Spirale', 21000, 170000, true, 21000000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3475, 27.3, true, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, false, false, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, false, false, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, false, true, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, true, true, NULL);
INSERT INTO public.moon VALUES (6, 'Ganimede', 5, 5268, 7.15, true, true, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, true, true, NULL);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396, 0.94, false, true, NULL);
INSERT INTO public.moon VALUES (9, 'Encelado', 6, 504, 1.37, true, true, NULL);
INSERT INTO public.moon VALUES (10, 'Tetide', 6, 1062, 1.89, false, true, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, 2.74, false, true, NULL);
INSERT INTO public.moon VALUES (12, 'Rea', 6, 1528, 4.52, false, true, NULL);
INSERT INTO public.moon VALUES (13, 'Titano', 6, 5149, 15.95, true, true, NULL);
INSERT INTO public.moon VALUES (14, 'Giapeto', 6, 1470, 79.33, false, true, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, 1.41, false, true, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, 2.52, false, true, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, 4.14, false, true, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1578, 8.71, false, true, NULL);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1523, 13.46, false, true, NULL);
INSERT INTO public.moon VALUES (20, 'Tritone', 8, 2707, 5.88, true, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 'Terrestre', false, false, 4879, 88);
INSERT INTO public.planet VALUES (2, 'Venere', 1, 'Terrestre', false, true, 12104, 225);
INSERT INTO public.planet VALUES (3, 'Terra', 1, 'Terrestre', true, true, 12756, 365);
INSERT INTO public.planet VALUES (4, 'Marte', 1, 'Terrestre', false, true, 6779, 687);
INSERT INTO public.planet VALUES (5, 'Giove', 1, 'Gigante Gassoso', false, true, 139820, 4333);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 'Gigante Gassoso', false, true, 116460, 10759);
INSERT INTO public.planet VALUES (7, 'Urano', 1, 'Gigante di Ghiaccio', false, true, 50724, 30687);
INSERT INTO public.planet VALUES (8, 'Nettuno', 1, 'Gigante di Ghiaccio', false, true, 49244, 60190);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 'Terrestre', false, true, 14800, 11.2);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 1, 'Super-Terra', true, true, 18640, 385);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 1, 'Terrestre', true, true, 18000, 13);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1, 'Giove Caldo', false, true, 169000, 3.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sole', 1, 'Tipo-G', 5778, true, 1.0);
INSERT INTO public.star VALUES (2, 'Sirio', 1, 'Tipo-A', 9940, true, 2.02);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Tipo-M', 3500, true, 11.6);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Tipo-M', 3042, true, 0.12);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Tipo-A', 9602, true, 2.135);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'Tipo-G', 5790, true, 1.1);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 3, true);


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
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

