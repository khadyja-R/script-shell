
param (
    [string]$shortcutFolderPath = "C:\shortcuts",
    [string]$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop"),
    [string]$savedFolderPathDest = [System.IO.Path]::Combine($desktopPath, "saved")
)

# Remove all items from the desktop, excluding the "saved" folder
Get-ChildItem -Path $desktopPath | Where-Object { $_.FullName -ne $savedFolderPathDest } | Remove-Item -Recurse -Force

# Copy the new shortcuts to the desktop
$shortcutFiles = Get-ChildItem -Path $shortcutFolderPath -Filter *.lnk
foreach ($shortcutFile in $shortcutFiles) {
    $shortcutDestination = [System.IO.Path]::Combine($desktopPath, $shortcutFile.Name)
    Copy-Item $shortcutFile.FullName -Destination $shortcutDestination
}

# Create the "saved" folder if it doesn't exist
if (-not (Test-Path $savedFolderPathDest)) {
    New-Item -ItemType Directory -Path $savedFolderPathDest | Out-Null
}

Write-Host "Desktop cleanup and shortcut recreation completed."
