#1 Import SQLPS

Clear-Host;
Import-Module SQLPS;

#2 Navigate to the Databases collection in the default instance

cd SQLSERVER:
cd \SQL\localhost;

#3 Get the server object

$server = Get-Item -Path DEFAULT;

#4 Examine the Settings object
 
$server.Settings | Get-Member -MemberType Property;

$server.Settings | Format-List;


#5 Change LoginMode to mixed mode

$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed;
$server.Settings.Alter();
$server.Settings.LoginMode;

#6 Change LoginMode back to Integrated

$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Integrated;
$server.Settings.Alter();
$server.Settings.LoginMode;

#7 Examine the UserOptions object

$userOptions = $server.UserOptions;
$userOptions | Get-Member;
$userOptions | Get-Member -MemberType Property;
$userOptions | Format-List;


#8 Change some properties
 
$userOptions.AnsiNulls = $true;
$userOptions.AnsiPadding = $true;
$userOptions.AnsiWarnings = $true;
$userOptions.QuotedIdentifier = $true;

$userOptions.Alter();

$userOptions | Select-Object -Property AnsiNulls, AnsiPadding, AnsiWarnings, QuotedIdentifier | Format-List;

#9 Change the properties back to their original values

$userOptions.AnsiNulls = $false;
$userOptions.AnsiPadding = $false;
$userOptions.AnsiWarnings = $false;
$userOptions.QuotedIdentifier = $false;

$userOptions.Alter();

$userOptions | Select-Object -Property AnsiNulls, AnsiPadding, AnsiWarnings, QuotedIdentifier | Format-List;
