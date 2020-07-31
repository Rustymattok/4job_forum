CREATE TABLE usr
(
  id bigint NOT NULL,
  active boolean NOT NULL,
  email character varying(255),
  first_name character varying(255),
  last_name character varying(255),
  password character varying(255),
  username character varying(255),
  CONSTRAINT usr_pkey PRIMARY KEY (id)
);

CREATE TABLE user_role
(
  user_id bigint NOT NULL,
  roles character varying(255)
);

CREATE TABLE topic
(
  id bigint NOT NULL,
  content character varying(255),
  created timestamp without time zone,
  name character varying(255),
  user_id bigint,
  CONSTRAINT topic_pkey PRIMARY KEY (id)
);

CREATE TABLE comments
(
  id bigint NOT NULL,
  text character varying(255),
  user_id bigint,
  topic_id bigint,
  CONSTRAINT comments_pkey PRIMARY KEY (id)
);

CREATE TABLE topic_comments
(
  topic_id bigint NOT NULL,
  comments_id bigint NOT NULL,
  CONSTRAINT topic_comments_pkey PRIMARY KEY (topic_id, comments_id)
);

