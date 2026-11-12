@echo off
chcp 1252 >nul
setlocal enabledelayedexpansion
title Instalador de la traducción al español de Cisco Packet Tracer

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [Aviso] Solicitando permisos de administrador...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    cd /d "%~dp0"

color 0A
echo =====================================================================
echo         Instalador de la traducción al español
echo         Cisco Packet Tracer
echo =====================================================================
echo.

set "ptlFile="
for %%f in ("%~dp0*.ptl") do (
    set "ptlFile=%%~f"
    set "ptlName=%%~nxf"
)

if not "%ptlFile%"=="" goto FoundPTL

echo [X] Error: No se ha encontrado ningún archivo .ptl en el directorio del script.
pause
exit /b 1

:FoundPTL
echo [OK] Paquete de traducción a instalar: %ptlName%
echo.

echo ¿A qué versión de Cisco Packet Tracer desea aplicar la traducción?
echo    [1] 9.0.1 (última versión)
echo    [2] 9.0.0
echo    [3] 8.2.2
echo    [4] Todas las versiones encontradas (no recomendado)
echo    [0] Salir sin instalar
echo.
set /p versionChoice=Introduzca el número (0-4): 

if "%versionChoice%"=="0" goto ExitNoInstall
if "%versionChoice%"=="1" goto Set901
if "%versionChoice%"=="2" goto Set900
if "%versionChoice%"=="3" goto Set822
if "%versionChoice%"=="4" goto SetAll

echo [X] Opción no válida. Saliendo.
pause
exit /b 1

:ExitNoInstall
echo.
echo [X] Instalación cancelada por el usuario. No se ha modificado nada.
echo.
pause
color
exit /b 0

:Set901
set "versionFilter=9.0.1"
goto VersionSelected

:Set900
set "versionFilter=9.0.0"
goto VersionSelected

:Set822
set "versionFilter=8.2.2"
goto VersionSelected

:SetAll
set "versionFilter="
goto VersionSelected

:VersionSelected
if not defined versionFilter goto NoFilter

echo.
echo Se buscarán instalaciones de la versión !versionFilter!.
goto ContinueScan

:NoFilter
echo.
echo Se buscarán TODAS las instalaciones (no recomendado).

:ContinueScan
echo.
echo Escaneando automáticamente el directorio de instalación de Cisco Packet Tracer...
echo.

set "installedCount=0"
set "skippedCount=0"
set "abortFlag=0"
set "lastExePath="

if "%versionChoice%"=="1" goto Scan901
if "%versionChoice%"=="2" goto Scan900
if "%versionChoice%"=="3" goto Scan822
if "%versionChoice%"=="4" goto ScanAll

:Scan901
if exist "C:\Program Files\Cisco Packet Tracer 9.0.1\languages" call :CallProcess "C:\Program Files\Cisco Packet Tracer 9.0.1"
if exist "C:\Program Files (x86)\Cisco Packet Tracer 9.0.1\languages" call :CallProcess "C:\Program Files (x86)\Cisco Packet Tracer 9.0.1"
if exist "D:\Program Files\Cisco Packet Tracer 9.0.1\languages" call :CallProcess "D:\Program Files\Cisco Packet Tracer 9.0.1"
if exist "D:\Program Files (x86)\Cisco Packet Tracer 9.0.1\languages" call :CallProcess "D:\Program Files (x86)\Cisco Packet Tracer 9.0.1"
goto AfterScan

:Scan900
if exist "C:\Program Files\Cisco Packet Tracer 9.0.0\languages" call :CallProcess "C:\Program Files\Cisco Packet Tracer 9.0.0"
if exist "C:\Program Files (x86)\Cisco Packet Tracer 9.0.0\languages" call :CallProcess "C:\Program Files (x86)\Cisco Packet Tracer 9.0.0"
if exist "D:\Program Files\Cisco Packet Tracer 9.0.0\languages" call :CallProcess "D:\Program Files\Cisco Packet Tracer 9.0.0"
if exist "D:\Program Files (x86)\Cisco Packet Tracer 9.0.0\languages" call :CallProcess "D:\Program Files (x86)\Cisco Packet Tracer 9.0.0"
goto AfterScan

:Scan822
if exist "C:\Program Files\Cisco Packet Tracer 8.2.2\languages" call :CallProcess "C:\Program Files\Cisco Packet Tracer 8.2.2"
if exist "C:\Program Files (x86)\Cisco Packet Tracer 8.2.2\languages" call :CallProcess "C:\Program Files (x86)\Cisco Packet Tracer 8.2.2"
if exist "D:\Program Files\Cisco Packet Tracer 8.2.2\languages" call :CallProcess "D:\Program Files\Cisco Packet Tracer 8.2.2"
if exist "D:\Program Files (x86)\Cisco Packet Tracer 8.2.2\languages" call :CallProcess "D:\Program Files (x86)\Cisco Packet Tracer 8.2.2"
goto AfterScan

