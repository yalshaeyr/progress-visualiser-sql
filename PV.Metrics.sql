CREATE TABLE [PV].[Metrics]
(
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255),
    [Description] VARCHAR(255),
    Unit VARCHAR(255),
    CreatedAt TIMESTAMP,
    UserId INT NOT NULL,
    CONSTRAINT FK_Metrics_User FOREIGN KEY (UserId) REFERENCES [PV].[Users](Id)
);