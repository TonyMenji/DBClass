--
-- ER/Studio Data Architect 10.0 SQL Code Generation
-- Project :      LA LIGA SQL DIAGRAM.dm1
--
-- Date Created : Sunday, November 27, 2014 17:43:08
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: CHAMPIONSHIP 
--

CREATE TABLE CHAMPIONSHIP(
    ChampionshipYear    CHAR(10)    NOT NULL,
    PRIMARY KEY (ChampionshipYear)
)ENGINE=INNODB
;



-- 
-- TABLE: CLUB 
--

CREATE TABLE CLUB(
    clubID              CHAR(10)       NOT NULL,
    clubYearFounded     CHAR(10),
    clubShirtSponsor    CHAR(25),
    clubName            CHAR(25),
    clubCity            CHAR(25),
    PRIMARY KEY (clubID)
)ENGINE=INNODB
;



-- 
-- TABLE: CLUB_CHAMPIONSHIPS 
--

CREATE TABLE CLUB_CHAMPIONSHIPS(
    ChampionshipYear    CHAR(10)        NOT NULL,
    clubID              CHAR(10)    NOT NULL,
    PRIMARY KEY (ChampionshipYear, clubID)
)ENGINE=INNODB
;



-- 
-- TABLE: CLUB_STADIUM 
--

CREATE TABLE CLUB_STADIUM(
    stadiumID    CHAR(10)    NOT NULL,
    clubID       CHAR(10)    NOT NULL,
    PRIMARY KEY (stadiumID, clubID)
)ENGINE=INNODB
;



-- 
-- TABLE: GAME 
--

CREATE TABLE GAME(
    gameID      CHAR(10)    NOT NULL,
    awayTeam    CHAR(25),
    gameDate    CHAR(10),
    homeTeam    CHAR(25),
    PRIMARY KEY (gameID)
)ENGINE=INNODB
;



-- 
-- TABLE: `HEAD-COACH` 
--

CREATE TABLE `HEAD-COACH`(
    coachID             CHAR(10)    NOT NULL,
    coachClub           CHAR(25),
    coachName           CHAR(25),
    coachDateOfBirth    CHAR(10),
    coachNation         CHAR(25),
    PRIMARY KEY (coachID)
)ENGINE=INNODB
;



-- 
-- TABLE: `HEAD-COACH_CLUB` 
--

CREATE TABLE `HEAD-COACH_CLUB`(
    dateHired      CHAR(10)               NOT NULL,
    clubID         CHAR(10)          NOT NULL,
    coachID        CHAR(10),
    coachSalary    CHAR(10),
    PRIMARY KEY (dateHired, clubID)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAYER 
--

CREATE TABLE PLAYER(
    playerID              CHAR(10)    NOT NULL,
    playerName            CHAR(25),
    playerContract        CHAR(10),
    playerDateOfBirth     CHAR(10),
    playerHeight          CHAR(10),
    playerJerseyNumber    CHAR(10),
    playerNation          CHAR(25),
    playerPosition        CHAR(10),
    PRIMARY KEY (playerID)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAYER__CLUB 
--

CREATE TABLE PLAYER__CLUB(
    playerID        CHAR(10)          NOT NULL,
    dateJoined      CHAR(10)          NOT NULL,
    playerSalary    CHAR(10),
    clubID          CHAR(10)          NOT NULL,
    PRIMARY KEY (playerID, dateJoined)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAYER_STATISTICS_GAME 
--

CREATE TABLE PLAYER_STATISTICS_GAME(
    playerID      CHAR(10)    NOT NULL,
    gameID        CHAR(10)    NOT NULL,
    statType      CHAR(20)    NOT NULL,
    statNumber    CHAR(10),
    PRIMARY KEY (playerID, gameID, statType)
)ENGINE=INNODB
;



-- 
-- TABLE: STADIUM 
--

CREATE TABLE STADIUM(
    stadiumID          CHAR(10)    NOT NULL,
    stadiumName        CHAR(25),
    stadiumClub        CHAR(25),
    stadiumCity        CHAR(25),
    stadiumCapacity    CHAR(10),
    PRIMARY KEY (stadiumID)
)ENGINE=INNODB
;



-- 
-- TABLE: STATISTICS 
--

CREATE TABLE STATISTICS(
    statType             CHAR(20)    NOT NULL,
    playerGamesPlayed    CHAR(10),
    playerGoals          CHAR(10),
    playerAssists        CHAR(10),
    playerRedCards       CHAR(10),
    playerSaves          CHAR(10),
    playerYellowCards    CHAR(10),
    PRIMARY KEY (statType)
)ENGINE=INNODB
;



-- 
-- INDEX: Championship
--

CREATE INDEX ChampIndex ON CLUB_CHAMPIONSHIPS(ChampionshipYear)
;
-- 
-- INDEX: Club Champion 
--

CREATE INDEX ClubChampIndex ON CLUB_CHAMPIONSHIPS(clubID)
;
-- 
-- INDEX: Club
--

CREATE INDEX ClubIndex ON CLUB_STADIUM(clubID)
;
-- 
-- INDEX: Stadium
--

CREATE INDEX StadiumIndex ON CLUB_STADIUM(stadiumID)
;
-- 
-- INDEX: Home Team
--

CREATE INDEX HomeIndex ON GAME(homeTeam)
;
-- 
-- INDEX: Away Team
--

CREATE INDEX AwayIndex ON GAME(awayTeam)
;
-- 
-- INDEX: Head-Coach CLub 
--

CREATE INDEX CoachClubIndex ON `HEAD-COACH_CLUB`(clubID)
;
-- 
-- INDEX: Club Head-Coach 
--

CREATE INDEX ClubCoachIndex ON `HEAD-COACH_CLUB`(coachID)
;
-- 
-- INDEX:  Player Club
--

CREATE INDEX PClubIndex ON PLAYER__CLUB(clubID)
;
-- 
-- INDEX: Club Player 
--

CREATE INDEX CPlayerIndex ON PLAYER__CLUB(playerID)
;
-- 
-- INDEX: Game
--

CREATE INDEX GameIndex ON PLAYER_STATISTICS_GAME(gameID)
;
-- 
-- INDEX: Player Statistics 
--

CREATE INDEX PStatsIndex ON PLAYER_STATISTICS_GAME(playerID)
;
-- 
-- INDEX: Statistic Type 
--

CREATE INDEX StatTypeIndex ON PLAYER_STATISTICS_GAME(statType)
;
-- 
-- TABLE: CLUB_CHAMPIONSHIPS 
--

ALTER TABLE CLUB_CHAMPIONSHIPS ADD CONSTRAINT RefCHAMPIONSHIP19 
    FOREIGN KEY (ChampionshipYear)
    REFERENCES CHAMPIONSHIP(ChampionshipYear)
;

ALTER TABLE CLUB_CHAMPIONSHIPS ADD CONSTRAINT RefCLUB31 
    FOREIGN KEY (clubID)
    REFERENCES CLUB(clubID)
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


