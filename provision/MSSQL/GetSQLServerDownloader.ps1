#Get SQL Server downloader
$MSSQLDownloaded = Test-Path "C:\SQL-SSEI-Eval.exe"
if ($MSSQLDownloaded -eq $false)
{
    Invoke-WebRequest -Uri "https://download.microsoft.com/download/4/8/6/486005eb-7aa8-4128-aac0-6569782b37b0/SQL2019-SSEI-Eval.exe" -OutFile "C:\SQL-SSEI-Eval.exe"
}

#Download SQL Server
$MSSQLDownloaded = Test-Path "C:\SQL"
if ($MSSQLDownloaded -eq $false)
{
    C:\SQL-SSEI-Eval.exe /Action=Download /Mediatype=ISO /Language=en-US /Mediapath=C:\SQL /Verbose /Quiet
}
