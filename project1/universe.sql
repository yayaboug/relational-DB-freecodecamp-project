--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    age_in_bill_years integer,
    galaxy_type character varying(60),
    distance_from_earth_in_light_years integer
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
-- Name: has_life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.has_life (
    has_life_id integer NOT NULL,
    name character varying(30) NOT NULL,
    life_ressources text,
    type_object character varying(30) NOT NULL,
    reference integer,
    life_status character varying(30),
    associated_planet character varying(30)
);


ALTER TABLE public.has_life OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.has_life_has_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.has_life_has_life_id_seq OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.has_life_has_life_id_seq OWNED BY public.has_life.has_life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size_in_km integer NOT NULL,
    rotation_period_in_days integer,
    visited_by_human boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    n_moons integer,
    rotation_in_days numeric(8,2),
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    size text,
    is_alive boolean,
    galaxy_id integer NOT NULL,
    age integer
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
-- Name: has_life has_life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life ALTER COLUMN has_life_id SET DEFAULT nextval('public.has_life_has_life_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System', 14, 'Spiral', 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way', 10, 'Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller companion to the Andromeda Galaxy', 6, 'Spiral', 2723000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Home to the first-ever imaged black hole', 13, 'Elliptical', 53500000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Hosts a classic example of a spiral galaxy', 9, 'Spiral', 23200000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Known for its prominent bulge and dust lane', 9, 'Spiral', 28000000);


--
-- Data for Name: has_life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.has_life VALUES (1, 'Earth', 'Water, Atmosphere, Nutrients', 'Planet', 3, 'Yes', '-');
INSERT INTO public.has_life VALUES (2, 'Mars', 'Water (in past), Atmosphere (thin), Potential underground water/ice', 'Planet', 4, 'Potential', '-');
INSERT INTO public.has_life VALUES (3, 'Europa', 'Subsurface ocean, Heat from tidal forces', 'Moon', 7, 'Potential', 'Jupiter');
INSERT INTO public.has_life VALUES (4, 'Titan', 'Atmosphere (nitrogen, methane), Liquid methane lakes', 'Moon', 8, 'Potential', 'Saturn');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s natural satellite', 1737, 27, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars''s innermost and larger moon', 11, 7, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars''s outermost and smaller moon', 6, 30, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon of Jupiter', 5262, 7, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Second largest moon of Jupiter', 4820, 16, false, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Innermost of the four Galilean moons of Jupiter', 3643, 1, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Second Galilean moon of Jupiter', 3121, 3, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 5150, 15, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second largest moon of Saturn', 1528, 4, false, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 'Third largest moon of Saturn', 1122, 2, false, 6);
INSERT INTO public.moon VALUES (11, 'Triton', 'Largest moon of Neptune', 1352, 5, false, 7);
INSERT INTO public.moon VALUES (12, 'Charon', 'Largest moon of Pluto', 606, 6, false, 9);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Moon of Saturn', 106, 550, false, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Third largest natural satellite of Saturn', 1468, 79, false, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Moon of Uranus', 235, 1, false, 8);
INSERT INTO public.moon VALUES (16, 'Hyperion', 'Irregularly shaped moon of Saturn', 133, 13, false, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Moon of Uranus', 578, 2, false, 8);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Moon of Uranus', 584, 4, false, 8);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Moon of Saturn', 1062, 1, false, 6);
INSERT INTO public.moon VALUES (20, 'Enceladus', 'Moon of Saturn', 504, 1, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun, rocky and cratered', 0, 88.00, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Known for its thick atmosphere of carbon dioxide', 0, 225.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet to support life', 1, 365.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, with iron oxide-rich soil', 2, 687.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, famous for its Great Red Spot', 79, 4333.60, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its extensive ring system', 82, 10759.50, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Tilted on its side, appears to roll along its orbit', 27, 30687.20, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Named after the Roman god of the sea', 14, 60190.90, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper Belt', 5, 90560.40, 4);
INSERT INTO public.planet VALUES (10, 'Europa', 'One of Jupiter''s moons, with an icy surface', 0, 671072.30, 4);
INSERT INTO public.planet VALUES (11, 'Titan', 'Saturn''s largest moon, with a thick atmosphere', 1, 788400.10, 6);
INSERT INTO public.planet VALUES (12, 'Io', 'Jupiter''s moon, known for its volcanic activity', 0, 152853.80, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our Solar Systems central star', 'G-type main-sequence', true, 1, 4);
INSERT INTO public.star VALUES (2, 'M31P', 'A blue supergiant, one of the galaxy''s brightest', 'Supergiant', true, 2, 10);
INSERT INTO public.star VALUES (3, 'Beta Trianguli', 'A binary star system, composed of two main-sequence stars', 'Main-sequence', true, 3, 3);
INSERT INTO public.star VALUES (4, 'M87*', 'A supermassive black hole at the galaxy''s center', 'Supermassive', false, 4, NULL);
INSERT INTO public.star VALUES (5, 'Whirlpool Star', 'A young star found in the spiral arms of the galaxy', 'Variable', true, 5, 10);
INSERT INTO public.star VALUES (6, 'Sombrero Star', 'A red giant star within the galaxy''s bulge', 'Red Giant', true, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.has_life_has_life_id_seq', 4, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: has_life has_life_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_const UNIQUE (name);


--
-- Name: has_life has_life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_pkey PRIMARY KEY (has_life_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_const UNIQUE (name);


--
-- Name: star unique_const_2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_const_2 UNIQUE (name);


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