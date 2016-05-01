--
-- ER/Studio Data Architect 10.0 SQL Code Generation
-- Project :      La Liga ER Diagram BACKUP.dm1
--
-- Date Created : Tuesday, October 21, 2014 22:35:53
-- Target DBMS : MySQL 5.x
--

DROP TABLE CHAMPIONSHIP
;
DROP TABLE CLUB
;
DROP TABLE CLUB_CHAMPIONSHIPS
;
DROP TABLE CLUB_STADIUM
;
DROP TABLE GAME
;
DROP TABLE `HEAD-COACH`
;
DROP TABLE `HEAD-COACH_CLUB`
;
DROP TABLE PLAYER
;
DROP TABLE PLAYER__CLUB
;
DROP TABLE PLAYER_STATISTICS_GAME
;
DROP TABLE STADIUM
;
DROP TABLE STATISTICS
;
-- 
-- TABLE: CHAMPIONSHIP 
--

CREATE TABLE CHAMPIONSHIP(
    ChampionshipYear    DECIMAL(10)    NOT NULL
)ENGINE=INNODB
;



-- 
-- TABLE: CLUB 
--

CREATE TABLE CLUB(
    clubID              CHAR(10)    NOT NULL,
    clubYearFounded     DECIMAL(10),
    clubShirtSponsor    CHAR(10),
    clubName            CHAR(10),
    clubCity            CHAR(10)
)ENGINE=INNODB
;



-- 
-- TABLE: CLUB_CHAMPIONSHIPS 
--

CREATE TABLE CLUB_CHAMPIONSHIPS(
    ChampionshipYear    DECIMAL(10)    NOT NULL,
    clubID              CHAR(10)    NOT NULL
)ENGINE=INNODB
;



-- 
-- TABLE: CLUB_STADIUM 
--

CREATE TABLE CLUB_STADIUM(
    stadiumID    CHAR(10)    NOT NULL,
    clubID       CHAR(10)    NOT NULL
)ENGINE=INNODB
;



-- 
-- TABLE: GAME 
--

CREATE TABLE GAME(
    gameID               CHAR(10)    NOT NULL,
    awayTeam             CHAR(10),
    playerGamesPlayed    DECIMAL(10),
    playerGoals          DECIMAL(10),
    playerRedCards       DECIMAL(10),
    playerSaves          DECIMAL(10),
    playerYellowCards    DECIMAL(10),
    playerAssists        DECIMAL(10),
    gameDate             CHAR(10),
    homeTeam             CHAR(10)
)ENGINE=INNODB
;



-- 
-- TABLE: `HEAD-COACH` 
--

CREATE TABLE `HEAD-COACH`(
    coachID             CHAR(10)    NOT NULL,
    coachClub           CHAR(10),
    coachName           CHAR(10),
    coachDateOfBirth    CHAR(10),
    coachNation         CHAR(10)
)ENGINE=INNODB
;



-- 
-- TABLE: `HEAD-COACH_CLUB` 
--

