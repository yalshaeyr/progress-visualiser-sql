CREATE TABLE [PV].[Metrics]
(
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Name] VARCHAR(255),
    [Description] VARCHAR(255),
    CreatedAt DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET(),
    UserId INT NOT NULL,
    CONSTRAINT FK_Metrics_User FOREIGN KEY (UserId) REFERENCES [PV].[Users](Id),
    CONSTRAINT UQ_Metrics_Name UNIQUE ([Name])
);