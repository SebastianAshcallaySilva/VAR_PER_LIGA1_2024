--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Postgres.app)
-- Dumped by pg_dump version 16.3 (Postgres.app)

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
-- Name: decisions; Type: TABLE; Schema: public; Owner: sebastianashcallay
--

CREATE TABLE public.decisions (
    decision_id integer NOT NULL,
    type_id integer NOT NULL,
    game_id integer NOT NULL,
    home_id integer NOT NULL,
    away_id integer NOT NULL,
    home_goal_diff integer,
    away_goal_diff integer,
    home_red_diff integer,
    away_red_diff integer,
    round integer
);


ALTER TABLE public.decisions OWNER TO sebastianashcallay;

--
-- Name: decisions_decision_id_seq; Type: SEQUENCE; Schema: public; Owner: sebastianashcallay
--

CREATE SEQUENCE public.decisions_decision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.decisions_decision_id_seq OWNER TO sebastianashcallay;

--
-- Name: decisions_decision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebastianashcallay
--

ALTER SEQUENCE public.decisions_decision_id_seq OWNED BY public.decisions.decision_id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: sebastianashcallay
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    home_id integer NOT NULL,
    away_id integer NOT NULL,
    home_goals integer NOT NULL,
    away_goals integer NOT NULL,
    round integer,
    home_red integer,
    away_red integer
);


ALTER TABLE public.games OWNER TO sebastianashcallay;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: sebastianashcallay
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_game_id_seq OWNER TO sebastianashcallay;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebastianashcallay
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: sebastianashcallay
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL,
    points integer NOT NULL,
    goals_for integer,
    goals_against integer,
    wins integer,
    losses integer,
    draws integer
);


ALTER TABLE public.teams OWNER TO sebastianashcallay;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: sebastianashcallay
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_team_id_seq OWNER TO sebastianashcallay;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebastianashcallay
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: sebastianashcallay
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.types OWNER TO sebastianashcallay;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sebastianashcallay
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.types_type_id_seq OWNER TO sebastianashcallay;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebastianashcallay
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.type_id;


--
-- Name: decisions decision_id; Type: DEFAULT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.decisions ALTER COLUMN decision_id SET DEFAULT nextval('public.decisions_decision_id_seq'::regclass);


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: decisions; Type: TABLE DATA; Schema: public; Owner: sebastianashcallay
--

