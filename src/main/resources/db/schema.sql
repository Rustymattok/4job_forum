CREATE TABLE usr
(
  id bigint NOT NULL DEFAULT nextval('hib_seq'::regclass),
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
  user_id bigint NOT NULL DEFAULT nextval('hib_seq'::regclass),
  roles character varying(255),
  CONSTRAINT fk_user_role_us FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE topic
(
  id bigint NOT NULL DEFAULT nextval('hib_seq'::regclass),
  content character varying(255),
  created timestamp without time zone,
  name character varying(255),
  user_id bigint,
  CONSTRAINT topic_pkey PRIMARY KEY (id),
  CONSTRAINT fk_topic FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE comments
(
  id bigint NOT NULL DEFAULT nextval('hib_seq'::regclass),
  text character varying(255),
  user_id bigint,
  topic_id bigint,
  CONSTRAINT comments_pkey PRIMARY KEY (id),
  CONSTRAINT fk_comments_us FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_comments_to FOREIGN KEY (topic_id)
      REFERENCES topic (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);