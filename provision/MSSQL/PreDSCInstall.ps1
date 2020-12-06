Install-Module -Name SqlServerDsc -Force

#Mount MSSQL ISO
$MSSQLISO = Get-ChildItem -Path "C:\SQL\" | Where-Object {$_.FullName -match "SQLServer"}
Mount-DiskImage $MSSQLISO.FullName
