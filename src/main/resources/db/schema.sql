CREATE TABLE usr
(
  id SERIAL primary key,
  active boolean NOT NULL,
  email character varying(255),
  first_name character varying(255),
  last_name character varying(255),
  password character varying(255),
  username character varying(255)
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
  CONSTRAINT fk_comments_us FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_comments_to FOREIGN KEY (topic_id)
      REFERENCES topic (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);