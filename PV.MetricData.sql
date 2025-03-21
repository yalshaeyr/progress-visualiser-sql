CREATE TABLE [PV].[MetricData]
(
    Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [Value] FLOAT,
    MetricId INT NOT NULL,
    RecordedAt DATETIMEOFFSET,
    CONSTRAINT FK_MetricData_Metric FOREIGN KEY (MetricId) REFERENCES [PV].[Metrics](Id)
);