:ScanAll
for %%d in (C D E F G H I J K) do (
    if "%abortFlag%"=="1" goto AfterScan
    if exist "%%d:\" (
        for /d %%p in ("%%d:\Program Files\Cisco Packet Tracer*") do (
            call :CallProcess "%%~fp"
        )
        for /d %%p in ("%%d:\Program Files (x86)\Cisco Packet Tracer*") do (
            call :CallProcess "%%~fp"
        )
    )
)
goto AfterScan

:AfterScan
if "%abortFlag%"=="1" goto Aborted
if not %installedCount% equ 0 goto FinishInstall
if not %skippedCount% equ 0 goto FinishInstall

echo.
echo [!] No se ha encontrado automáticamente ninguna instalación compatible.
echo Introduzca manualmente la ruta de instalación (por ejemplo, C:\Program Files\Cisco Packet Tracer 9.0.1):
set /p customPath=Ruta: 
if defined customPath set customPath=%customPath:"=%
if exist "%customPath%\languages" (
    call :CallProcess "%customPath%"
    goto FinishInstall
)

echo [X] No se ha encontrado la carpeta languages en el directorio especificado.
pause
exit /b 1

:: ============================================================================
:: SUBRUTINA: envoltorio que comprueba abortFlag antes de procesar
:: ============================================================================
:CallProcess
if "%abortFlag%"=="1" goto :eof
call :ProcessOne "%~1"
goto :eof

:: ============================================================================
:: SUBRUTINA: procesar una instalación concreta
:: ============================================================================
:ProcessOne
set "installPath=%~1"

if not exist "%installPath%\languages" goto :eof

if exist "%installPath%\languages\%ptlName%" (
    echo.
    echo   [AVISO] El archivo %ptlName% ya existe en:
    echo           !installPath!\languages\
    echo.
    echo   ¿Qué desea hacer?
    echo      [S] Sobrescribir (reemplazar el archivo existente)
    echo      [N] Omitir esta instalación (no tocar el archivo)
    echo      [X] Salir del instalador
    echo.
    set /p overwriteChoice=Seleccione una opción (S/N/X): 
    
    if /i "!overwriteChoice!"=="S" goto DoOverwrite
    if /i "!overwriteChoice!"=="N" goto DoSkip
    if /i "!overwriteChoice!"=="X" goto DoExit
    echo [X] Opción no válida. Omitiendo esta instalación.
    goto DoSkip
)

:DoOverwrite
echo.
echo   [Directorio encontrado] !installPath!\languages
echo   [Sobrescribiendo] Reemplazando el archivo existente...
copy /y "%ptlFile%" "%installPath%\languages\" >nul
if %errorlevel% equ 0 (
    set /a installedCount+=1
    echo   [+] Traducción desplegada correctamente en esta versión.
    if exist "%installPath%\bin\PacketTracer.exe" set "lastExePath=%installPath%\bin\PacketTracer.exe"
) else (
    echo   [X] Error al copiar el archivo. ¿Tiene permisos de administrador?
)
goto :eof

:DoSkip
echo   [Omitido] No se ha modificado el archivo existente.
set /a skippedCount+=1
color
goto :eof

:DoExit
set "abortFlag=1"
echo.
echo [X] Instalación cancelada por el usuario.
color
goto :eof

:: ============================================================================
:: FINALIZACIÓN
:: ============================================================================
:FinishInstall
echo.
echo =====================================================================
echo   Proceso completado.
echo   Instalaciones realizadas: %installedCount%
echo   Instalaciones omitidas: %skippedCount%
echo =====================================================================
echo.

if %installedCount% equ 0 goto NoInstall

echo [Pasos para activar la traducción]:
echo   1. Abra el software Cisco Packet Tracer;
echo   2. Haga clic en el menú superior: Options -^> Preferences (Preferencias);
echo   3. En la lista de idiomas de la esquina inferior derecha, seleccione el
echo      paquete de idioma recién instalado;
echo   4. Haga clic en el botón "Change Language" de la esquina inferior derecha;
echo   5. Cierre y reinicie el software para aplicar los cambios.
echo.
echo ---------------------------------------------------------------------
goto LaunchPT

:NoInstall
echo [AVISO] No se ha instalado ninguna traducción.
echo.
echo ---------------------------------------------------------------------
goto LaunchPT

:Aborted
echo.
echo =====================================================================
echo   Instalación cancelada por el usuario.
echo   Instalaciones realizadas antes de cancelar: %installedCount%
echo   Instalaciones omitidas antes de cancelar: %skippedCount%
echo =====================================================================
echo.
echo ---------------------------------------------------------------------

:LaunchPT
if not defined lastExePath goto EndScript

set /p launchNow=¿Desea iniciar Cisco Packet Tracer ahora para verificar la traducción? (S/N): 
if /i "%launchNow%"=="S" (
    start "" "%lastExePath%"
)

:EndScript
pause
color
exit /b 0