@echo off
cd /d "%~dp0"
where py >nul 2>nul
if not errorlevel 1 (
  start "Bus Company Simulator server" /D "%~dp0" py -m http.server 8001 --bind 0.0.0.0
) else (
  where python >nul 2>nul
  if errorlevel 1 (
    echo Python was not found. Install Python, then run this file again.
    pause
    exit /b 1
  )
  start "Bus Company Simulator server" /D "%~dp0" python -m http.server 8001 --bind 0.0.0.0
)
timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:8001/index.html"
