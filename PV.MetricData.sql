CREATE TABLE [PV].[MetricData]
(
    Id INT PRIMARY KEY,
    [Value] FLOAT,
    MetricId INT NOT NULL,
    RecordedAt TIMESTAMP,
    CONSTRAINT FK_MetricData_Metric FOREIGN KEY (MetricId) REFERENCES [PV].[Metrics](Id)
);