COPY public.decisions (decision_id, type_id, game_id, home_id, away_id, home_goal_diff, away_goal_diff, home_red_diff, away_red_diff, round) FROM stdin;
1	1	1	15	14	0	0	0	1	1
2	1	1	15	14	0	0	0	1	1
3	2	3	2	7	0	1	0	0	1
4	3	4	3	5	1	0	0	0	1
5	4	4	3	5	0	1	0	0	1
6	1	7	11	16	0	0	0	1	1
7	5	9	8	18	-1	0	0	0	1
8	5	10	7	15	-1	0	0	0	2
9	6	11	12	2	1	0	0	0	2
10	7	11	12	2	0	0	0	0	2
11	8	11	12	2	0	0	0	0	2
12	5	12	5	6	-1	0	0	0	2
13	9	12	5	6	0	0	0	0	2
14	2	13	18	17	0	1	0	0	2
15	10	14	1	11	0	0	1	0	2
16	11	14	1	11	0	-1	0	0	2
17	12	15	16	4	0	0	0	0	2
18	13	15	16	4	0	0	0	0	2
19	14	17	14	13	0	0	-1	0	2
20	6	19	15	12	1	0	0	0	3
21	4	20	6	3	0	1	0	0	3
22	11	21	2	16	0	-1	0	0	3
23	6	21	2	16	1	0	0	0	3
24	12	22	17	10	0	0	0	0	3
25	10	23	4	1	0	0	1	0	3
26	5	23	4	1	-1	0	0	0	3
27	15	24	8	5	0	0	0	-1	3
28	1	25	9	14	0	0	0	1	3
29	9	25	9	14	0	0	0	0	3
30	9	25	9	14	0	0	0	0	3
31	6	25	9	14	0	0	1	0	3
32	9	27	11	18	0	0	0	0	3
33	1	31	7	14	0	0	0	1	4
34	5	31	7	14	-1	0	0	0	4
35	5	31	7	14	-1	0	0	0	4
36	6	32	1	2	1	0	0	0	4
37	8	34	6	9	0	0	0	0	4
38	3	34	6	9	1	0	0	0	4
39	16	36	10	11	0	0	0	0	4
40	17	37	13	16	0	0	0	0	5
41	18	37	13	16	0	0	0	0	5
42	5	37	13	16	-1	0	0	0	5
43	10	38	9	7	0	0	1	0	5
44	3	40	2	18	1	0	0	0	5
45	2	41	17	3	0	1	0	0	5
46	16	42	11	5	0	0	0	0	5
47	12	42	11	5	0	0	0	0	5
48	9	46	16	14	0	0	0	0	6
49	3	46	16	14	1	0	0	0	6
50	1	46	16	14	0	0	0	1	6
51	19	48	1	13	0	0	0	-1	6
52	11	51	12	7	0	-1	0	0	6
53	10	51	12	7	0	0	1	0	6
54	2	53	6	17	0	1	0	0	6
55	4	56	15	10	0	1	0	0	7
56	4	56	15	10	0	1	0	0	7
57	20	56	15	10	0	0	0	0	7
58	4	57	14	1	0	1	0	0	7
59	3	57	14	1	1	0	0	0	7
60	11	59	2	5	0	-1	0	0	7
61	2	59	2	5	0	1	0	0	7
62	6	61	4	3	1	0	0	0	7
63	3	62	9	12	1	0	0	0	7
64	3	63	13	18	1	0	0	0	7
65	8	64	1	7	0	0	0	0	8
66	14	65	6	4	0	0	-1	0	8
67	1	65	6	4	0	0	0	1	8
68	16	66	3	2	0	0	0	0	8
69	16	67	16	12	0	0	0	0	8
70	7	69	17	9	0	0	0	0	8
71	10	71	8	11	0	0	1	0	8
72	6	72	5	15	1	0	0	0	8
73	7	72	5	15	0	0	0	0	8
74	5	72	5	15	-1	0	0	0	8
75	10	73	14	10	0	0	1	0	9
76	16	74	4	8	0	0	0	0	9
77	7	75	7	18	0	0	0	0	9
78	15	78	12	1	0	0	0	-1	9
79	9	79	13	5	0	0	0	0	9
80	6	81	15	3	1	0	0	0	9
81	10	84	8	2	0	0	1	0	10
82	6	85	18	12	1	0	0	0	10
83	2	86	17	4	0	1	0	0	10
84	17	87	6	15	0	0	0	0	10
85	4	87	6	15	0	1	0	0	10
86	5	89	3	13	-1	0	0	0	10
87	20	90	10	7	0	0	0	0	10
88	11	90	10	7	0	-1	0	0	10
89	6	92	16	18	1	0	0	0	11
90	11	94	9	1	0	-1	0	0	11
91	1	96	7	5	0	0	0	1	11
92	5	96	7	5	-1	0	0	0	11
93	10	97	4	11	0	0	1	0	11
94	1	97	4	11	0	0	0	1	11
95	19	98	15	8	0	0	0	-1	11
96	2	99	14	3	0	0	0	1	11
97	2	101	18	1	0	1	0	0	12
98	2	102	6	14	0	1	0	0	12
99	13	104	5	12	0	0	0	0	12
100	11	106	3	7	0	-1	0	0	12
101	14	111	15	11	0	0	-1	0	13
102	2	111	15	11	0	1	0	0	13
103	13	112	7	6	0	0	0	0	13
104	6	112	7	6	1	0	0	0	13
105	4	113	16	5	0	1	0	0	13
106	9	113	16	5	0	0	0	0	13
107	6	115	14	8	1	0	0	0	13
108	3	122	17	14	1	0	0	0	14
109	21	122	17	14	0	0	-1	0	14
110	1	123	10	18	0	0	0	1	14
111	7	123	10	18	0	0	0	0	14
112	4	123	10	18	0	1	0	0	14
113	12	124	3	16	0	0	0	0	14
114	2	125	2	9	0	1	0	0	14
115	16	126	11	13	0	0	0	0	14
116	6	127	18	5	1	0	0	0	15
117	10	128	9	10	0	0	1	0	15
118	5	129	7	17	-1	0	0	0	15
119	4	130	13	4	0	1	0	0	15
120	2	132	15	2	0	1	0	0	15
121	16	134	1	3	0	0	0	0	15
122	9	135	16	6	0	0	0	0	15
123	16	135	16	6	0	0	0	0	15
124	5	136	11	7	-1	0	0	0	16
125	6	136	11	7	1	0	0	0	16
126	13	143	15	9	0	0	0	0	16
127	16	144	6	1	0	0	0	0	16
128	5	146	12	11	-1	0	0	0	17
129	2	149	14	2	0	1	0	0	17
130	10	150	1	8	0	0	1	0	17
131	13	151	16	17	0	0	0	0	17
132	12	156	14	15	0	0	0	0	18
133	4	158	12	4	0	1	0	0	18
134	13	158	12	4	0	0	0	0	18
135	1	160	16	11	0	0	0	1	18
136	10	160	16	11	0	0	1	0	18
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: sebastianashcallay
--

