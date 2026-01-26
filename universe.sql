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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    orbital_period_in_years numeric NOT NULL,
    last_seen date NOT NULL,
    is_periodic boolean NOT NULL,
    description text NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_type character varying(100) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    diameter_in_light_years numeric,
    has_life boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text NOT NULL
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
    discovery_details text NOT NULL
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
    orbital_period_in_days numeric NOT NULL,
    composition text NOT NULL
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

INSERT INTO public.comet VALUES (1, 'Halley', 1, 75.3, '1986-01-01', true, 'Most famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2533, '1997-01-01', true, 'Very bright comet visible in 1997');
INSERT INTO public.comet VALUES (3, '67P/Churyumov-Gerasimenko', 1, 6.45, '2015-01-01', true, 'Comet visited by Rosetta spacecraft');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 105700, true, 0, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 220000, true, 2537000, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000, 60000, false, 3000000, 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 4000, 76000, false, 31000000, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13200, 50000, false, 29000000, 'Unusual spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000, 170000, true, 21000000, 'Face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, 27.3, true, true, 'Known since antiquity');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, false, false, 'Discovered in 1877 by Asaph Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, false, false, 'Discovered in 1877 by Asaph Hall');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, false, true, 'Discovered in 1610 by Galileo Galilei');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, true, true, 'Discovered in 1610 by Galileo Galilei');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.15, true, true, 'Discovered in 1610 by Galileo Galilei');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, true, true, 'Discovered in 1610 by Galileo Galilei');
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396, 0.94, false, true, 'Discovered in 1789 by William Herschel');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1.37, true, true, 'Discovered in 1789 by William Herschel');
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1062, 1.89, false, true, 'Discovered in 1684 by Giovanni Cassini');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, 2.74, false, true, 'Discovered in 1684 by Giovanni Cassini');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1528, 4.52, false, true, 'Discovered in 1672 by Giovanni Cassini');
INSERT INTO public.moon VALUES (13, 'Titan', 6, 5149, 15.95, true, true, 'Discovered in 1655 by Christiaan Huygens');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1470, 79.33, false, true, 'Discovered in 1671 by Giovanni Cassini');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, 1.41, false, true, 'Discovered in 1948 by Gerard Kuiper');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, 2.52, false, true, 'Discovered in 1851 by William Lassell');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, 4.14, false, true, 'Discovered in 1851 by William Lassell');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1578, 8.71, false, true, 'Discovered in 1787 by William Herschel');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1523, 13.46, false, true, 'Discovered in 1787 by William Herschel');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 5.88, true, true, 'Discovered in 1846 by William Lassell');
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, 360.14, false, false, 'Discovered in 1949 by Gerard Kuiper');
INSERT INTO public.moon VALUES (22, 'Charon', 9, 1212, 6.39, false, true, 'Discovered in 1978 by James Christy');
INSERT INTO public.moon VALUES (23, 'Hydra', 9, 51, 38.2, false, false, 'Discovered in 2005 by Hubble Telescope team');
INSERT INTO public.moon VALUES (24, 'Nix', 9, 42, 24.86, false, false, 'Discovered in 2005 by Hubble Telescope team');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, false, 4879, 88, 'Rocky with iron core');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 12104, 225, 'Rocky with thick CO2 atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 12756, 365, 'Rocky with liquid water');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 6779, 687, 'Rocky with thin atmosphere');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 139820, 4333, 'Mostly hydrogen and helium');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 116460, 10759, 'Hydrogen, helium with ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 50724, 30687, 'Icy with methane atmosphere');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 49244, 60190, 'Icy with strong winds');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 'Terrestrial', false, true, 14800, 11.2, 'Rocky exoplanet');
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 1, 'Super-Earth', true, true, 18640, 385, 'Earth-like exoplanet');
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 1, 'Terrestrial', true, true, 18000, 13, 'Potentially habitable exoplanet');
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1, 'Hot Jupiter', false, true, 169000, 3.5, 'Gas giant exoplanet');
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1d', 1, 'Terrestrial', true, true, 10500, 4.05, 'Small rocky exoplanet');
INSERT INTO public.planet VALUES (14, 'WASP-12b', 1, 'Hot Jupiter', false, true, 239000, 1.09, 'Very hot gas giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 5778, true, 1.0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 9940, true, 2.02);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M-type', 3500, true, 11.6);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M-type', 3042, true, 0.12);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A-type', 9602, true, 2.135);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'G-type', 5790, true, 1.1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


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
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

