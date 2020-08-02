insert into usr (active, email, first_name, last_name, password, username) values (TRUE,'mrArxi@gmail.com','Vladimir','Vladimir','12345','Rustymattok');
insert into user_role(user_id,roles) values((select id from usr where username = 'Rustymattok'), 'ADMIN');
insert into topic(content,created,name,user_id) values ('smth','2016-06-22 19:10:25-07','Vladimir test',(select id from usr where username = 'Rustymattok'));
insert into comments(text,user_id,topic_id) values ('spring boot help',(select id from usr where username = 'Rustymattok'),(select id from topic where name = 'Vladimir test'));
