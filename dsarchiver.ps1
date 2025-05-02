
# Change [USER] to user profile name
# Change [SaveID] to game Save ID (numeric)
function DSArchiver
{
    Clear-Host
    
    # locals
    $SourceDir = "C:\Users\[USER]\Documents\NBGI\DARK SOULS REMASTERED\[SaveID]"
    $BackupDir = "C:\Users\[USER]\Documents\NBGI\DARK SOULS REMASTERED\Backup"
    $MaxBackups = 5 # 5 backups
    $IntervalSeconds = 600  # 10 minutes between backups

    # Make sure absolute path exists
    if (-not (Test-Path $BackupDir)) {
        New-Item -ItemType Directory -Path $BackupDir | Out-Null
    }

    $lastBackupTime = $null

    # loop this shit
    while ($true) {
        $usageStatus = if (Test-PathInUse -Path $SourceDir) { "Path IN USE" } else { "Path not in use" }
        $lastTimeStr = if ($lastBackupTime) { $lastBackupTime.ToString("HH:mm:ss") } else { "Never" }

        # Show count-down timer
        for ($i = 0; $i -lt $IntervalSeconds; $i++) {
            $remaining = [TimeSpan]::FromSeconds($IntervalSeconds - $i)

            # like clear host but has double buffer, prevents flickering
            [System.Console]::SetCursorPosition(0,0)

            # template to output, 
            $output = @"
                $([char]27)[38;5;214mMonitoring:$([char]27)[0m $([char]27)[38;5;227m$SourceDir$([char]27)[0m
                $([char]27)[38;5;214mUsage:$([char]27)[0m $([char]27)[38;5;209m$usageStatus$([char]27)[0m
                $([char]27)[38;5;214mLast Backup:$([char]27)[0m $([char]27)[38;5;117m$lastTimeStr$([char]27)[0m
                $([char]27)[38;5;214mTime until backup:$([char]27)[0m $([char]27)[38;5;82m{0:hh\:mm\:ss}$([char]27)[0m
"@ -f $remaining

            # this re-writes itself so there are no additional outputs
            Write-Host ""
            Write-Host $output -NoNewline
            Start-Sleep -Seconds 1
        }

        # timestamp the zip files
        $timestamp = Get-Date -Format "MMdd_hhmm"
        $zipName = "Backup_$timestamp.zip"
        $zipPath = Join-Path $BackupDir $zipName

        # archive
        Compress-Archive -Path $SourceDir -DestinationPath $zipPath -Force
        $lastBackupTime = Get-Date

        # lathe rinse repeat
        $backups = Get-ChildItem -Path $BackupDir -Filter "Backup_*.zip" | Sort-Object LastWriteTime -Descending
        if ($backups.Count -gt $MaxBackups) {
            $backups | Select-Object -Skip $MaxBackups | ForEach-Object {
                Remove-Item $_.FullName -Force
            }
        }

        # let user know file was backed up
        Write-Host "`nBackup completed: $zipName`n"
        Start-Sleep -Seconds 4
    }
}
