insert into usr values (1,TRUE,'mrArxi@gmail.com','Vladimir','Vladimir','12345','Rustymattok');
insert into user_role values (1,'ADMIN');
CREATE TABLE topic_comments
(
  topic_id bigint NOT NULL,
  comments_id bigint NOT NULL,
  CONSTRAINT topic_comments_pkey PRIMARY KEY (topic_id, comments_id)
);
insert into topic values (1,'smth','2016-06-22 19:10:25-07','Vladimir',1);
insert into comments values (1,'spring boot help',1,1);
