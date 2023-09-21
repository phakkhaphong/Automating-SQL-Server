SELECT * FROM sys.messages
WHERE message_id=8134
GO

EXEC sp_altermessage 8134,'WITH_LOG',TRUE
GO
SELECT * FROM sys.messages
WHERE message_id=8134
GO