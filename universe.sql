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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    black_hole_name character varying(15) NOT NULL,
    solar_masses integer,
    type character varying(20),
    is_spherical boolean,
    black_hole_radius_km integer NOT NULL,
    location character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(20) NOT NULL,
    galaxy_type character varying(20),
    description text,
    distance_from_earth integer,
    distance_from_center_in_lightyears integer,
    number_of_stars numeric,
    age_in_millions_of_years numeric NOT NULL
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
    moon_name character varying(15) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    moon_radius integer,
    moon_distance_from_planet integer NOT NULL,
    has_life boolean,
    description text
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
    planet_name character varying(15) NOT NULL,
    star_id integer,
    planet_type character varying(20),
    planet_mass integer NOT NULL,
    planet_radius integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    description text
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
    star_name character varying(20) NOT NULL,
    star_type character varying(20),
    has_life boolean,
    age_in_millions_of_years numeric NOT NULL,
    star_brightness integer NOT NULL,
    luminosity integer,
    temperature_k integer,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A', 4300000, 'Supermassive', true, 470000, 'Center of the Milky Way', 'The supermassive black hole at the center of the Milky Way.');
INSERT INTO public.black_hole VALUES (2, 'M87', 130000000, 'Supermassive', true, 170000000, 'Virgo Cluster', 'A supermassive black hole located at the center of the M87 galaxy.');
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 15, 'Stellar', true, 44, 'Cygnus constellation', 'A stellar black hole in the Cygnus constellation, the first black hole discovered.');
INSERT INTO public.black_hole VALUES (4, 'NGC 1277', 150000000, 'Supermassive', true, 2100000000, 'Perseus cluster', 'A supermassive black hole in the Perseus Cluster. ');
INSERT INTO public.black_hole VALUES (5, 'V404 Cygni', 12, 'Stellar', true, 35, 'Lyra constellation', 'A stellar-mass black hole located in the constellation of Cygnus.');
INSERT INTO public.black_hole VALUES (6, 'A0620-00', 7, 'Stellar', true, 19, 'Monoceros constellation', '');
INSERT INTO public.black_hole VALUES (7, 'IC 10 X-1', 15, 'Stellar', true, 44, 'IC 10 galaxy', '');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'A barred spiral galaxy, home to our solar system.', 0, 500000, 400000000000, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The closest spiral galaxy to the Milky Way.', 2500000, 110000, 1000000000000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 'A supermassive elliptical galaxy with an active black hole at its center.', 3000000, 120000, 1000000000000, 13000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 'Known for its bright central bulge and large dust lane.', 53000000, 25000, 800000000000, 10000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 'A beautiful spiral galaxy interacting with a smaller galaxy.', 55000000, 30000, 100000000000, 9000);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 'A smaller spiral galaxy, part of the Local Group.', 28000000, 30000, 40000000000, 12000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 1737, 384400, false, '');
INSERT INTO public.moon VALUES (2, 'Europa', 4, true, 1561, 670900, true, 'A frozen moon with an ocean beneath its surface, potentially harboring life.');
INSERT INTO public.moon VALUES (3, 'Ganymede', 4, true, 2631, 1070400, false, 'The largest moon in the solar system, with an icy surface and water beneath.');
INSERT INTO public.moon VALUES (4, 'Titan', 5, true, 2575, 1221878, false, 'A thick atmosphere and methane lakes, but no life known.');
INSERT INTO public.moon VALUES (5, 'Io', 4, true, 1821, 421800, false, 'The most geologically active moon in the solar system, with volcanic eruptions.');
INSERT INTO public.moon VALUES (6, 'Phobos', 2, true, 11, 9377, false, 'A small, irregular moon orbiting Mars.');
INSERT INTO public.moon VALUES (7, 'Deimos', 2, true, 6, 23460, false, 'Smaller than Phobos, this moon orbits Mars in a highly elliptical orbit.');
INSERT INTO public.moon VALUES (8, 'Callisto', 4, true, 2410, 1882700, false, 'A large moon with a heavily cratered surface.');
INSERT INTO public.moon VALUES (9, 'Triton', 7, true, 1353, 3547600, false, 'Largest moon of Neptune, featuring geysers.');
INSERT INTO public.moon VALUES (10, 'Rhea', 5, true, 765, 527108, false, 'Second-largest moon of Saturn with a thin atmosphere.');
INSERT INTO public.moon VALUES (11, 'Enceladus', 5, true, 252, 2380200, true, 'Known for its water geysers, hinting at subsurface oceans.');
INSERT INTO public.moon VALUES (12, 'Mimas', 5, true, 198, 1855200, false, 'Known as the Death Star moon due to a large crater.');
INSERT INTO public.moon VALUES (13, 'Miranda', 6, true, 235, 1294000, false, 'A moon of Uranus with some of the most extreme terrains of the solar system.');
INSERT INTO public.moon VALUES (14, 'Ariel', 6, true, 115, 1910000, false, 'Another moon of Uranus with an icy surface, featuring valleys and ridges.');
INSERT INTO public.moon VALUES (15, 'Umbriel', 6, true, 117, 2660000, false, 'A darker moon of Uranus, with a heavily cratered surface.');
INSERT INTO public.moon VALUES (16, 'Oberon', 6, true, 761, 5830000, false, 'The largest moon of Uranus, covered with craters and ice.');
INSERT INTO public.moon VALUES (17, 'Charon', 9, true, 180, 1500000, false, 'Largest moon of Pluto, almost the same size as Pluto.');
INSERT INTO public.moon VALUES (18, 'Iapetus', 4, true, 788, 4360000, false, 'A moon with a striking color contrast on its surface.');
INSERT INTO public.moon VALUES (19, 'Dione', 4, true, 170, 5520000, false, 'Moon of Saturn with a heavily cratered surface and bright ice cliffs.');
INSERT INTO public.moon VALUES (20, 'Tethys', 4, true, 420, 11700000, false, 'A small, icy moon of Saturn, known for its giant ring.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 6, 6371, true, true, 4500, 'The only known planet to support life.');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 1, 3389, false, true, 4600, 'Known for its red surface and potential for past life.');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 1898, 69911, false, true, 4600, 'A massive gas giant with a stormy atmosphere.');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 568, 58232, false, true, 4500, 'Famous for its large and beautiful ring system.');
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Terrestrial', 5, 6051, false, true, 4600, 'A hot and toxic atmosphere, similar in size to Earth.');
INSERT INTO public.planet VALUES (6, 'Neptune', 2, 'Ice Giant', 102, 24622, false, true, 4600, 'An icy planet with strong winds and a deep blue color.');
INSERT INTO public.planet VALUES (7, 'Kepler-452b', 2, 'Terrestrial', 2, 18000, true, true, 5000, 'A second Earth found in the habitable zone.');
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 2, 'Terrestrial', 87, 25362, true, true, 5000, 'Another planet in the habitable zone of its star.');
INSERT INTO public.planet VALUES (9, 'Uranus', 2, 'Ice Giant', 3, 15000, false, true, 4600, 'Known for its tilted rotation and cold, icy atmosphere.');
INSERT INTO public.planet VALUES (10, 'Mercury', 3, 'Terrestrial', 1, 12000, false, true, 4600, 'Closest planet to the Sun, with extreme temperatures.');
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 2, 'Terrestrial', 1, 18000, true, true, 7000, 'A potentially habitable exoplanet orbiting a red dwarf star.');
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 2, 'Terrestrial', 1, 16000, true, true, 6000, 'An exoplanet in the habitable zone of the closest star to Earth.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type Main Sequence', true, 4600, 10000, 1, 5778, 'The star at the center of our solar system.', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', false, 4500, 3000, 0, 5790, 'The closest star to Earth.', 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'A-type Main Sequence', false, 200, 35000, 25, 3500, 'The brightest star in Earth''s night sky.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', false, 10000, 50000, 10000, 3050, 'A massive star nearing the end of its life.', 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 'G-type Main Sequence', true, 6000, 8000, 2, 9940, 'The second closest star system to Earth.', 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A-type Main Sequence', false, 450, 12000, 40, 9600, 'A blue giant star in the Lyra constellation.', 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 7, true);


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
-- Name: black_hole black_hole_black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_black_hole_name_key UNIQUE (black_hole_name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

