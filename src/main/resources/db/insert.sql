insert into usr values (1,TRUE,'mrArxi@gmail.com','Vladimir','Vladimir','12345','Rustymattok');
insert into user_role values (1,'ADMIN');
CREATE TABLE topic_comments
(
  topic_id bigint NOT NULL,
  comments_id bigint NOT NULL,
  CONSTRAINT topic_comments_pkey PRIMARY KEY (topic_id, comments_id),
    CONSTRAINT fkia810jj3eu2p5ntkhvjp5y9t0 FOREIGN KEY (topic_id)
      REFERENCES topic (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkllpw88mcv1vyajo7oiyol5ys4 FOREIGN KEY (comments_id)
      REFERENCES comments (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
insert into topic values (1,'smth','2016-06-22 19:10:25-07','Vladimir',1);
insert into comments values (1,'spring boot help',1,1);
-- Heroku = сука
-- Heroku = сука дважды
