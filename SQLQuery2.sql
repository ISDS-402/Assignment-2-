USE INTRAMURAL
GO

/***************************************** Creating Tables *********************************/
CREATE TABLE STUDENTS (
	Cwid		Int		NOT NULL UNIQUE,
	FName		Char(25)	NOT NULL,
	LName		Char(30)	NOT NULL,
	StudentEmail	VarChar(100)	NOT NULL,
	CONSTRAINT	STUDENTS_PK	PRIMARY KEY(Cwid)
);

CREATE TABLE COACH (
	CoachID		Int		NOT NULL UNIQUE,
	FName		Char(25)	NOT NULL,
	LName		Char(30)	NOT NULL,
	Email		VarChar(100)	NOT NULL,
	CONSTRAINT	COACH_PK	PRIMARY KEY(CoachID)
);

CREATE TABLE SPORT (
    	SportId   	Int   		NOT NULL UNIQUE,
    	SportName 	Char(30) 	NOT NULL,
    	CONSTRAINT 	SportId_PK 	PRIMARY KEY(SportId)
);

CREATE TABLE COORDINATOR (
	CoordinatorID	Int		NOT NULL UNIQUE,
	FName		Char(25)	NOT NULL,
	LName		Char(30)	NOT NULL,
	Email		VarChar(100)	NOT NULL,
	SportId		Int		NOT NULL,
	CONSTRAINT	COORDINATOR_PK	PRIMARY KEY(CoordinatorID),
	CONSTRAINT	SPORT_FK	FOREIGN KEY(SportId)
					REFERENCES SPORT(SportId)
);

CREATE TABLE REFEREE (
    	RefId  		Int  		NOT NULL UNIQUE, 
    	FName  		Char(25) 	NOT NULL,
    	LName  		Char(30) 	NOT NULL,
    	RefEmail  	VarChar(100) 	NOT NULL, 
    	CONSTRAINT 	RefId_PK 	PRIMARY KEY(RefId)
);

CREATE TABLE LOCATION (
	LocationId	Int		NOT NULL UNIQUE,
	LocationName	Char(30)	NOT NULL,
	LocationType	Char(30)	NOT NULL,
	CONSTRAINT	LOCATION_PK	PRIMARY KEY(LocationId)
);

CREATE TABLE TEAMS(
  	TeamId 		Int 		NOT NULL UNIQUE, 
  	TeamName 	Char(25) 	NOT NULL UNIQUE, 
  	SportId   	Int   		NOT NULL,
  	CoachID		Int	  	NOT NULL UNIQUE,
  	CONSTRAINT 	TEAMS_PK 	PRIMARY KEY(Teamid),
  	CONSTRAINT 	TEAMS_SPORT_FK 	FOREIGN KEY(SportId)
                            		REFERENCES SPORT(SportId),
  	CONSTRAINT 	TEAMS_COACH_FK 	FOREIGN KEY(CoachId)
                            		REFERENCES COACH(CoachId) 
  
);

CREATE TABLE STUDENT_ASSOC (
	Cwid		Int		 NOT NULL UNIQUE,
	TeamsId		Int		 NOT NULL UNIQUE,
	CONSTRAINT	STUDENT_ASSOC_PK PRIMARY KEY(Cwid, TeamsId),
	CONSTRAINT	STUDENTS_FK	 FOREIGN KEY(Cwid)
					 REFERENCES STUDENTS(Cwid),
	CONSTRAINT	TEAMS_FK	 FOREIGN KEY(TeamsId)
					 REFERENCES TEAMS(TeamId)
);

CREATE TABLE GAMES (
	GamesId		Int		NOT NULL UNIQUE,
	RefId		Int		NOT NULL,
	LocationID	Int		NOT NULL,
	GameDate	Date		NOT NULL,
	GameTime	Time		NOT NULL,
	CONSTRAINT	GAMES_PK	PRIMARY KEY(GamesId, LocationId, GameDate, GameTime),
	CONSTRAINT	REFEREE_FK	FOREIGN KEY(RefId)
					REFERENCES REFEREE(RefID),
	CONSTRAINT	LOCATION_FK	FOREIGN KEY(LocationId)
					REFERENCES LOCATION(LocationId)
);

