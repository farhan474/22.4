
CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PreferredRegionID INT,
    FOREIGN KEY (PreferredRegionID) REFERENCES Region(RegionID)
);


CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Text TEXT,
    UserID INT,
    Location VARCHAR(255),
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);


CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);


CREATE TABLE PostCategory (
    PostCategoryID INT PRIMARY KEY,
    PostID INT,
    CategoryID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