COPY public.games (game_id, home_id, away_id, home_goals, away_goals, round, home_red, away_red) FROM stdin;
1	15	14	1	0	1	0	2
2	17	1	4	0	1	1	0
3	2	7	2	3	1	0	0
4	3	5	6	2	1	0	0
5	13	9	1	0	1	0	0
6	6	10	1	0	1	1	0
7	11	16	1	1	1	0	1
8	4	12	2	1	1	1	1
9	8	18	2	1	1	0	1
10	7	15	1	1	2	0	0
11	12	2	3	2	2	0	0
12	5	6	1	1	2	0	1
13	18	17	2	2	2	0	1
14	1	11	1	0	2	1	0
15	16	4	0	2	2	1	0
16	9	3	1	3	2	0	0
17	14	13	0	2	2	1	0
18	10	8	3	2	2	0	0
19	15	12	4	0	3	0	0
20	6	3	2	2	3	0	0
21	2	16	1	0	3	1	1
22	17	10	1	3	3	0	0
23	4	1	0	1	3	2	0
24	8	5	2	0	3	0	0
25	9	14	2	0	3	0	1
26	13	7	2	0	3	0	1
27	11	18	1	0	3	0	0
28	3	8	4	1	4	0	0
29	16	15	2	0	4	0	0
30	5	17	4	0	4	0	1
31	7	14	1	0	4	0	2
32	1	2	2	0	4	0	0
33	18	4	1	3	4	1	0
34	6	9	3	2	4	0	0
35	12	13	1	1	4	0	0
36	10	11	2	2	4	0	0
37	13	16	4	0	5	0	0
38	9	7	3	0	5	1	0
39	15	1	0	0	5	0	0
40	2	18	2	1	5	0	0
41	17	3	0	4	5	0	0
42	11	5	2	2	5	0	0
43	4	10	5	1	5	0	0
44	14	12	2	0	5	0	0
45	8	6	1	2	5	0	0
46	16	14	3	0	6	1	1
47	5	4	2	0	6	0	1
48	1	13	2	0	6	0	0
49	3	11	1	0	6	0	0
50	10	2	0	0	6	0	0
51	12	7	2	2	6	1	0
52	8	9	2	0	6	0	1
53	6	17	2	2	6	0	0
54	18	15	2	0	6	0	0
55	7	16	2	0	7	0	0
56	15	10	2	3	7	0	0
57	14	1	2	2	7	0	0
58	11	6	1	1	7	0	0
59	2	5	3	1	7	0	0
60	17	8	2	1	7	0	1
61	4	3	1	2	7	0	0
62	9	12	2	0	7	0	0
63	13	18	2	2	7	0	0
64	1	7	1	0	8	0	2
65	6	4	2	1	8	0	1
66	3	2	1	2	8	0	0
67	16	12	1	1	8	0	0
68	10	13	3	2	8	0	1
69	17	9	1	0	8	0	0
70	18	14	0	4	8	0	0
71	8	11	0	1	8	1	0
72	5	15	2	1	8	0	0
73	14	10	1	2	9	1	1
74	4	8	3	0	9	0	0
75	7	18	1	0	9	0	0
76	11	17	3	0	9	0	0
77	2	6	2	0	9	0	0
78	12	1	0	0	9	2	0
79	13	5	0	2	9	0	0
80	9	16	0	0	9	0	0
81	15	3	1	2	9	0	0
82	11	9	0	0	10	0	0
83	1	16	1	0	10	0	0
84	8	2	2	2	10	1	1
85	18	12	2	2	10	0	0
86	17	4	0	4	10	0	0
87	6	15	1	1	10	1	0
88	5	14	2	2	10	0	0
89	3	13	4	0	10	0	0
90	10	7	0	1	10	0	0
91	13	6	1	2	11	1	1
92	16	18	2	0	11	0	0
93	2	17	2	0	11	0	0
94	9	1	1	2	11	0	0
95	12	10	3	1	11	1	1
96	7	5	3	2	11	0	2
97	4	11	2	0	11	1	1
98	15	8	2	0	11	0	0
99	14	3	2	3	11	0	0
100	4	9	3	0	12	0	1
101	18	1	1	2	12	0	0
102	6	14	0	2	12	0	0
103	8	13	6	0	12	0	1
104	5	12	1	0	12	0	0
105	17	15	2	0	12	0	0
106	3	7	2	0	12	0	0
107	11	2	1	2	12	0	0
108	10	16	0	0	12	0	0
109	13	17	1	0	13	0	0
110	9	18	0	0	13	1	0
111	15	11	3	2	13	0	0
112	7	6	2	0	13	0	1
113	16	5	1	2	13	1	0
114	2	4	1	0	13	0	0
115	14	8	1	1	13	0	0
116	1	10	6	0	13	0	0
117	12	3	2	1	13	0	0
118	5	1	2	0	14	0	0
119	6	12	1	1	14	0	0
120	4	15	1	0	14	0	0
121	8	7	2	0	14	0	0
122	17	14	1	1	14	0	0
123	10	18	3	1	14	0	1
124	3	16	2	1	14	0	0
125	2	9	2	1	14	1	0
126	11	13	0	0	14	0	0
127	18	5	2	2	15	0	0
128	9	10	1	1	15	1	0
129	7	17	3	0	15	0	0
130	13	4	0	2	15	0	1
131	12	8	1	1	15	0	0
132	15	2	2	6	15	0	0
133	14	11	0	0	15	0	0
134	1	3	4	1	15	0	0
135	16	6	0	1	15	0	0
136	11	7	4	0	16	0	0
137	3	18	5	1	16	0	0
138	2	13	4	1	16	0	0
139	5	10	2	0	16	0	0
140	8	16	2	0	16	0	0
141	17	12	0	0	16	0	0
142	4	14	3	2	16	1	1
143	15	9	2	4	16	0	0
144	6	1	0	0	16	0	0
145	7	4	3	0	17	0	0
146	12	11	2	1	17	0	0
147	13	15	1	1	17	0	0
148	10	3	0	1	17	0	0
149	14	2	1	3	17	0	0
150	1	8	4	0	17	1	0
151	16	17	0	0	17	0	0
152	9	5	1	0	17	0	0
153	18	6	1	1	17	0	0
154	18	8	1	2	18	0	0
155	5	3	3	1	18	0	0
156	14	15	1	0	18	0	0
157	10	6	1	2	18	0	0
158	12	4	2	3	18	0	0
159	1	17	6	0	18	0	0
160	16	11	0	0	18	1	1
161	9	13	2	1	18	0	0
162	7	2	0	3	18	0	0
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: sebastianashcallay
--

