# ========================================================================================================
# Teil 14: Registry Einstellungen für Desktop Symbole
# ========================================================================================================
Write-Step "Konfiguriere Desktopsymbole (Dieser PC, Benutzerordner)..."

if (Confirm-Step "Outlook Registry-Einstellungen setzen")
{
    $desktopRegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"

    # Sicherstellen, dass der Registry-Schlüssel existiert
    if (!(Test-Path $desktopRegPath))
    {
        New-Item -Path $desktopRegPath -Force | Out-Null
    }

    # Symbole definieren: Name des Registry-Keys und der gewünschte Zielwert (0 = anzeigen)
    $icons = @{
        "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" = "Dieser PC"
        "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" = "Benutzerordner"
    }

    foreach ($guid in $icons.Keys)
    {
        $currentValue = Get-ItemProperty -Path $desktopRegPath -Name $guid -ErrorAction SilentlyContinue

        # Prüfen, ob der Wert gesetzt ist (null oder 1 bedeutet: nicht wie gewünscht)
        if ($null -eq $currentValue -or $currentValue.$guid -ne 0)
        {
            Set-ItemProperty -Path $desktopRegPath -Name $guid -Value 0 -Type DWord -Force
            Write-Host "==> Success - $($icons[$guid]) aktiviert." -ForegroundColor Green
            $restart_explorer = $true
        }
    }
}