CREATE TABLE GAMES_ASSOC (
	TeamsID		Int		NOT NULL UNIQUE,
	GamesId		Int		NOT NULL UNIQUE,
	CONSTRAINT	GAMES_ASSOC_PK	PRIMARY KEY(TeamsId, GamesId),
	CONSTRAINT	GAMES_ASSOC_TEAMS_FK	FOREIGN KEY(TeamsId)
					REFERENCES TEAMS(TeamId),
	CONSTRAINT	GAMES_FK	FOREIGN KEY(GamesId)
					REFERENCES GAMES(GamesId)
);

CREATE TABLE EQUIPMENT_INVENTORY(
  	EquipmentId 	Int 		   NOT NULL UNIQUE, 
  	EquipmentName 	VarChar(75) 	   NOT NULL,
  	SportId   	Int   		   NOT NULL UNIQUE,
  	NoOfItems 	Int 		   NOT NULL,
  	CONSTRAINT 	EQUIPMENT_PK 	   PRIMARY KEY(EquipmentId),
  	CONSTRAINT 	EQUIPMENT_SPORT_FK FOREIGN KEY(SportId)
                                 	   REFERENCES SPORT(SportId)
);

CREATE TABLE EQUIPMENT_LOG(
	EquipmentId 	Int 		NOT NULL UNIQUE, 
	Cwid		Int		NOT NULL UNIQUE,
	DateBorrowed 	Date 		NOT NULL,
	DateReturned 	Date 		NOT NULL, 
	Purpose 	Char(5) 	NOT NULL,
	NoOfItemsBorrowed Int 		NOT NULL, 
	CONSTRAINT EQUIPMENT_LOG_PF 	PRIMARY KEY(EquipmentId, Cwid, DateBorrowed, Purpose),
	CONSTRAINT EQUIPMENT_LOG_STUDENTS_FK FOREIGN KEY(Cwid)
					     REFERENCES STUDENTS(Cwid),
	CONSTRAINT EQUIPMENT_LOG_EQUIPMENT_INV_FK FOREIGN KEY(EquipmentId)
						    REFERENCES EQUIPMENT_INVENTORY(EquipmentId)                               
);


/***************************************** Inserting Data *********************************/
USE INTRAMURAL
GO

	/* Student   */
