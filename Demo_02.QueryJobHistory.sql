USE msdb;
GO

SELECT 
	j.[name] AS 'Job Name'
,	js.step_id AS 'Step'
,	js.step_name AS 'Step Name'
,	dbo.agent_datetime(run_date, run_time) AS 'Run Date'
,	((run_duration/10000*3600 + (run_duration/100)%100*60 + run_duration%100 + 31 ) / 60) AS 'Duration' 
FROM dbo.sysjobs AS j 
INNER JOIN dbo.sysjobsteps AS js ON j.job_id = js.job_id 
INNER JOIN dbo.sysjobhistory as h 
ON	js.job_id = h.job_id 
AND js.step_id = h.step_id 
AND h.step_id <> 0 
WHERE j.[enabled] = 1 
ORDER BY 'Job Name', 'Run Date' DESC; 