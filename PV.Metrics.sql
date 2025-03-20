CREATE TABLE [PV].[Metrics]
(
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255),
    [Description] VARCHAR(255),
    CreatedAt TIMESTAMP,
    UserId INT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES [PV].[Users](Id)
);