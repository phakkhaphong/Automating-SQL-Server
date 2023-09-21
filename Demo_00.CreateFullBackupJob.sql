USE [master]
GO
EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'AdventureworksBackup', @physicalname = N'D:\Backups\Adventureworks.bak'
GO

BACKUP DATABASE [AdventureWorks] 
TO  [AdventureworksBackup] 
WITH FORMAT, MEDIANAME = N'myMedia', COMPRESSION;
GO


BACKUP DATABASE [AdventureWorks] 
TO  [AdventureworksBackup] 
WITH INIT, MEDIANAME = N'myMedia', COMPRESSION;
GO
