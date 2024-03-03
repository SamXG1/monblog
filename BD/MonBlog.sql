/* Testé sous MySQL 5.x */

drop table if exists T_COMMENTAIRE;
drop table if exists T_AUTEUR;
drop table if exists T_BILLET;

create table T_AUTEUR(
  AUT_ID integer PRIMARY KEY not NULL AUTO_INCREMENT,
  AUT_NOM varchar(100) not null,
  AUT_EMAIL varchar(200) not null,
  AUT_PASSWORD varchar(200) not null
)ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

create table T_BILLET (
  BIL_ID integer primary key auto_increment,
  BIL_DATE datetime not null,
  BIL_TITRE varchar(100) not null,
  BIL_CONTENU varchar(400) not null
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

create table T_COMMENTAIRE (
  COM_ID integer primary key auto_increment,
  COM_DATE datetime not null,
  COM_AUTEUR varchar(100) not null,
  COM_CONTENU varchar(200) not null,
  BIL_ID integer not null,
  constraint fk_com_bil foreign key(BIL_ID) references T_BILLET(BIL_ID)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

insert into T_BILLET(BIL_DATE, BIL_TITRE, BIL_CONTENU) values
(NOW(), 'Premier billet', 'Bonjour monde ! Ceci est le premier billet sur mon blog.');
insert into T_BILLET(BIL_DATE, BIL_TITRE, BIL_CONTENU) values
(NOW(), 'Au travail', 'Il faut enrichir ce blog dès maintenant.');

insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, BIL_ID) values
(NOW(), 'A. Nonyme', 'Bravo pour ce début', 1);
insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, BIL_ID) values
(NOW(), 'Moi', 'Merci ! Je vais continuer sur ma lancée', 1);
INSERT INTO t_auteur (AUT_NOM,AUT_EMAIL,AUT_PASSWORD) VALUES
("moi","moi@email.com","test123");
INSERT INTO t_auteur (AUT_NOM,AUT_EMAIL,AUT_PASSWORD) VALUES
("tester","tester@email.com","test123");