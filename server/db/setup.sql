CREATE TABLE IF NOT EXISTS Matches
(
  Match_ID INT NOT NULL AUTO_INCREMENT,
  Match_Date DATETIME NOT NULL,
  PRIMARY KEY (Match_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Gender_Type
(
  Gender_ID INT NOT NULL AUTO_INCREMENT,
  Gender_Type VARCHAR(254) NOT NULL,
  PRIMARY KEY (Gender_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Education_Type
(
  Education_ID INT NOT NULL AUTO_INCREMENT,
  Education_Type VARCHAR(254) NOT NULL,
  PRIMARY KEY (Education_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Study_Type
(
  Study_ID INT NOT NULL AUTO_INCREMENT,
  Study_Type VARCHAR(254) NOT NULL,
  PRIMARY KEY (Study_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Religion_Type
(
  Religion_ID INT NOT NULL AUTO_INCREMENT,
  Religion_Type VARCHAR(254) NOT NULL,
  PRIMARY KEY (Religion_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Interests
(
  Interest_ID INT NOT NULL AUTO_INCREMENT,
  Interest_Type VARCHAR(254) NOT NULL,
  PRIMARY KEY (Interest_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Picture
(
  Picture_ID INT NOT NULL AUTO_INCREMENT,
  Picture_Path VARCHAR(2083) NOT NULL,
  PRIMARY KEY (Picture_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Location
(
  Location_ID INT NOT NULL AUTO_INCREMENT,
  Latitude DECIMAL(10, 8) NOT NULL,
  Longitude DECIMAL(11, 8) NOT NULL,
  PRIMARY KEY (Location_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Users
(
  User_ID INT NOT NULL AUTO_INCREMENT,
  User_Email VARCHAR(254) NOT NULL,
  User_Name VARCHAR(254) NOT NULL,
  User_Password VARCHAR(254) NOT NULL,
  Birthday DATE NOT NULL,
  Age INT NOT NULL,
  Bio INT,
  Gender_ID INT NOT NULL,
  Study_ID INT,
  Religion_ID INT,
  Interest_ID INT,
  Location_ID INT NOT NULL,
  PRIMARY KEY (User_ID),
  FOREIGN KEY (Gender_ID) REFERENCES Gender_Type(Gender_ID),
  FOREIGN KEY (Study_ID) REFERENCES Study_Type(Study_ID),
  FOREIGN KEY (Religion_ID) REFERENCES Religion_Type(Religion_ID),
  FOREIGN KEY (Interest_ID) REFERENCES Interests(Interest_ID),
  FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Users_Info
(
  User_ID INT NOT NULL AUTO_INCREMENT,
  User_Info VARCHAR(1000),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS User_Picutre
(
  User_ID INT NOT NULL,
  Picture_ID INT NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Picture_ID) REFERENCES Picture(Picture_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Preference
(
  User_ID INT NOT NULL,
  Gender_ID INT NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Gender_ID) REFERENCES Gender_Type(Gender_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Education
(
  Education_ID INT NOT NULL,
  User_ID INT NOT NULL,
  FOREIGN KEY (Education_ID) REFERENCES Education_Type(Education_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Likes
(
  User1_ID INT NOT NULL,
  User2_ID INT NOT NULL,
  User_Action TINYINT NOT NULL,
  Match_ID INT,
  CONSTRAINT FK_USER1 FOREIGN KEY (User1_ID) REFERENCES Users(User_ID),
  CONSTRAINT FK_USER2 FOREIGN KEY (User2_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Match_ID) REFERENCES Matches(Match_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;