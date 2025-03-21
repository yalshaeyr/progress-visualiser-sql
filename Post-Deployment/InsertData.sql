-- Insert a user
INSERT INTO [PV].[Users] (Id, Username, CreatedAt)
VALUES (1, 'Jane Doe', CURRENT_TIMESTAMP);

-- Insert two metrics
INSERT INTO [PV].[Metrics] (Id, [Name], [Description], CreatedAt, UserId)
VALUES (1, 'Hours Worked', 'Total hours worked in a day', CURRENT_TIMESTAMP, 1),
       (2, 'Hours Exercised', 'Total hours exercised in a day', CURRENT_TIMESTAMP, 1);

-- Insert at least 10 records for MetricData
INSERT INTO [PV].[MetricData] (Id, Value, MetricId, RecordedAt)
VALUES (1, 8.0, 1, '2024-01-01 08:00:00'),
       (2, 7.5, 1, '2024-01-02 08:00:00'),
       (3, 9.0, 1, '2024-01-03 08:00:00'),
       (4, 8.5, 1, '2024-01-04 08:00:00'),
       (5, 7.0, 1, '2024-01-05 08:00:00'),
       (6, 1.0, 2, '2024-01-01 08:00:00'),
       (7, 1.5, 2, '2024-01-02 08:00:00'),
       (8, 2.0, 2, '2024-01-03 08:00:00'),
       (9, 1.0, 2, '2024-01-04 08:00:00'),
       (10, 1.5, 2, '2024-01-05 08:00:00');
