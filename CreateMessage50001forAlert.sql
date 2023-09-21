EXEC sp_addmessage 50001,16,'Error Detect by %s'
GO

EXEC sp_altermessage 50001,'WITH_LOG',TRUE
GO


SELECT * FROM sys.messages WHERE message_id=50001
GO


RAISERROR(50001,16,56,'AKE')