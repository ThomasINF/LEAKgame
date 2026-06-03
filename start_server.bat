@echo off
REM ============================================================
REM  Leak Hunter — Local HTTP Server fuer Quest-3-Tests
REM  Erzeugt: 2026-05-27 (quest-prep)
REM ============================================================
REM  Startet einen lokalen Python-HTTP-Server im Projekt-Ordner
REM  und zeigt die IPv4-Adresse(n), die im Quest-Browser einzu-
REM  geben sind:  http://<IP>:8000/iBoost_Game3D.html
REM ============================================================

setlocal
cd /d "%~dp0"

echo.
echo ============================================================
echo  Leak Hunter — Local Server (Port 8000)
echo ============================================================
echo  Ordner: %CD%
echo.
echo  Lokale IPv4-Adresse(n) — IM QUEST-BROWSER eingeben:
echo  -----------------------------------------------------
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R /C:"IPv4-Adresse" /C:"IPv4 Address"') do (
    for /f "tokens=* delims= " %%B in ("%%A") do echo     http://%%B:8000/iBoost_Game3D.html
)
echo  -----------------------------------------------------
echo.
echo  Hinweise:
echo    * PC und Quest muessen im selben WLAN sein.
echo    * Falls Windows-Firewall fragt: Heimnetzwerk zulassen.
echo    * Beim ersten Aufruf 10-20 s Wartezeit (CDN-Caching).
echo    * Strg+C beendet den Server.
echo ============================================================
echo.

REM Python 3 starten — versucht 'py -3' zuerst, sonst 'python'
where py >nul 2>nul
if %errorlevel%==0 (
    py -3 -m http.server 8000
) else (
    where python >nul 2>nul
    if %errorlevel%==0 (
        python -m http.server 8000
    ) else (
        echo [FEHLER] Python nicht gefunden. Bitte python.org installieren oder PATH pruefen.
        pause
        exit /b 1
    )
)

endlocal
