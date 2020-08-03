CREATE TABLE usr
(
  id SERIAL primary key,
  active boolean NOT NULL,
  email character varying(255),
  first_name character varying(255),
  last_name character varying(255),
  password character varying(255),
  username character varying(255)
--   CONSTRAINT usr_pkey PRIMARY KEY (id)
);
CREATE TABLE user_role
(
  user_id SERIAL,
  roles character varying(255),
  CONSTRAINT fk_user_role_us FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE topic
(
  id SERIAL primary key,
  content character varying(255),
  created timestamp without time zone,
  name character varying(255),
  user_id bigint,
--   CONSTRAINT topic_pkey PRIMARY KEY (id),
  CONSTRAINT fk_topic FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE comments
(
  id SERIAL primary key,
  text character varying(255),
  user_id bigint,
  topic_id bigint,
--   CONSTRAINT comments_pkey PRIMARY KEY (id),
  CONSTRAINT fk_comments_us FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_comments_to FOREIGN KEY (topic_id)
      REFERENCES topic (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- CREATE TABLE topic_comments
-- (
--   topic_id SERIAL,
--   comments_id SERIAL,
--   CONSTRAINT topic_comments_pkey PRIMARY KEY (topic_id, comments_id),
--   CONSTRAINT fk_topic_comments_to FOREIGN KEY (topic_id)
--       REFERENCES topic (id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION,
--   CONSTRAINT fk_topic_comments_co FOREIGN KEY (comments_id)
--       REFERENCES comments (id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION
-- )