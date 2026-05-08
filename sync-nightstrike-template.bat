@echo off
echo =====================================
echo HTR NIGHTSTRIKE TEMPLATE SYNC
echo =====================================
echo.

set SOURCE=D:\Parsons-Cross
set TARGET=D:\NightStrike

echo Syncing template files...
echo.

robocopy "%SOURCE%" "%TARGET%" /E ^
/XF CNAME ^
/XD covers images .git node_modules

echo.
echo =====================================
echo TEMPLATE FILES COPIED
echo =====================================
echo.

powershell -Command ^
"(Get-ChildItem '%TARGET%' -Recurse -File | ForEach-Object { ^
$content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue; ^
if($content){ ^
$content = $content -replace 'Parsons Cross','NightStrike'; ^
$content = $content -replace 'parsons-cross','nightstrike'; ^
Set-Content $_.FullName $content -Encoding UTF8 ^
} ^
})"

echo.
echo =====================================
echo TEXT REPLACEMENTS COMPLETE
echo =====================================
echo.

echo IMPORTANT:
echo.
echo You still need to:
echo 1. Verify songs/videos/streaming links
echo 2. Verify logo and hero image paths
echo 3. Run D:\NightStrike\update.bat
echo.

pause
