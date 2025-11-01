@echo off
REM Code Fix Deployment Script for Windows
REM This script handles deployment to various platforms

setlocal enabledelayedexpansion

echo 🚀 Code Fix Deployment Script
echo ==============================

REM Function to check if Node.js is installed
:check_node
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed. Please install Node.js 16+ first.
    exit /b 1
)

for /f "tokens=1 delims=v" %%i in ('node --version') do set NODE_VERSION=%%i
echo [SUCCESS] Node.js %NODE_VERSION% detected
goto :eof

REM Function to check if Docker is installed
:check_docker
where docker >nul 2>nul
if %errorlevel% neq 0 (
    echo [WARNING] Docker is not installed. Docker deployment will not be available.
    exit /b 1
)

for /f "tokens=3 delims= " %%i in ('docker --version') do set DOCKER_VERSION=%%i
echo [SUCCESS] Docker %DOCKER_VERSION% detected
goto :eof

REM Function to install dependencies
:install_deps
echo [INFO] Installing dependencies...
call npm ci --only=production
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install dependencies
    exit /b 1
)
echo [SUCCESS] Dependencies installed successfully
goto :eof

REM Function to build for production
:build_production
echo [INFO] Preparing production build...

if not exist ".env" (
    copy ".env.example" ".env"
    echo [WARNING] Created .env file from .env.example. Please review and update as needed.
)

echo [SUCCESS] Production build prepared
goto :eof

REM Local deployment
:deploy_local
echo [INFO] Starting local deployment...

call :check_node
if %errorlevel% neq 0 exit /b 1

call :install_deps
if %errorlevel% neq 0 exit /b 1

call :build_production
if %errorlevel% neq 0 exit /b 1

echo [SUCCESS] Local deployment ready!
echo [INFO] Run 'npm start' to start the server
echo [INFO] Application will be available at: http://localhost:3002
goto :eof

REM Docker deployment
:deploy_docker
echo [INFO] Starting Docker deployment...

call :check_docker
if %errorlevel% neq 0 (
    echo [ERROR] Docker is required for Docker deployment
    exit /b 1
)

echo [INFO] Building Docker image...
docker build -t code-fix:latest .
if %errorlevel% neq 0 (
    echo [ERROR] Failed to build Docker image
    exit /b 1
)

echo [INFO] Starting Docker container...
docker-compose up -d
if %errorlevel% neq 0 (
    echo [ERROR] Failed to start Docker container
    exit /b 1
)

echo [SUCCESS] Docker deployment completed!
echo [INFO] Application is running at: http://localhost:3002
echo [INFO] Use 'docker-compose logs -f' to view logs
echo [INFO] Use 'docker-compose down' to stop the application
goto :eof

REM Health check
:health_check
echo [INFO] Running health check...

if exist "healthcheck.js" (
    node healthcheck.js
    if %errorlevel% equ 0 (
        echo [SUCCESS] Health check passed
    ) else (
        echo [ERROR] Health check failed
        exit /b 1
    )
) else (
    echo [WARNING] Health check script not found
)
goto :eof

REM Main function
:main
set DEPLOY_TYPE=%1
if "%DEPLOY_TYPE%"=="" set DEPLOY_TYPE=local

if "%DEPLOY_TYPE%"=="local" (
    call :deploy_local
) else if "%DEPLOY_TYPE%"=="docker" (
    call :deploy_docker
) else if "%DEPLOY_TYPE%"=="health" (
    call :health_check
) else (
    echo Usage: %0 {local^|docker^|health}
    echo.
    echo Deployment options:
    echo   local    - Deploy locally with Node.js
    echo   docker   - Deploy using Docker containers
    echo   health   - Run health check
    echo.
    echo Examples:
    echo   %0 local    # Local development deployment
    echo   %0 docker   # Production Docker deployment
    exit /b 1
)

goto :eof

REM Call main function
call :main %*