#Get Test DB
$DBDownloaded = Test-Path "C:\AdventureWorks2019.bak"
if ($DBDownloaded -eq $false)
{
    Invoke-WebRequest -Uri "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak" -OutFile "C:\AdventureWorks2019.bak"
}