CREATE TABLE `HEAD-COACH_CLUB`(
    clubID         CHAR(10)    NOT NULL,
    dateHired      CHAR(10)    NOT NULL,
    coachID        CHAR(10),
    coachSalary    DECIMAL(10)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAYER 
--

CREATE TABLE PLAYER(
    playerID              CHAR(10)    NOT NULL,
    playerName            CHAR(10),
    playerContract        CHAR(10),
    playerDateOfBirth     CHAR(10),
    playerHeight          CHAR(10),
    playerJerseyNumber    DECIMAL(10),
    playerNation          CHAR(10),
    playerPosition        CHAR(10)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAYER__CLUB 
--

CREATE TABLE PLAYER__CLUB(
    playerID        CHAR(10)    NOT NULL,
    dateJoined      CHAR(10)    NOT NULL,
    playerSalary    DECIMAL(10),
    clubID          CHAR(10)    NOT NULL
)ENGINE=INNODB
;



-- 
-- TABLE: PLAYER_STATISTICS_GAME 
--

CREATE TABLE PLAYER_STATISTICS_GAME(
    playerID      CHAR(10)    NOT NULL,
    gameID        CHAR(10)    NOT NULL,
    statType      CHAR(10)    NOT NULL,
    statNumber    DECIMAL(10)
)ENGINE=INNODB
;



-- 
-- TABLE: STADIUM 
--

CREATE TABLE STADIUM(
    stadiumID          CHAR(10)    NOT NULL,
    stadiumName        CHAR(10),
    stadiumClub        CHAR(10),
    stadiumCity        CHAR(10),
    stadiumCapacity    CHAR(10)
)ENGINE=INNODB
;



-- 
-- TABLE: STATISTICS 
--

CREATE TABLE STATISTICS(
    statType    CHAR(10)    NOT NULL
)ENGINE=INNODB
;



-- 
-- INDEX: Ref11 
--

CREATE INDEX Ref11 ON CLUB_CHAMPIONSHIPS(clubID)
;
-- 
-- INDEX: Ref219 
--

CREATE INDEX Ref219 ON CLUB_CHAMPIONSHIPS(ChampionshipYear)
;
-- 
-- INDEX: Ref13 
--

CREATE INDEX Ref13 ON CLUB_STADIUM(clubID)
;
-- 
-- INDEX: Ref323 
--

CREATE INDEX Ref323 ON CLUB_STADIUM(stadiumID)
;
-- 
-- INDEX: Ref126 
--

CREATE INDEX Ref126 ON GAME(homeTeam)
;
-- 
-- INDEX: Ref128 
--

CREATE INDEX Ref128 ON GAME(awayTeam)
;
-- 
-- INDEX: Ref16 
--

CREATE INDEX Ref16 ON `HEAD-COACH_CLUB`(clubID)
;
-- 
-- INDEX: Ref720 
--

CREATE INDEX Ref720 ON `HEAD-COACH_CLUB`(coachID)
;
-- 
-- INDEX: Ref18 
--

CREATE INDEX Ref18 ON PLAYER__CLUB(clubID)
;
-- 
-- INDEX: Ref617 
--

CREATE INDEX Ref617 ON PLAYER__CLUB(playerID)
;
-- 
-- INDEX: Ref511 
--

CREATE INDEX Ref511 ON PLAYER_STATISTICS_GAME(gameID)
;
-- 
-- INDEX: Ref612 
--

CREATE INDEX Ref612 ON PLAYER_STATISTICS_GAME(playerID)
;
-- 
-- INDEX: Ref416 
--

CREATE INDEX Ref416 ON PLAYER_STATISTICS_GAME(statType)
;
-- 
-- TABLE: CHAMPIONSHIP 
--

ALTER TABLE CHAMPIONSHIP ADD 
    PRIMARY KEY (ChampionshipYear)
;

-- 
-- TABLE: CLUB 
--

ALTER TABLE CLUB ADD 
    PRIMARY KEY (clubID)
;

-- 
-- TABLE: CLUB_CHAMPIONSHIPS 
--

ALTER TABLE CLUB_CHAMPIONSHIPS ADD 
    PRIMARY KEY (ChampionshipYear, clubID)
;

-- 
-- TABLE: CLUB_STADIUM 
--

ALTER TABLE CLUB_STADIUM ADD 
    PRIMARY KEY (stadiumID, clubID)
;

-- 
-- TABLE: GAME 
--

ALTER TABLE GAME ADD 
    PRIMARY KEY (gameID)
;

-- 
-- TABLE: `HEAD-COACH` 
--

ALTER TABLE `HEAD-COACH` ADD 
    PRIMARY KEY (coachID)
;

-- 
-- TABLE: `HEAD-COACH_CLUB` 
--

ALTER TABLE `HEAD-COACH_CLUB` ADD 
    PRIMARY KEY (clubID, dateHired)
;

-- 
-- TABLE: PLAYER 
--

ALTER TABLE PLAYER ADD 
    PRIMARY KEY (playerID)
;

-- 
-- TABLE: PLAYER__CLUB 
--

ALTER TABLE PLAYER__CLUB ADD 
    PRIMARY KEY (playerID, dateJoined)
;

-- 
-- TABLE: PLAYER_STATISTICS_GAME 
--

ALTER TABLE PLAYER_STATISTICS_GAME ADD 
    PRIMARY KEY (playerID, gameID, statType)
;

-- 
-- TABLE: STADIUM 
--

ALTER TABLE STADIUM ADD 
    PRIMARY KEY (stadiumID)
;

-- 
-- TABLE: STATISTICS 
--

ALTER TABLE STATISTICS ADD 
    PRIMARY KEY (statType)
;

-- 
-- TABLE: CLUB_CHAMPIONSHIPS 
--

ALTER TABLE CLUB_CHAMPIONSHIPS ADD CONSTRAINT RefCLUB1 
    FOREIGN KEY (clubID)
    REFERENCES CLUB(clubID)
;

ALTER TABLE CLUB_CHAMPIONSHIPS ADD CONSTRAINT RefCHAMPIONSHIP19 
    FOREIGN KEY (ChampionshipYear)
    REFERENCES CHAMPIONSHIP(ChampionshipYear)
;


-- 
-- TABLE: CLUB_STADIUM 
--

ALTER TABLE CLUB_STADIUM ADD CONSTRAINT RefCLUB3 
    FOREIGN KEY (clubID)
    REFERENCES CLUB(clubID)
;

ALTER TABLE CLUB_STADIUM ADD CONSTRAINT RefSTADIUM23 
    FOREIGN KEY (stadiumID)
    REFERENCES STADIUM(stadiumID)
;


-- 
-- TABLE: GAME 
--

ALTER TABLE GAME ADD CONSTRAINT RefCLUB26 
    FOREIGN KEY (homeTeam)
    REFERENCES CLUB(clubID)
;

ALTER TABLE GAME ADD CONSTRAINT RefCLUB28 
    FOREIGN KEY (awayTeam)
    REFERENCES CLUB(clubID)
;


-- 
-- TABLE: `HEAD-COACH_CLUB` 
--

ALTER TABLE `HEAD-COACH_CLUB` ADD CONSTRAINT RefCLUB6 
    FOREIGN KEY (clubID)
    REFERENCES CLUB(clubID)
;

ALTER TABLE `HEAD-COACH_CLUB` ADD CONSTRAINT `RefHEAD-COACH20` 
    FOREIGN KEY (coachID)
    REFERENCES `HEAD-COACH`(coachID)
;


-- 
-- TABLE: PLAYER__CLUB 
--

ALTER TABLE PLAYER__CLUB ADD CONSTRAINT RefCLUB8 
    FOREIGN KEY (clubID)
    REFERENCES CLUB(clubID)
;

ALTER TABLE PLAYER__CLUB ADD CONSTRAINT RefPLAYER17 
    FOREIGN KEY (playerID)
    REFERENCES PLAYER(playerID)
;


-- 
-- TABLE: PLAYER_STATISTICS_GAME 
--

ALTER TABLE PLAYER_STATISTICS_GAME ADD CONSTRAINT RefGAME11 
    FOREIGN KEY (gameID)
    REFERENCES GAME(gameID)
;

ALTER TABLE PLAYER_STATISTICS_GAME ADD CONSTRAINT RefPLAYER12 
    FOREIGN KEY (playerID)
    REFERENCES PLAYER(playerID)
;

ALTER TABLE PLAYER_STATISTICS_GAME ADD CONSTRAINT RefSTATISTICS16 
    FOREIGN KEY (statType)
    REFERENCES STATISTICS(statType)
;


