--1.	What year was Real Madrid founded?
;
SELECT     CLUB.clubYearFounded
FROM       CLUB
WHERE     CLUB.clubName = 'Real Madrid'
;
--2.	What position does Sergio Ramos play?


SELECT     PLAYER.playerPosition
FROM       PLAYER
WHERE     PLAYER.playerName = 'Sergio Ramos'
;
--3.	What is the capacity of the Santiago Bernabeu?

SELECT     STADIUM.stadiumCapacity
FROM       STADIUM
WHERE     STADIUM.stadiumName = 'Santiago Bernabeu'
;
--4.	What Nation is Head Coach Carlo Ancelloti from?

SELECT     HEAD-COACH.coachNation
FROM       HEAD-COACH
WHERE     HEAD-COACH.coachName = 'Carlo Ancelloti'
;
--5.	Name all the players who play as Goalkeepers or play as Defenders.

SELECT     PLAYER.playerName
FROM       PLAYER
WHERE     PLAYER.playerPosition = 'Goalkeeper'
OR             PLAYER.playerPosition = 'Defender'
;
--6.	Find the Name and Stadium of the club that resides in Madrid.

SELECT	    CLUB.clubName
    , STADIUM.stadiumName
FROM	    CLUB
JOIN 	    STADIUM
WHERE    CLUB.clubCity = 'Madrid'
AND	    STADIUM.stadiumCity = 'Madrid'
;
--7.	Who won the league championship in 2014?

SELECT     CLUB.clubName
FROM       CLUB, CLUB_CHAMPIONSHIPS
WHERE     CLUB_CHAMPIONSHIPS.championshipYear = '2014'
AND          CLUB_CHAMPIONSHIPS.clubID = CLUB.clubID
;
--8.	Find all Clubs and their stadium that reside in a different city from which their stadium resides in?

SELECT     CLUB.clubName
                  ,STADIUM.stadiumName
FROM       CLUB, CLUB_STADIUM, STADIUM
WHERE     CLUB.clubID = CLUB_STADIUM.clubID
AND          STADIUM.stadiumID = CLUB_STADIUM.stadiumID
AND          CLUB.clubCity != STADIUM.stadiumCity
;
--9.	List all the players, positions and jersey numbers for the players that play on Real Madrid

SELECT     PLAYER.playerName
                  , PLAYER.playerPosition
                  , PLAYER.playerJerseyNumber
FROM       PLAYER, PLAYER__CLUB, CLUB
WHERE     PLAYER__CLUB.playerID = PLAYER.playerID
AND          CLUB.clubID = PLAYER__CLUB.clubID
AND          clubName = 'Real Madrid'
;
--10.	Which player in the league has the greatest Salary and what is his salary?

SELECT     PLAYER.playerName
    , MAX(PLAYER__CLUB.playerSalary)
FROM       PLAYER
	     , PLAYER__CLUB
WHERE    PLAYER.playerID = PLAYER__CLUB.playerID
;