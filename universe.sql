--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

--
-- Name: insert_star_if_not_exists(); Type: FUNCTION; Schema: public; Owner: freecodecamp
--

CREATE FUNCTION public.insert_star_if_not_exists() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN IF NOT EXISTS (SELECT 1 FROM star WHERE star_id = NEW.star_id) THEN INSERT INTO star (star_id) VALUES (NEW.star_id); END IF; RETURN NEW; END; $$;


ALTER FUNCTION public.insert_star_if_not_exists() OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    number_of_stars integer,
    number_of_planets integer,
    number_of_moons integer,
    distance_from_earth numeric
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    moon_mass numeric,
    moon_radius numeric,
    moon_temperature numeric,
    moon_surface_gravity numeric,
    moon_density numeric
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    planet_size integer,
    distance_from_star numeric,
    planet_description text,
    has_atmosphere boolean NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    satellite_mass numeric NOT NULL,
    satellite_radius numeric NOT NULL,
    satellite_temperature numeric NOT NULL,
    satellite_surface_gravity numeric NOT NULL,
    satellite_density numeric NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    star_age integer,
    is_binary_system boolean
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Elliptical', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'Irregular', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Sombrero', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Whirlpool', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Peculiar', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 'Spiral1', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (58, 'Moon', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (59, 'Deimos', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (60, 'Phobos', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (61, 'Ganymede', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (62, 'Callisto', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (63, 'Io', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (64, 'Europa', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (65, 'Titan', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (66, 'Enceladus', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (67, 'Mimas', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (68, 'Tethys', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (69, 'Dione', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (70, 'Rhea', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (71, 'Hyperion', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (72, 'Iapetus', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (73, 'Titania', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (74, 'Oberon', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (75, 'Umbriel', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (76, 'Ariel', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (78, 'Luna', 39, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (79, 'Charon', 39, 0.1, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Venus', 3, 12104, 108.2, 'A hot and inhospitable planet with a thick atmosphere', true);
INSERT INTO public.planet VALUES (30, 'Uranus', 6, 50724, 2872.5, 'An ice giant with a faint atmosphere and many moons', true);
INSERT INTO public.planet VALUES (31, 'Neptune', 7, 49532, 4495.1, 'An ice giant with a blue atmosphere and many moons', true);
INSERT INTO public.planet VALUES (32, 'Mercury', 8, 4879, 57.9, 'A rocky planet closest to the sun', false);
INSERT INTO public.planet VALUES (34, 'Mars', 10, 6792, 227.9, 'A red planet with a thin atmosphere', false);
INSERT INTO public.planet VALUES (35, 'Earth', 11, 12742, 149.6, 'A blue and green planet with a diverse biosphere', true);
INSERT INTO public.planet VALUES (36, 'Pluto', 12, 1187, 5906.4, 'A dwarf planet in the Kuiper Belt', false);
INSERT INTO public.planet VALUES (37, 'Europa', 13, 3122, 670.9, 'A moon of Jupiter with a subsurface ocean', false);
INSERT INTO public.planet VALUES (38, 'Enceladus', 14, 252, 238.9, 'A moon of Saturn with a subsurface ocean', false);
INSERT INTO public.planet VALUES (39, 'Titan', 15, 5152, 1221.8, 'A moon of Saturn with a thick atmosphere and lakes of liquid methane', false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4, 142984, 778.3, 'A gas giant with a massive atmosphere and many moons', true);
INSERT INTO public.planet VALUES (5, 'Saturn', 5, 116464, 1433.5, 'A gas giant with a distinctive ring system and many moons', true);
INSERT INTO public.planet VALUES (28, 'planet1', 4, 142984, 778.3, 'A gas giant with a massive atmosphere and many moons', true);
INSERT INTO public.planet VALUES (29, 'planet2', 5, 116464, 1433.5, 'A gas giant with a distinctive ring system and many moons', true);
INSERT INTO public.planet VALUES (41, 'planet3', 7, 49532, NULL, NULL, true);
INSERT INTO public.planet VALUES (33, 'Penus', 9, 12104, 108.2, 'A hot and inhospitable planet with a thick atmosphere', true);
INSERT INTO public.planet VALUES (1, 'Gaia', 1, 12742, 149.6, 'A blue and green planet with a diverse biosphere', true);
INSERT INTO public.planet VALUES (2, 'Aries', 2, 6792, 227.9, 'A red planet with a thin atmosphere', false);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Tethys', 5, 58, 0.1, 153, 500, 3, 5);
INSERT INTO public.satellite VALUES (2, 'satellite 3', 33, 59, 0.1, 153, 500, 3, 5);
INSERT INTO public.satellite VALUES (3, 'Tetris', 4, 64, 0.5, 160, 550, 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Westerlund 1-26', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'NGC 5253-V37', 5, NULL, NULL);
INSERT INTO public.star VALUES (11, 'R136a1', 1, 1500000, true);
INSERT INTO public.star VALUES (12, 'VY Canis Majoris', 2, 3000000, false);
INSERT INTO public.star VALUES (13, 'UY Scuti', 3, 5000000, true);
INSERT INTO public.star VALUES (6, 'Unknown', 6, NULL, NULL);
INSERT INTO public.star VALUES (7, 'STAR1', NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'STAR10', NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'STAR11', NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'STAR12', NULL, NULL, NULL);
INSERT INTO public.star VALUES (14, 'STAR13', NULL, NULL, NULL);
INSERT INTO public.star VALUES (15, 'pew pew', NULL, NULL, NULL);
INSERT INTO public.star VALUES (1, 'star1', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'star2', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'star3', 3, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 78, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 41, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: galaxy galaxy_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_key UNIQUE (galaxy_type);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key1 UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: planet insert_star_if_not_exists_trigger; Type: TRIGGER; Schema: public; Owner: freecodecamp
--

CREATE TRIGGER insert_star_if_not_exists_trigger BEFORE INSERT OR UPDATE ON public.planet FOR EACH ROW EXECUTE FUNCTION public.insert_star_if_not_exists();


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

