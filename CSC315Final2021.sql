CREATE DATABASE CSC315Final2021;
USE CSC315Final2021;


CREATE TABLE Genre (
	gid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gname CHAR(20) NOT NULL
);

INSERT INTO Genre (gname) VALUES ('Rock'), ('Jazz'), ('Country'), ('Classical'), ('Throat Singing');

CREATE TABLE Sub_Genre (
	sgid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gname CHAR(20) NOT NULL,
	sgname CHAR(20) NOT NULL
);

INSERT INTO Sub_Genre (gname, sgname) VALUES ('Rock', 'Blues'), ('Rock', 'Classic Rock'), ('Rock', 'Power Metal'), ('Rock', 'Thrash Metal'), ('Rock', 'Death Metal'), ('Rock', 'Folk Metal');
INSERT INTO Sub_Genre (gname, sgname) VALUES ('Jazz', 'Swing'), ('Jazz', 'Smooth Jazz'), ('Jazz', 'Bossa Nova'), ('Jazz', 'Ragtime');
INSERT INTO Sub_Genre (gname, sgname) VALUES ('Country', 'Bluegrass'), ('Country', 'Country and Western'), ('Country', 'Jug Band');
INSERT INTO Sub_Genre (gname, sgname) VALUES ('Classical', 'Chamber Music'), ('Classical', 'Opera'), ('Classical', 'Orchestral');
INSERT INTO Sub_Genre (gname, sgname) VALUES ('Throat Singing', 'Khoomii'), ('Throat Singing', 'Kargyraa'), ('Throat Singing', 'Khamryn');

CREATE TABLE Region (
	rid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rname CHAR(20) NOT NULL
);

INSERT INTO Region (rname) VALUES ('Central Asia'), ('Europe'), ('North Americ'), ('South America');

CREATE TABLE Country (
	rid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rname CHAR(20) NOT NULL,
	cname CHAR(20) NOT NULL
);

INSERT INTO Country (rname, cname) VALUES ('Central Asia', 'Mongolia'), ('Central Asia', 'Tibet'), ('Central Asia', 'Tuva');
INSERT INTO Country (rname, cname) VALUES ('North Americ', 'Canada'), ('North Americ', 'United States'), ('North Americ', 'Mexico');
INSERT INTO Country (rname, cname) VALUES ('South Americ', 'Brazil');
INSERT INTO Country (rname, cname) VALUES ('Europe', 'Norway'), ('Europe', 'Austria'), ('Europe', 'England'), ('Europe', 'Russia');

CREATE TABLE Bands (
	bid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bname CHAR(20) NOT NULL
);

INSERT INTO Bands (bname) VALUES ('Seputura'), ('Death'), ('Muddy Waters'), ('Led Zeppelin'), ('The Guess Who');
INSERT INTO Bands (bname) VALUES ('The Hu'), ('Huun-Huur-Tu'), ('Paul Pena'), ('Battuvshin'), ('Sade');
INSERT INTO Bands (bname) VALUES ('Mozart'), ('Tchaikovsky'), ('Twisted Sister'), ('Testament'), ('Tengger Cavalry');

CREATE TABLE Band_Genre (
	bgid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bname CHAR(50) NOT NULL,
	gname CHAR(50) NOT NULL
);

INSERT INTO Band_Genre (bname, gname) VALUES ('Huun-Huur-Tu', 'Throat Singing');
INSERT INTO Band_Genre (bname, gname) VALUES ('Tchaikovsky', 'Classical');
INSERT INTO Band_Genre (bname, gname) VALUES ('Twisted Sister', 'Rock');
INSERT INTO Band_Genre (bname, gname)  VALUES ('Battuvshin', 'Jazz');
INSERT INTO Band_Genre (bname, gname)  VALUES ('Paul Pena', 'Rock');

CREATE TABLE Band_Origins (
	boid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bname CHAR(20) NOT NULL,
	cname CHAR(20) NOT NULL
);

