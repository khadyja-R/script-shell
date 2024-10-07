



if ((Get-Date).DayOfWeek -eq 'Saturday' -or (Get-Date).DayOfWeek -eq 'Wednesday') {
    & "C:\shortcuts\script1.ps1" -shortcutFolderPath "C:\shortcuts" -desktopPath "$env:USERPROFILE\Desktop" -savedFolderPathDest "$env:USERPROFILE\Desktop\saved"
} else {

    Write-Host "Today is not Saturday  or Wednesday. Skipping desktop cleanup."
}
