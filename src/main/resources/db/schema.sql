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
  roles character varying(255),
  CONSTRAINT fkfpm8swft53ulq2hl11yplpr5 FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE topic
(
  id bigint NOT NULL,
  content character varying(255),
  created timestamp without time zone,
  name character varying(255),
  user_id bigint,
  CONSTRAINT topic_pkey PRIMARY KEY (id),
  CONSTRAINT fkrdf7v8xb9v98d0elr0s0bpta5 FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE comments
(
  id bigint NOT NULL,
  text character varying(255),
  user_id bigint,
  topic_id bigint,
  CONSTRAINT comments_pkey PRIMARY KEY (id),
  CONSTRAINT fkoe193dqy22vps4cq755krf76s FOREIGN KEY (user_id)
      REFERENCES usr (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fktpfse377xh238f1asryjnn2et FOREIGN KEY (topic_id)
      REFERENCES topic (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


