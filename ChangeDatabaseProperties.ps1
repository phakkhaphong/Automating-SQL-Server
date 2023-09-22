#1 Import SQLPS

Clear-Host;
Import-Module SQLPS;

#2 Navigate to the Databases collection in the default instance 

Set-Location SQLSERVER:
Set-Location \SQL\localhost\DEFAULT\Databases;

#3 Get the database that we want to work with

$databaseName = "AdventureWorks";
$database = Get-Item -Path $databaseName;
    
#4 Change some of the database properties
$database.CompatibilityLevel = [Microsoft.SqlServer.Management.Smo.CompatibilityLevel]::Version150;
$database.Alter();
Write-Host "Changed database properties";
Write-Host $database.CompatibilityLevel

#5 Change some of the database options
$database.DatabaseOptions.AnsiNullsEnabled = $false;
$database.DatabaseOptions.AutoShrink = $true;
$database.DatabaseOptions.ReadOnly = $true;
$database.DatabaseOptions.RecoveryModel = [Microsoft.SqlServer.Management.Smo.RecoveryModel]::Full;
$database.Alter();
Write-Host "Changed database options";