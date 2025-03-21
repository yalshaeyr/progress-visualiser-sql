CREATE TABLE [PV].[MetricData]
(
    Id INT PRIMARY KEY,
    [Value] FLOAT,
    MetricId INT NOT NULL,
    RecordedAt DATETIMEOFFSET,
    CONSTRAINT FK_MetricData_Metric FOREIGN KEY (MetricId) REFERENCES [PV].[Metrics](Id)
);
