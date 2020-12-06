do
{
    Write-Host "Downloading SQL Server..."
    Start-Sleep 30
    $SQLDownloadProcess = Get-Process | Where-Object {$_.ProcessName -eq "SQL-SSEI-Eval"}
}
while ($SQLDownloadProcess)

Write-Host "SQL Server has been downloaded"
