# Windows 11 Grundskript

Ein Satz von PowerShell-Skripten und Konfigurationsdateien, um Windows-Installationen konsequent auf einen bestimmten Stand zu bringen. Es entfernt außerdem unerwünschte vorinstallierte Windows 11 Services.

## 🚀 Funktionen

- **Vollständig anpassbar:** Apps werden über einfache Textdateien gesteuert.
- **Automatisierung:** Einfacher Start über eine Batch-Datei (`.bat`) mit Administratorrechten.
- **Sauberes System:** Entfernt Überreste von Bing, Xbox, Teams und Telemetrie-bezogenen Apps.

## 📂 Dateistruktur

- `execute_grundskript.bat`: Der "One-Click" Starter. Ruft das PowerShell-Skript mit den richtigen Berechtigungen auf.
- `windows_grundskript.ps1`: Das Hauptskript, welches die Listen einliest und die Deinstallation durchführt.
- `apps_standard.txt`: Liste aller zu entfernenden Apps (inkl. Office).
- `apps_exkl_m365.txt`: Liste aller zu entfernenden Apps (exkl. Office).

## 🛠 Anwendung

### Vorbereitung
1. Lade das Repository herunter oder klone es.
2. Stelle sicher, dass du Administratorrechte auf dem System hast.

### Ausführung
1. Öffne den Ordner.
2. Klicke mit der rechten Maustaste auf `execute_grundskript.bat` und wähle **"Als Administrator ausführen"**.
3. Das Skript erkennt automatisch die Konfigurationsdateien und beginnt mit der Deinstallation der Pakete.

> **Hinweis:** Solltest du Microsoft 365 behalten wollen, stelle sicher, dass das Skript auf die `apps_exkl_m365.txt` zugreift oder benenne die Dateien entsprechend um.

## 📋 Liste der entfernten Apps (Auszug)

Das Skript entfernt unter anderem:
- **Bing:** News, Weather, Search.
- **Xbox:** Game Overlay, Identity Provider, Speech-to-Text.
- **Microsoft 365:** Office Hub, OneNote, Outlook (optional).
- **Sonstiges:** Skype, Clipchamp, Solitaire, Mixed Reality Portal, Feedback Hub, People, Maps.

## ⚠️ Sicherheitshinweis

Die Verwendung erfolgt auf eigene Gefahr. Das Entfernen von System-Apps kann in seltenen Fällen zu unerwartetem Verhalten führen. Es wird empfohlen, vor der Ausführung einen **Systemwiederherstellungspunkt** zu erstellen.

---
**Entwickelt für eine saubere, schnelle und datenschutzfreundliche Windows-Erfahrung.**