COPY public.teams (team_id, name, points, goals_for, goals_against, wins, losses, draws) FROM stdin;
1	Universitario	43	38	7	13	1	4
2	FBC Melgar	41	39	19	13	3	2
3	Sporting Cristal	40	45	23	13	4	1
4	Alianza Lima	36	35	18	12	6	0
5	ADT	31	32	25	9	5	4
6	Cienciano	29	22	21	7	3	8
7	Cusco FC	29	22	24	9	7	2
8	Los Chankas	24	27	27	7	8	3
9	Sport Boys	22	20	21	6	8	4
10	Comerciantes Unidos	22	23	33	6	8	4
11	Atletico Grau	20	19	17	4	6	8
12	Cesar Vallejo	20	21	27	4	6	8
13	Sport Huancayo	19	19	31	5	9	4
14	Deportivo Garcilaso	17	21	26	4	9	5
15	UTC	16	21	30	4	10	4
16	Alianza Atletico	15	11	19	3	9	6
17	Carlos A. Mannucci	14	11	40	3	10	5
18	Union Comercio	9	18	36	1	11	6
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: sebastianashcallay
--

COPY public.types (type_id, name) FROM stdin;
1	card changed [red:away]
2	goal [awarded:away]
3	goal [awarded:home]
4	penalty [awarded-scored:away]
5	goal [cancelled:home]
6	penalty [awarded-scored:home]
7	penalty [checked-no-penalty:away]
8	card reviewed [yellow:away]
9	penalty [awarded-missed:home]
10	card changed [red:home]
11	goal [cancelled:away]
12	penalty [awarded-missed:away]
13	penalty [cancelled:home]
14	card changed [yellow:home]
15	card changed [yellow:away]
16	penalty [checked-no-penalty:home]
17	goal [checked-goal:home]
18	goal [checked-no-goal:home]
19	card changed [no-red:away]
20	card reviewed [yellow:home]
21	card changed [no-red:home]
\.


