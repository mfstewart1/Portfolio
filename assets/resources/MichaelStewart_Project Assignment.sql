CREATE TABLE Teams
(
  Team_Id varchar2(10) NOT NULL,
  Team_Name varchar2(30),
  Stadium varchar2(30),
  city varchar2(30),
  PRIMARY KEY (Team_Id)
);

CREATE TABLE Players
(
  Player_Id varchar2(10) NOT NULL,
  Team_Id varchar2(10) NOT NULL,
  Player_Name varchar2(30),
  Jersey_Num number(2),
  Player_Dob varchar2(10),
  PRIMARY KEY (Player_Id)
);

CREATE TABLE Game
(
  Game_Id varchar2(30) NOT NULL,
  Game_Date varchar2(30),
  Final_Score varchar2(7),
  PRIMARY KEY (Game_Id)
);

CREATE TABLE Referees
(
  Ref_Id varchar2(10) NOT NULL,
  Ref_Name varchar2(30),
  Ref_Dob varchar2(30),
  Yrs_Exp number(2),
  PRIMARY KEY (Ref_Id)
);

CREATE TABLE Plays_For
(
  Team_Id varchar2(10) NOT NULL,
  Player_Id varchar2(10) NOT NULL,
  PRIMARY KEY (Team_Id, Player_Id),
  FOREIGN KEY (Team_Id) REFERENCES Teams(Team_Id),
  FOREIGN KEY (Player_Id) REFERENCES Players(Player_Id)
);

CREATE TABLE Has
(
  Game_Id varchar2(30) NOT NULL,
  Ref_Id varchar2(10) NOT NULL,
  PRIMARY KEY (Game_Id, Ref_Id),
  FOREIGN KEY (Game_Id) REFERENCES Game(Game_Id),
  FOREIGN KEY (Ref_Id) REFERENCES Referees(Ref_Id)
);

CREATE TABLE Plays
(
  Score varchar2(5),
  Home_Away varchar2(10),
  Team_Id varchar2(10) NOT NULL,
  Game_Id varchar2(30) NOT NULL,
  PRIMARY KEY (Team_Id, Game_Id),
  FOREIGN KEY (Team_Id) REFERENCES Teams(Team_Id),
  FOREIGN KEY (Game_Id) REFERENCES Game(Game_Id)
);

CREATE TABLE Plays_inGame
(
  Yards number(4),
  Score varchar2(5),
  Player_Id varchar2(10) NOT NULL,
  Game_Id varchar2(30) NOT NULL,
  PRIMARY KEY (Player_Id, Game_Id),
  FOREIGN KEY (Player_Id) REFERENCES Players(Player_Id),
  FOREIGN KEY (Game_Id) REFERENCES Game(Game_Id)
);

CREATE TABLE Substitute
(
  Player_Id varchar2(10),
  Substitute_Player_Id varchar2(10) NOT NULL,
  Game_Id varchar2(30) NOT NULL,
  Yards number(4),
  Score varchar2(5),
  PRIMARY KEY (Player_Id, Substitute_Player_Id),
  FOREIGN KEY (Player_Id) REFERENCES Players(Player_Id)
);


insert into Teams values('NO','New Orleans Saints','Mercedes-Benz Superdome','New Orleans');
insert into Teams values('AZ','Arizona Cardinals','University of Phoenix Stadium','Glendale');
insert into Teams values('GA','Atlanta Falcons','Mercedes-Benz Stadium','Atlanta');
insert into Teams values('WA','Seattle Seahawks','CenturyLink Field','Seattle');
insert into Teams values('TX','Dallas Cowboys','AT&T Stadium','Arlington');
insert into Teams values('NV','Las Vegas Raiders','Allegiant Stadium','Las Vegas');

insert into PLAYERS values('MS32','NO','Michael Stewart', 32, 'Apr 26, 87');
insert into PLAYERS values('CC82','AZ','Charles Clay', 82,'Feb 13, 89');
insert into PLAYERS values('JJ11','GA','Julio Jones', 11,'Feb 08, 89');
insert into PLAYERS values('RW03','WA','Russell Wilson', 03,'Nov 29, 88');
insert into PLAYERS values('EE21','TX','Ezekiel Elliott', 21,'Jul 22, 95');
insert into PLAYERS values('DC04','NV','Derek Carr', 04,'Mar 28, 91');

insert into Game values('Game01','Sept 15, 2019','10-21');
insert into Game values('Game02','Sept 22, 2019','28-14');
insert into Game values('Game03','Sept 23, 2019','31-15');
insert into Game values('Game04','Sept 26, 2019','34-27');
insert into Game values('Game05','Sept 29, 2019','24-10');
insert into Game values('Game06','Sept 29, 2019','03-24');

insert into Referees values('JB21', 'James Brown', 'May 2, 1933', 11);
insert into Referees values('HH01', 'Hank Hill', 'April 19, 1953', 25);
insert into Referees values('PW14', 'Paul Walker', 'September 12, 1973', 05);
insert into Referees values('MG99', 'Mahatma Gandhi', 'October 2, 1869', 99);
insert into Referees values('RW62', 'Ronald Weasley', 'March 1, 1980', 07);
insert into Referees values('TD53', 'Tim Donaghy', 'January 7, 1967', 13);

insert into Plays_For values('NO', 'MS32');
insert into Plays_For values('AZ', 'CC82');
insert into Plays_For values('GA', 'JJ11');
insert into Plays_For values('WA', 'RW03');
insert into Plays_For values('TX', 'EE21');
insert into Plays_For values('NV', 'DC04');

insert into Has values('Game01', 'HH01');
insert into Has values('Game03', 'JB21');
insert into Has values('Game03', 'PW14');
insert into Has values('Game04', 'MG99');
insert into Has values('Game03', 'RW62');
insert into Has values('Game06', 'TD53');

insert into Plays values('10-21', 'Home', 'NO', 'Game01');
insert into Plays values('28-14', 'Away', 'AZ', 'Game02');
insert into Plays values('31-15', 'Home', 'GA', 'Game03');
insert into Plays values('34-27', 'Away', 'WA', 'Game04');
insert into Plays values('24-10', 'Home', 'TX', 'Game05');
insert into Plays values('03-24', 'Away', 'NV', 'Game06');

insert into Plays_inGame values(300, 14, 'CC82', 'Game01' );
insert into Plays_inGame values(120, 7, 'MS32', 'Game02');
insert into Plays_inGame values(100, 7, 'JJ11', 'Game03' );
insert into Plays_inGame values(285, 27, 'RW03', 'Game04');
insert into Plays_inGame values(150, 7, 'EE21', 'Game05' );
insert into Plays_inGame values(180, 24, 'DC04', 'Game06');

insert into Substitute values('MS32', 'SUB01', 'Game01', 300, 14);
insert into Substitute values('CC82', 'SUB02', 'Game02', 120, 7);
insert into Substitute values('JJ11', 'SUB03', 'Game03', 100, 7);
insert into Substitute values('RW03', 'SUB04', 'Game04', 285, 27);
insert into Substitute values('EE21', 'SUB05', 'Game05', 150, 7);
insert into Substitute values('DC04', 'SUB06', 'Game06', 180, 24);