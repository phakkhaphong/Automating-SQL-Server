USE msdb; 
GO 

EXEC sp_add_job 
	@job_name = 'Adventureworks database backup'
,	@enabled = 1
,	@description = 'Backup the Adventureworks database';
GO 

EXEC sp_add_jobstep 
	@job_name = 'Adventureworks database backup'
,	@step_name = 'Backup the Adventureworks database'
,	@subsystem = 'TSQL'
,	@command=
	'BACKUP DATABASE [AdventureWorks] 
	TO  DISK = ''D:\Backups\Adventureworks.bak'' 
	WITH  INIT,  MEDIANAME = N''myMedia'', COMPRESSION'
,	@retry_attempts = 2
,	@retry_interval = 2; 
GO 

EXEC sp_add_jobserver 
	@job_name = 'Adventureworks database backup'
,	@server_name = '(local)';

EXEC sp_add_schedule 
	@schedule_name = 'Every 1 hour Daytime'
,	@freq_type = 4
,	@freq_interval = 1
,	@freq_subday_type = 0x8
,	@freq_subday_interval = 1
,	@active_start_time = 080000
,	@active_end_time = 170000; 
GO 

EXEC sp_attach_schedule 
	@job_name = 'Adventureworks database backup'
,	@schedule_name = 'Every 1 hour Daytime'; 
GO 