--
-- Name: decisions_decision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebastianashcallay
--

SELECT pg_catalog.setval('public.decisions_decision_id_seq', 136, true);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebastianashcallay
--

SELECT pg_catalog.setval('public.games_game_id_seq', 162, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebastianashcallay
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 18, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebastianashcallay
--

SELECT pg_catalog.setval('public.types_type_id_seq', 21, true);


--
-- Name: decisions decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.decisions
    ADD CONSTRAINT decisions_pkey PRIMARY KEY (decision_id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: decisions decisions_away_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.decisions
    ADD CONSTRAINT decisions_away_id_fkey FOREIGN KEY (away_id) REFERENCES public.teams(team_id);


--
-- Name: decisions decisions_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.decisions
    ADD CONSTRAINT decisions_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(game_id);


--
-- Name: decisions decisions_home_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.decisions
    ADD CONSTRAINT decisions_home_id_fkey FOREIGN KEY (home_id) REFERENCES public.teams(team_id);


--
-- Name: decisions decisions_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.decisions
    ADD CONSTRAINT decisions_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- Name: games games_away_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_away_id_fkey FOREIGN KEY (away_id) REFERENCES public.teams(team_id);


--
-- Name: games games_home_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebastianashcallay
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_home_id_fkey FOREIGN KEY (home_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

