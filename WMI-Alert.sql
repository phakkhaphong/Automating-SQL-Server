EXEC msdb.dbo.sp_add_alert @name=N'WMI - Adventureworks DDL Events', 
	@message_id=0 
,	@severity=0 
,	@enabled=1 
,	@delay_between_responses=15 
,	@include_event_description_in=1 
,	@notification_message=N'WMI - Adventureworks Change notification' 
,	@wmi_namespace=N'\\.\root\Microsoft\SqlServer\ServerEvents\MSSQLSERVER' 
,	@wmi_query=N'SELECT * from DDL_DATABASE_EVENTS WHERE DatabaseName = ''AdventureWorks''' 
,	@job_name='Adventureworks - TLOG Backup'
GO