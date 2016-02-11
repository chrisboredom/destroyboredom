--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: Chris; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO "Chris";

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: Chris
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO "Chris";

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Chris
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: Chris; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    user_id integer,
    slug character varying,
    published_at timestamp without time zone
);


ALTER TABLE public.posts OWNER TO "Chris";

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: Chris
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO "Chris";

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Chris
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Chris; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "Chris";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Chris; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO "Chris";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Chris
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Chris";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Chris
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Chris
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Chris
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Chris
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: Chris
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Chris
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: Chris
--

COPY posts (id, title, body, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, user_id, slug, published_at) FROM stdin;
21	Yankee Slugger	Will this have a slug?	2015-12-23 01:36:32.932512	2015-12-23 01:36:32.932512	\N	\N	\N	\N	1	yankee-slugger	\N
12	Hey Mango!	Ugh DIY next level craft beer four dollar toast. Cronut plaid messenger bag dreamcatcher Thundercats. Ennui viral pop-up salvia Truffaut scenester. Cronut distillery fap, scenester kitsch lomo keffiyeh Williamsburg pork belly listicle meditation. Banksy master cleanse Marfa, chia Echo Park pour-over biodiesel jean shorts. Meggings quinoa pork belly, irony photo booth McSweeney's health goth fixie keffiyeh swag tattooed chia gentrify synth. Church-key roof party craft beer, synth chambray fixie pop-up.	2015-08-23 20:08:50.818577	2015-12-23 01:38:42.470585	\N	\N	\N	\N	1	hey-mango	\N
19	Does this have a user. Now it does.	Selfies tousled offal kogi keffiyeh, put a bird on it lomo swag roof party crucifix microdosing single-origin coffee asymmetrical 90's. Sustainable distillery banjo drinking vinegar direct trade, try-hard cray post-ironic wayfarers mlkshk. Chambray waistcoat photo booth try-hard vinyl hoodie, salvia next level DIY chia pitchfork bushwick XOXO. Ugh YOLO occupy thundercats, food truck taxidermy poutine neutra marfa retro tumblr cardigan. Tumblr crucifix flannel beard health goth. Farm-to-table art party intelligentsia, put a bird on it jean shorts ugh twee health goth microdosing XOXO pickled. Tattooed ugh intelligentsia squid, quinoa schlitz cornhole lumbersexual poutine trust fund organic yr banh mi.	2015-12-16 00:31:41.097862	2015-12-23 01:38:42.516711	\N	\N	\N	\N	1	does-this-have-a-user-now-it-does	\N
20	Seinfeld 3	Authentic meggings bespoke, single-origin coffee neutra blog kale chips kombucha leggings chambray venmo pickled drinking vinegar. Yr gastropub lomo heirloom, street art butcher keytar everyday carry. Banh mi chillwave squid cronut cred, leggings raw denim retro aesthetic. Poutine jean shorts before they sold out ethical, beard paleo crucifix lumbersexual hashtag viral photo booth kitsch echo park tattooed kickstarter. Street art chillwave beard, kogi four loko dreamcatcher flexitarian schlitz. Organic pop-up poutine, dreamcatcher kale chips ugh fashion axe tilde post-ironic mlkshk small batch roof party normcore. XOXO pabst put a bird on it pork belly umami normcore, art party thundercats messenger bag.	2015-12-16 00:45:48.246889	2015-12-23 01:38:42.523439	\N	\N	\N	\N	1	seinfeld-3	\N
25	New picture post	This is another picture.	2016-02-01 20:42:31.581563	2016-02-01 20:42:31.581563	golfrestate.jpg	image/jpeg	101935	2016-02-01 20:42:31.392688	1	new-picture-post-9e47cc05-a5ab-4b34-ac6d-cae01a6c388f	\N
26	Draft Post	Stumptown hoodie tousled post-ironic listicle cray. Swag pitchfork lumbersexual, artisan venmo 90's scenester PBR&B salvia. Small batch cardigan cornhole mixtape, gochujang listicle brunch tofu forage you probably haven't heard of them pork belly leggings trust fund. Pitchfork sriracha hella messenger bag post-ironic chartreuse irony, plaid keytar. Bicycle rights whatever street art, wolf neutra irony try-hard flannel lumbersexual. Synth neutra art party fashion axe, blog echo park kale chips normcore 3 wolf moon migas you probably haven't heard of them. Lomo post-ironic pitchfork hammock seitan etsy, plaid bicycle rights church-key hoodie bitters waistcoat microdosing.	2016-02-05 01:02:24.465757	2016-02-05 01:02:24.465757	\N	\N	\N	\N	1	draft-post	2016-02-05 01:00:00
27	Published at Post	Hoodie kale chips heirloom microdosing, blue bottle synth cold-pressed austin vegan waistcoat tilde knausgaard literally organic. Kickstarter try-hard meh, viral street art schlitz asymmetrical everyday carry truffaut. Pork belly pop-up fap, iPhone street art sustainable raw denim distillery crucifix gochujang. Yuccie pour-over cliche readymade, normcore cred street art pork belly you probably haven't heard of them. Yr twee blog, mumblecore everyday carry cardigan cray. 8-bit forage ennui, green juice chia pour-over single-origin coffee VHS cornhole raw denim vegan salvia PBR&B taxidermy. Butcher vinyl selvage irony, viral gastropub bespoke hoodie knausgaard intelligentsia.	2016-02-05 01:03:05.243095	2016-02-05 01:03:05.243095	\N	\N	\N	\N	1	published-at-post	2016-02-05 01:02:00
14	Hello world!	Helvetica bicycle rights tilde, direct trade Portland Vice single-origin coffee you probably haven't heard of them Schlitz bitters farm-to-table ennui. Seitan mustache kale chips, pour-over cray brunch YOLO High Life cred Thundercats Blue Bottle Wes Anderson. Fixie brunch organic kale chips beard, synth skateboard Wes Anderson viral tofu shabby chic banjo direct trade small batch Vice. Twee occupy meh Wes Anderson, Shoreditch Pitchfork VHS Vice kitsch +1. Kickstarter iPhone cornhole letterpress art party, master cleanse pour-over butcher cray disrupt plaid. Quinoa mlkshk brunch irony. Put a bird on it church-key locavore, butcher Intelligentsia brunch irony disrupt kogi farm-to-table literally wolf.	2015-08-25 00:09:11.377431	2015-12-23 01:38:42.48098	\N	\N	\N	\N	1	hello-world	\N
15	OBX	Making sure this works.	2015-08-31 02:53:23.914537	2015-12-23 01:38:42.486809	\N	\N	\N	\N	1	obx	\N
16	New image post	Pickled selfies forage try-hard, Marfa vinyl cold-pressed butcher Banksy lomo sustainable Bushwick raw denim YOLO. Banh mi yr wayfarers fixie flexitarian chillwave. Cliche PBR lumbersexual, VHS fanny pack freegan disrupt migas four loko. American Apparel biodiesel Godard fingerstache mlkshk tattooed you probably haven't heard of them tilde migas, keytar YOLO food truck kogi cray. Quinoa food truck small batch next level biodiesel. Raw denim keytar fixie banh mi gentrify quinoa. PBR&B taxidermy Tumblr Kickstarter yr.	2015-08-31 18:16:17.244601	2015-12-23 01:38:42.492737	RProXzvl.jpg	image/jpeg	92193	2015-08-31 18:22:36.315096	1	new-image-post	\N
17	Testing picture size	This should be 4x3	2015-08-31 18:24:27.941738	2015-12-23 01:38:42.498774	P3210005.JPG	image/jpeg	7902389	2015-08-31 18:33:03.524171	1	testing-picture-size	\N
18	It's September already	DIY vegan master cleanse, High Life YOLO cold-pressed Blue Bottle McSweeney's. Cold-pressed pour-over cray Tumblr Brooklyn Schlitz. Quinoa sustainable brunch disrupt pug, normcore next level. Williamsburg ugh twee pour-over quinoa. Organic fap fixie, Helvetica flexitarian blog photo booth bespoke art party keytar pour-over sartorial. Neutra kitsch art party, Thundercats Banksy Shoreditch messenger bag tilde gastropub meditation direct trade American Apparel forage authentic raw denim. Lomo butcher cliche PBR, single-origin coffee Thundercats DIY four loko.	2015-09-02 02:07:23.87699	2015-12-23 01:38:42.504791	\N	\N	\N	\N	1	it-s-september-already	\N
22	Syntax Highlighting	Please don't use any `<blink>` tags.	2015-12-30 01:15:34.780618	2015-12-30 02:06:17.826842	\N	\N	\N	\N	1	syntax-highlighting	\N
23	Some Ruby Code	``` ruby\r\nputs "Hello World!"\r\n\r\nclass PostsController < ApplicationController\r\n\tbefore_action :find_post, only: [:show, :edit, :update, :destroy]\r\n\tbefore_action :authenticate_user!, except: [:index, :show]\r\n\r\n\tdef index\r\n\t\t@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)\r\n\tend\r\n\r\n\tdef new\r\n\t\t@post = current_user.posts.build\r\n\tend\r\n\r\n\tdef show\r\n\tend\r\n\r\n\tdef create\r\n\t\t@post = current_user.posts.build(post_params)\r\n\r\n\t\tif @post.save\r\n\t\t\tredirect_to @post\r\n\t\telse\r\n\t\t\trender 'new'\r\n\t\tend\r\n\tend\r\n\r\n\tdef edit\r\n\tend\r\n\r\n\tdef update\r\n\t\tif @post.update(post_params)\r\n\t\t\tredirect_to @post\r\n\t\telse\r\n\t\t\trender 'edit'\r\n\t\tend\r\n\tend\r\n\r\n\tdef destroy\r\n\t\t@post.destroy\r\n\t\tredirect_to root_path\r\n\tend\r\n\r\n\tprivate\r\n\r\n\tdef post_params\r\n\t\tparams.require(:post).permit(:title, :body, :photo, :slug)\r\n\tend\r\n\r\n\tdef find_post\r\n\t\t@post = Post.friendly.find(params[:id])\r\n\tend\r\nend\r\n```	2016-01-05 01:06:34.599862	2016-01-05 02:14:28.133607	\N	\N	\N	\N	1	some-ruby-code	\N
28	Scheduled Post	Austin sustainable hashtag biodiesel chartreuse. Pork belly salvia hella, man bun pour-over you probably haven't heard of them pitchfork organic. Neutra bicycle rights freegan, offal try-hard bespoke hashtag 90's mumblecore farm-to-table meh. Humblebrag keffiyeh franzen aesthetic echo park. Locavore artisan beard drinking vinegar sustainable, 8-bit you probably haven't heard of them typewriter tofu chambray master cleanse retro trust fund pour-over fixie. Wayfarers selfies fashion axe, man braid neutra disrupt kale chips hashtag vinyl put a bird on it dreamcatcher gochujang etsy tote bag. Cred viral deep v chicharrones, typewriter man bun fingerstache celiac.	2016-02-05 01:04:30.198466	2016-02-05 01:04:30.198466	\N	\N	\N	\N	1	scheduled-post	2016-03-05 01:03:00
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Chris
--

SELECT pg_catalog.setval('posts_id_seq', 28, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Chris
--

COPY schema_migrations (version) FROM stdin;
20150821232513
20150831175225
20151214235855
20151215010912
20151223012019
20151223012207
20160204005910
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Chris
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	chris@mangano.us	$2a$10$uBDafMB3Hs8dst1/7UZBeef8V6DAjw3PT900.ECXskRAdsWONOKZq	\N	\N	\N	10	2016-02-05 01:00:11.812025	2016-02-01 20:23:04.177276	::1	::1	2015-12-15 00:02:31.471031	2016-02-05 01:00:11.815625
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Chris
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: Chris; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: Chris; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Chris; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_posts_on_slug; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE UNIQUE INDEX index_posts_on_slug ON posts USING btree (slug);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: Chris; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: Chris
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Chris";
GRANT ALL ON SCHEMA public TO "Chris";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

