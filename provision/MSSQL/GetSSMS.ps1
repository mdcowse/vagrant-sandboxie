#Get SQL Server Management Studio
$SSMSDownloaded = Test-Path "C:\SSMS-Setup-ENU.exe"
if ($SSMSDownloaded -eq $false)
{
    Invoke-WebRequest -Uri "https://download.microsoft.com/download/2/d/1/2d12f6a1-e28f-42d1-9617-ac036857c5be/SSMS-Setup-ENU.exe" -OutFile "C:\SSMS-Setup-ENU.exe"
}

#Install SQL Server Management Studio
cmd /c "C:\SSMS-Setup-ENU.exe" /Quiet