INSERT INTO STUDENTS VALUES(12345678, 'Daniel', 'Man', 'danielman@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(21354931, 'Paul', 'Green', 'paulgreen@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(45612353, 'Lucy', 'Woman', 'lucywoman@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(98745611, 'Steph', 'Curry', 'stephcurry@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(23123457, 'Greg', 'Chan', 'gregagcj@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(35697812, 'Stephanie', 'Mgun', 'stephmgun12@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(43146518, 'Otelio', 'Men', 'oteliomen89@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(11234561, 'Ian', 'Stan', 'ianstan@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(98754123, 'Manny', 'Power', 'mannypower@csu.fullerton.edu');
INSERT INTO STUDENTS VALUES(54562135, 'Giselle', 'Li', 'giselleli@csu.fullerton.edu');

	/* Coach */
INSERT INTO COACH VALUES(1, 'Greg', 'Popvich', 'gpopvich@fullerton.edu');
INSERT INTO COACH VALUES(2, 'Luke', 'Walton', 'lwalton@fullerton.edu');
INSERT INTO COACH VALUES(3, 'Steve', 'Kerr', 'skerr@fullerton.edu');
INSERT INTO COACH VALUES(4, 'Mike', 'Pop', 'mpop@fullerton.edu');
INSERT INTO COACH VALUES(5, 'Manny', 'Pacquiao', 'mpacquiao@fullerton.edu');
INSERT INTO COACH VALUES(6, 'Tyson', 'Fury', 'tfury@fullerton.edu');
INSERT INTO COACH VALUES(7, 'Deontay', 'Wilder', 'dwilder@fullerton.edu');
INSERT INTO COACH VALUES(8, 'Ryan', 'Garcias', 'rgarcias@fullerton.edu');
INSERT INTO COACH VALUES(9, 'Fred', 'Ion', 'fion@fullerton.edu');
INSERT INTO COACH VALUES(10, 'Bob', 'Ross', 'bross@fullerton.edu');

	/* SPORT */
INSERT INTO SPORT VALUES(123, 'Football');
INSERT INTO SPORT VALUES(458, 'Basketball');
INSERT INTO SPORT VALUES(787, 'Baseball');
INSERT INTO SPORT VALUES(651, 'Soccer');
INSERT INTO SPORT VALUES(986, 'Hockey');
INSERT INTO SPORT VALUES(824, 'Swimming');
INSERT INTO SPORT VALUES(987, 'Boxing');
INSERT INTO SPORT VALUES(664, 'Bowling');
INSERT INTO SPORT VALUES(214, 'Badminton');
INSERT INTO SPORT VALUES(373, 'Tennis');

	/* Coordinator */
INSERT INTO COORDINATOR VALUES(1234, 'Mary', 'Abernathy', 'mabernathy@fullerton.edu', 123);
INSERT INTO COORDINATOR VALUES(5678, 'Tom', 'Caruthers', 'tcaruthers@fullerton.edu', 458);
INSERT INTO COORDINATOR VALUES(9874, 'Heather', 'Jones','hjones@fullerton.edu', 787);
INSERT INTO COORDINATOR VALUES(1324, 'Ken', 'Numoto','knumoto@fullerton.edu', 651);
INSERT INTO COORDINATOR VALUES(1264, 'Linda', 'Granger','lgranger@fullerton.edu', 986);
INSERT INTO COORDINATOR VALUES(7898, 'Ken', 'Evans','kevans@fullerton.edu', 824);
INSERT INTO COORDINATOR VALUES(1658, 'Mary', 'Jacobs','mjacobs@fullerton.edu', 987);
INSERT INTO COORDINATOR VALUES(9875, 'Rosalie', 'Jackson','rjackson@fullerton.edu', 664);
INSERT INTO COORDINATOR VALUES(1214, 'Richard', 'Bandalone','rbandalone@fullerton.edu', 214);
INSERT INTO COORDINATOR VALUES(1895, 'George', 'Smith','gsmith@fullerton.edu',373);

	/* Location */
INSERT INTO LOCATION VALUES(621, 'Basketball Court1', 'Court');
INSERT INTO LOCATION VALUES(801, 'Basketball Court2', 'Court');
INSERT INTO LOCATION VALUES(832, 'Basketball Court3', 'Court');
INSERT INTO LOCATION VALUES(834, 'Football Field1', 'Field');
INSERT INTO LOCATION VALUES(836, 'Football Field2', 'Field');
INSERT INTO LOCATION VALUES(838, 'Football Field3', 'Field');
INSERT INTO LOCATION VALUES(631, 'Soccer Field1', 'Field');
INSERT INTO LOCATION VALUES(831, 'Soccer Field2', 'Field');
INSERT INTO LOCATION VALUES(833, 'Pool1', 'Pool');
INSERT INTO LOCATION VALUES(837, 'Pool2', 'Pool');

	/*REFEREE*/
INSERT INTO REFEREE VALUES(11,'Sam', 'Stewart','SamStewart@csu');
INSERT INTO REFEREE VALUES(21,'Tom', 'Jackson', 'TomJackson@csu');
INSERT INTO REFEREE VALUES(31,'Mary', 'Smith', 'MarySmith@csu');
INSERT INTO REFEREE VALUES(41,'Jason', 'Sleeman','JasonSleeman@csu');
INSERT INTO REFEREE VALUES(51,'Mike', 'Nguyen', 'MikeNguyen@csu');
INSERT INTO REFEREE VALUES(61, 'Rick', 'Brown', 'RickBrown@csu');
INSERT INTO REFEREE VALUES(71, 'James', 'Nestor', 'JamesNestor@csu');
INSERT INTO REFEREE VALUES(81, 'Bill', 'Vinovick', 'BillVinovick@csu');
INSERT INTO REFEREE VALUES(91, 'Edward', 'Hochuli', 'EdwardHochuli@csu');
INSERT INTO REFEREE VALUES(01, 'Carson', 'Wentz', 'CarsonWentz@csu');

	/* Teams */
INSERT INTO TEAMS VALUES(01, 'Los Angeles Clippers', 458, 1);
INSERT INTO TEAMS VALUES(02, 'Los Angeles Lakers', 458, 2);
INSERT INTO TEAMS VALUES(03, 'Chicago Cubs', 787, 3);
INSERT INTO TEAMS VALUES(04, 'New York Wankees', 787, 4);
INSERT INTO TEAMS VALUES(05, 'Manchester United', 651, 5);
INSERT INTO TEAMS VALUES(06, 'FC Barcelona', 651, 6);
INSERT INTO TEAMS VALUES(07, 'AC Milan', 651, 7);
INSERT INTO TEAMS VALUES(08, 'Brooklyn Nets', 458, 8);
INSERT INTO TEAMS VALUES(09, 'Team Bowling', 664, 9);
INSERT INTO TEAMS VALUES(10, 'Team Badminton', 214, 10);

	/*STUDENT_ASSOC*/
INSERT INTO STUDENT_ASSOC VALUES(12345678, 01);
INSERT INTO STUDENT_ASSOC VALUES(21354931, 03); 
INSERT INTO STUDENT_ASSOC VALUES(45612353, 06);
INSERT INTO STUDENT_ASSOC VALUES(98745611, 04);
INSERT INTO STUDENT_ASSOC VALUES(23123457, 05);
INSERT INTO STUDENT_ASSOC VALUES(35697812, 02);
INSERT INTO STUDENT_ASSOC VALUES(43146518, 07);
INSERT INTO STUDENT_ASSOC VALUES(11234561, 08);
INSERT INTO STUDENT_ASSOC VALUES(98754123, 09);
INSERT INTO STUDENT_ASSOC VALUES(54562135, 10);


	/* Games */
INSERT INTO GAMES VALUES(01, 11, 621, '18-AUG-2020', '10:00AM');
INSERT INTO GAMES VALUES(02, 21, 801, '19-AUG-2020', '9:00AM');
INSERT INTO GAMES VALUES(03, 11, 832, '20-AUG-2020', '12:00PM');
INSERT INTO GAMES VALUES(04, 31, 834, '21-AUG-2020', '1:00PM');
INSERT INTO GAMES VALUES(05, 21, 836, '18-AUG-2020', '12:00PM');
INSERT INTO GAMES VALUES(06, 41, 838, '20-AUG-2020', '11:00AM');
INSERT INTO GAMES VALUES(07, 51, 631, '19-AUG-2020', '10:00AM');
INSERT INTO GAMES VALUES(08, 21, 621, '20-AUG-2020', '10:00AM');
INSERT INTO GAMES VALUES(09, 31, 621, '21-AUG-2020', '10:00AM');
INSERT INTO GAMES VALUES(10, 61, 621, '30-AUG-2020', '10:00AM');

	/* Games_Assoc */
INSERT INTO GAMES_ASSOC VALUES(01, 01);
INSERT INTO GAMES_ASSOC VALUES(02, 02);
INSERT INTO GAMES_ASSOC VALUES(03, 03);
INSERT INTO GAMES_ASSOC VALUES(04, 04);
INSERT INTO GAMES_ASSOC VALUES(05, 05);
INSERT INTO GAMES_ASSOC VALUES(06, 06);
INSERT INTO GAMES_ASSOC VALUES(07, 07);
INSERT INTO GAMES_ASSOC VALUES(08, 08);
INSERT INTO GAMES_ASSOC VALUES(09, 09);
INSERT INTO GAMES_ASSOC VALUES(10, 10);

/* Everything upto GAMES_ASSOC table works. Had to remove the constraint that RefId and LocationId must be unique. 
Changed the primary key in GAMES to a composite key; (GamesId, LocationId, GameDate, GameTime).
Having this composite key, and removing the constraint allows us to assign a location or a ref
on different times and dates. */


/***************************************** Queries *********************************/
SELECT *
FROM COACH;