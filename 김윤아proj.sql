# kg_tanghulu_menu 테이블 만들기
CREATE TABLE kg_tanghulu_menu (
	tanghulu_id int(3) NOT NULL auto_increment,
	name varchar(20) NOT NULL,
	price int(10) NOT NULL,
	calories dec(4,1) default NULL,
	PRIMARY KEY (tanghulu_id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=euckr;

INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('샤인머스켓 탕후루', 4000, 99.5);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('애플포도 탕후루', 3000, 97.6);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('블랙사파이어 탕후루', 3000, 108.2);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('귤 탕후루', 3000, 65.0);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('오마카세 탕후루', 4000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('산타 탕후루', 4000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('눈사람 탕후루', 4000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('통귤 탕후루', 4000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('스테비아토망고 탕후루', 3000, 103.6);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('딸기 탕후루', 3000, 50.3);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('블루베리 탕후루', 3000, 65.8);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('거봉 탕후루', 3000, 69.5);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('파인애플 탕후루', 4000, 95.8);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('망고 탕후루', 4000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('복숭아 탕후루', 3000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('아도라포도 탕후루', 3000, NULL);
INSERT INTO kg_tanghulu_menu (name, price, calories) VALUES ('레몬 탕후루', 3000, NULL);

#---------------------------------------------------------
# season_menu 테이블 만들기
CREATE TABLE season_menu (
	season_id int(3) NOT NULL AUTO_INCREMENT,
	tanghulu_id int(3) NOT NULL,
	name varchar(20) NOT NULL,
	PRIMARY KEY (season_id),
	FOREIGN KEY (tanghulu_id)
	REFERENCES kg_tanghulu_menu (tanghulu_id)	
);

INSERT INTO season_menu (tanghulu_id, name) SELECT kg.tanghulu_id, kg.name FROM kg_tanghulu_menu kg WHERE kg.name IN ('산타 탕후루', '눈사람 탕후루', '파인애플 탕후루', '망고 탕후루', '복숭아 탕후루');

#---------------------------------------------------------
# fruits 테이블 만들기
CREATE TABLE fruits (
	fruit_id int(3) NOT NULL AUTO_INCREMENT,
	name varchar(20) NOT NULL,
	boxes int(3) default NULL,
	PRIMARY KEY (fruit_id)
);

INSERT INTO fruits (name, boxes) VALUES ('거봉 탕후루', 2);
INSERT INTO fruits (name, boxes) VALUES ('귤 탕후루', 8);
INSERT INTO fruits (name, boxes) VALUES ('딸기 탕후루', 30);
INSERT INTO fruits (name, boxes) VALUES ('망고 탕후루', 0);
INSERT INTO fruits (name, boxes) VALUES ('복숭아 탕후루', 0);
INSERT INTO fruits (name, boxes) VALUES ('블랙사파이어 탕후루', 3);
INSERT INTO fruits (name, boxes) VALUES ('블루베리 탕후루', 2);
INSERT INTO fruits (name, boxes) VALUES ('샤인머스켓 탕후루', 4);
INSERT INTO fruits (name, boxes) VALUES ('스테비아토망고 탕후루', 8);
INSERT INTO fruits (name, boxes) VALUES ('아도라포도 탕후루', 4);
INSERT INTO fruits (name, boxes) VALUES ('애플포도 탕후루', 3);
INSERT INTO fruits (name, boxes) VALUES ('파인애플 탕후루',0);
INSERT INTO fruits (name, boxes) VALUES ('레몬 탕후루', 4);

#---------------------------------------------------------
# hulu 테이블 만들기
CREATE TABLE hulu (
	tanghulu_id int(3) NOT NULL,
	name varchar(20) NOT NULL,
	tray int(3) default NULL,
	FOREIGN KEY (tanghulu_id)
	REFERENCES kg_tanghulu_menu (tanghulu_id)
);

INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 2 FROM kg_tanghulu_menu WHERE name = '샤인머스켓 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 2 FROM kg_tanghulu_menu WHERE name = '블랙사파이어 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 8 FROM kg_tanghulu_menu WHERE name = '딸기 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 3 FROM kg_tanghulu_menu WHERE name = '오마카세 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 1 FROM kg_tanghulu_menu WHERE name = '산타 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 1 FROM kg_tanghulu_menu WHERE name = '눈사람 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 1 FROM kg_tanghulu_menu WHERE name = '귤 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 2 FROM kg_tanghulu_menu WHERE name = '통귤 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 1 FROM kg_tanghulu_menu WHERE name = '애플포도 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 1 FROM kg_tanghulu_menu WHERE name = '스테비아토망고 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 1 FROM kg_tanghulu_menu WHERE name = '블루베리 탕후루';
INSERT INTO hulu (tanghulu_id, name, tray) SELECT tanghulu_id, name, 2 FROM kg_tanghulu_menu WHERE name = '레몬 탕후루';

#---------------------------------------------------------
# tanghulu 테이블 만들기
CREATE TABLE tanghulu (
	tanghulu_id int(3) NOT NULL,
	fruit_id int(3) NOT NULL,
	FOREIGN KEY (tanghulu_id)
	REFERENCES kg_tanghulu_menu (tanghulu_id),
	FOREIGN KEY (fruit_id)
	REFERENCES fruits (fruit_id)
);

INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (1, 6);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (2, 11);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (3, 6);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (4, 2);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (8, 2);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (9, 9);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (10, 3);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (11, 7);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (12, 1);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (13, 12);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (14, 4);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (15, 5);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (16, 10);
INSERT INTO tanghulu (tanghulu_id, fruit_id) VALUES (17, 13);

