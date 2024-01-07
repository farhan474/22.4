
CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(255) NOT NULL,
    TeamLocation VARCHAR(255)
);


CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(255) NOT NULL,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);


CREATE TABLE Referee (
    RefereeID INT PRIMARY KEY,
    RefereeName VARCHAR(255) NOT NULL
);


CREATE TABLE Season (
    SeasonID INT PRIMARY KEY,
    SeasonStartDate DATE,
    SeasonEndDate DATE
);


CREATE TABLE Match (
    MatchID INT PRIMARY KEY,
    MatchDate DATE,
    Team1ID INT,
    Team2ID INT,
    RefereeID INT,
    SeasonID INT,
    FOREIGN KEY (Team1ID) REFERENCES Team(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES Team(TeamID),
    FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID),
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID)
);


CREATE TABLE Goal (
    GoalID INT PRIMARY KEY,
    MatchID INT,
    PlayerID INT,
    GoalTime INT,
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);


CREATE TABLE Standings (
    StandingsID INT PRIMARY KEY,
    SeasonID INT,
    TeamID INT,
    Wins INT,
    Losses INT,
    Draws INT,
    Points INT,
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);