INSERT INTO Band_Origins (bname, cname) VALUES ('Seputura', 'Brazil');
INSERT INTO Band_Origins (bname, cname) VALUES ('Death', 'United States');
INSERT INTO Band_Origins (bname, cname) VALUES ('Muddy Waters', 'United States');
INSERT INTO Band_Origins (bname, cname) VALUES ('Led Zeppelin', 'England');
INSERT INTO Band_Origins (bname, cname) VALUES ('The Guess Who', 'Canada');
INSERT INTO Band_Origins (bname, cname) VALUES ('The Hu', 'Mongolia');
INSERT INTO Band_Origins (bname, cname) VALUES ('Huun-Huur-Tu', 'Tuva');
INSERT INTO Band_Origins (bname, cname) VALUES ('Paul Pena', 'United States');
INSERT INTO Band_Origins (bname, cname) VALUES ('Battuvshin', 'Mongolia');
INSERT INTO Band_Origins (bname, cname) VALUES ('Sade', 'England');
INSERT INTO Band_Origins (bname, cname) VALUES ('Mozart', 'Austria');
INSERT INTO Band_Origins (bname, cname) VALUES ('Tchaikovsky', 'Russia');
INSERT INTO Band_Origins (bname, cname) VALUES ('Twisted Sister', 'United States');
INSERT INTO Band_Origins (bname, cname) VALUES ('Testament', 'United States');
INSERT INTO Band_Origins (bname, cname) VALUES ('Tengger Cavalry', 'United States');


CREATE TABLE Band_Styles (
	boid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bname CHAR(20) NOT NULL,
	sgname CHAR(20) NOT NULL
);

INSERT INTO Band_Styles (bname, sgname) VALUES ('Seputura', 'Death Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Seputura', 'Thrash Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Death', 'Death Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Muddy Waters', 'Blues');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Led Zeppelin', 'Classic Rock');
INSERT INTO Band_Styles (bname, sgname) VALUES ('The Guess Who', 'Classic Rock');
INSERT INTO Band_Styles (bname, sgname) VALUES ('The Hu', 'Folk Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('The Hu', 'Khoomii');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Huun-Huur-Tu', 'Khoomii');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Huun-Huur-Tu', 'Kargyraa');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Paul Pena', 'Blues');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Paul Pena', 'Kargyraa');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Battuvshin', 'Khoomii');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Battuvshin', 'Smooth Jazz');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Sade', 'Smooth Jazz');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Mozart', 'Opera');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Tchaikovsky', 'Opera');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Tchaikovsky', 'Orchestral');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Twisted Sister', 'Thrash Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Testament', 'Thrash Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Tengger Cavalry', 'Folk Metal');
INSERT INTO Band_Styles (bname, sgname) VALUES ('Tengger Cavalry', 'Khoomii');

-- create user and set premissions
CREATE USER 'api'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON Bands TO 'api'@'localhost';
GRANT SELECT ON Band_Styles TO 'api'@'localhost';
GRANT SELECT ON Band_Origins TO 'api'@'localhost';
GRANT SELECT ON Band_Genre TO 'api'@'localhost';
GRANT SELECT ON Country TO 'api'@'localhost';
GRANT SELECT ON Region TO 'api'@'localhost';
GRANT SELECT ON Genre TO 'api'@'localhost';
GRANT SELECT ON Sub_Genre TO 'api'@'localhost';

SHOW GRANTS;

-- create user table and set permissions
CREATE TABLE Users (
	uid int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    u_name varchar(50),
    rid int NOT NULL,
    FOREIGN KEY (rid) REFERENCES Country(rid)
);

INSERT INTO Users (u_name, rid) VALUES ('James', 3);
SELECT uid FROM Users WHERE uid=1;

GRANT SELECT, INSERT, UPDATE, DELETE ON Users TO 'api'@'localhost';

-- create favorites table and set permissions
CREATE TABLE Favorites (
	fid int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bid int NOT NULL,
    uid int NOT NULL,
    FOREIGN KEY (bid) REFERENCES Bands(bid),
    FOREIGN KEY (uid) REFERENCES Users(uid)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON Favorites TO 'api'@'localhost';

-- indexing
CREATE INDEX Genre_Index ON Genre(gname);
CREATE INDEX SubGenre_Index ON Sub_Genre(sgname);
CREATE INDEX Region_Index ON Region(rname);
CREATE INDEX Country_Index ON Country(cname);
CREATE INDEX Bands_Index ON Bands(bname);
CREATE INDEX BandOrigins_Index ON Band_Origins(bname, cname);
CREATE INDEX BandStyles_Index ON Band_Styles(bname, sgname);
CREATE INDEX BandGenre_Index ON Band_Genre(bname, gname);

-- cleanup
DROP USER 'api'@'localhost';
-- DROP USER 'root'@'localhost';
DROP TABLE Band_Styles;
DROP TABLE Band_Origins;
DROP TABLE Band_Genre;
DROP TABLE Bands;
DROP TABLE Country;
DROP TABLE Region;
DROP TABLE Sub_Genre;
DROP TABLE Genre;
DROP TABLE Users;
FLUSH PRIVILEGES;
DROP DATABASE CSC315Final2021;
