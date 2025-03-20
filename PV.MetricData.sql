CREATE TABLE [PV].[MetricData]
(
    Id INT PRIMARY KEY,
    [Value] FLOAT,
    MetricId INT NOT NULL,
    RecordedAt TIMESTAMP,
    FOREIGN KEY (MetricId) REFERENCES [PV].[Metrics](Id)
);
