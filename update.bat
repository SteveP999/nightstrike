@echo off
echo.
echo ==========================================
echo  HTR Update - nightstrike
echo ==========================================
echo.

git add .

echo.
git status
echo.

set /p msg=Commit message (Enter = update artist site): 
if "%msg%"=="" set msg=update artist site

git commit -m "%msg%"
git push

if errorlevel 1 (
  echo.
  echo ERROR: Push failed.
  pause
  exit /b 1
)

echo.
echo ==========================================
echo  SUCCESS! nightstrike is live.
echo ==========================================
echo.
pause
