@echo off
title Cast Server - Quick HTTPS Tunnel

echo ====================================
echo    Quick HTTPS Tunnel for Cast
echo ====================================
echo.

REM Check if cloudflared is installed
where cloudflared >nul 2>&1
if errorlevel 1 (
    echo ❌ cloudflared not found. Installing with winget...
    winget install --id Cloudflare.cloudflared
    if errorlevel 1 (
        echo ❌ Failed to install cloudflared
        echo Please install manually from: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/
        pause
        exit /b 1
    )
)

echo ✅ cloudflared found

echo.
echo 🚀 Starting Quick Tunnel (no authentication needed)...
echo This will create a temporary HTTPS URL for testing
echo.
echo The tunnel will forward HTTPS requests to our HTTP server on port 8009
echo.

REM Start quick tunnel - no authentication needed
cloudflared tunnel --url http://192.168.1.58:8009
