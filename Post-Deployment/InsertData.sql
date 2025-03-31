-- Merge user
MERGE INTO [PV].[Users] AS Target
USING (VALUES ('Jane Doe')) AS Source (Username)
ON Target.Username = Source.Username
WHEN NOT MATCHED THEN
    INSERT (Username, CreatedAt)
    VALUES (Source.Username, CURRENT_TIMESTAMP);

-- Merge metrics
MERGE INTO [PV].[Metrics] AS Target
USING (
    VALUES 
        ('Work', 'Total hours worked in a day', 'Hours', 1),
        ('Exercise', 'Total hours exercised in a day', 'Hours', 1)
) AS Source ([Name], [Description], [Unit], UserId)
ON Target.[Name] = Source.[Name] AND Target.UserId = Source.UserId
WHEN NOT MATCHED THEN
    INSERT ([Name], [Description], [Unit], CreatedAt, UserId)
    VALUES (Source.[Name], Source.[Description], Source.[Unit], CURRENT_TIMESTAMP, Source.UserId);

-- Merge metric data
MERGE INTO [PV].[MetricData] AS Target
USING (
    VALUES 
        (8.0, 1, '2024-01-01 08:00:00'),
        (7.5, 1, '2024-01-02 08:00:00'),
        (9.0, 1, '2024-01-03 08:00:00'),
        (8.5, 1, '2024-01-04 08:00:00'),
        (7.0, 1, '2024-01-05 08:00:00'),
        (1.0, 2, '2024-01-01 08:00:00'),
        (1.5, 2, '2024-01-02 08:00:00'),
        (2.0, 2, '2024-01-03 08:00:00'),
        (1.0, 2, '2024-01-04 08:00:00'),
        (1.5, 2, '2024-01-05 08:00:00')
) AS Source ([Value], MetricId, RecordedAt)
ON Target.MetricId = Source.MetricId AND Target.RecordedAt = Source.RecordedAt
WHEN NOT MATCHED THEN
    INSERT ([Value], MetricId, RecordedAt)
    VALUES (Source.[Value], Source.MetricId, Source.RecordedAt);