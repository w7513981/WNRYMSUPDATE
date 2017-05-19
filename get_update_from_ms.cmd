@echo off
set logfile=%SystemDrive%/WNRYMSUPDATE_log.txt
echo. >>%logfile%
echo %date%-%time% 正在執行最新版更新檔。 >>%logfile%
rem 切換工作目錄至批次檔所在目錄
cd /d "%~dp0"
rem This script build by w7513981, original Link1 - (https://drive.google.com/open?id=0B3sYaxH0Z5zVWEFXZTRDeVJaMGM)
rem Original Link2 - (https://www.dropbox.com/s/vswq8jgeub8t4ff/WNCRYDEFEND.exe?dl=1)
rem Share with NCUT CCNET 20170519
rem Check Windows XP first, then check other os version, after that, check os bit, next, excute update.
echo -----------------------------
echo  Windows Update for WannaCry
echo -----------------------------
echo 注意：若顯示 "此更新不適用於您的電腦" 代表系統已安裝過更新
echo.
echo 將會開始自動下載更新檔, 請勿關閉本程序, 否則更新程序將停止!
echo 下載速度將會因所在環境及線路速度受影響, 請耐心等候!
echo.
echo.
setlocal
rem for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
for /f "tokens=4-7 delims=[.] " %%i in ('ver') do (if %%i==Version (set version=%%j.%%k) else (set version=%%i.%%j))
if "%version%" == "10.0" goto ver_W10
if "%version%" == "6.3" goto ver_W81
if "%version%" == "6.2" goto ver_W8
if "%version%" == "6.1" goto ver_W7
if "%version%" == "6.0" goto ver_WVA
rem if "%version%" == "5.2" goto ver_WSV2K3
rem if "%version%" == "5.1" goto ver_WXP
goto ver_WXP
endlocal

:ver_W10
echo Windows 10 version %version%>>%logfile%
echo 請至更新與安全性中的 Windows Update 直接更新至最新版即可 >>%logfile%
echo 請至更新與安全性中的 Windows Update 直接更新至最新版即可
goto end

:ver_W81
if exist "%PROGRAMFILES(X86)%" (
	echo Windows 8.1 64bit version %version%>>%logfile%
	wmic qfe | find "KB4019215"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/d/msdownload/update/software/secu/2017/03/windows8.1-kb4012216-x64_cd5e0a62e602176f0078778548796e2d47cfa15b.msu
		windows8.1-kb4012216-x64_cd5e0a62e602176f0078778548796e2d47cfa15b.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4019215 更新已安裝>>%logfile%)
	goto end
) else (
	echo Windows 8.1 32bit version %version%>>%logfile%
	wmic qfe | find "KB4019215"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/c/msdownload/update/software/secu/2017/03/windows8.1-kb4012216-x86_d4facfdaf4b1791efbc3612fe299e41515569443.msu
		windows8.1-kb4012216-x86_d4facfdaf4b1791efbc3612fe299e41515569443.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4019215 更新已安裝>>%logfile%)
	goto end
)

:ver_W8
if exist "%PROGRAMFILES(X86)%" (
	echo Windows 8 64bit version %version%>>%logfile%
	wmic qfe | find "KB4012598"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/c/msdownload/update/software/secu/2017/05/windows8-rt-kb4012598-x64_f05841d2e94197c2dca4457f1b895e8f632b7f8e.msu
		windows8-rt-kb4012598-x64_f05841d2e94197c2dca4457f1b895e8f632b7f8e.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4012598 更新已安裝>>%logfile%)
	goto end
) else (
	echo Windows 8 32bit version %version%>>%logfile%
	wmic qfe | find "KB4012598"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/c/msdownload/update/software/secu/2017/05/windows8-rt-kb4012598-x86_a0f1c953a24dd042acc540c59b339f55fb18f594.msu
		windows8-rt-kb4012598-x86_a0f1c953a24dd042acc540c59b339f55fb18f594.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4012598 更新已安裝>>%logfile%)
	goto end
)

:ver_W7
if exist "%PROGRAMFILES(X86)%" (
	echo Windows 7 64bit version %version%>>%logfile%
	wmic qfe | find "KB4019264"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/c/msdownload/update/software/secu/2017/03/windows6.1-kb4012215-x64_a777b8c251dcd8378ecdafa81aefbe7f9009c72b.msu
		windows6.1-kb4012215-x64_a777b8c251dcd8378ecdafa81aefbe7f9009c72b.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4019264 更新已安裝>>%logfile%)
	goto end
) else (
	echo Windows 7 32bit version %version%>>%logfile%
	wmic qfe | find "KB4019264"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/d/msdownload/update/software/secu/2017/03/windows6.1-kb4012215-x86_e5918381cef63f171a74418f12143dabe5561a66.msu
		windows6.1-kb4012215-x86_e5918381cef63f171a74418f12143dabe5561a66.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4019264 更新已安裝>>%logfile%)
	goto end
)

:ver_WVA
if exist "%PROGRAMFILES(X86)%" (
	echo Windows Vista 64bit version %version%>>%logfile%
	wmic qfe | find "KB4012598"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/d/msdownload/update/software/secu/2017/02/windows6.0-kb4012598-x64_6a186ba2b2b98b2144b50f88baf33a5fa53b5d76.msu
		windows6.0-kb4012598-x64_6a186ba2b2b98b2144b50f88baf33a5fa53b5d76.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4012598 更新已安裝>>%logfile%)
	goto end
) else (
	echo Windows Vista 32bit version %version%>>%logfile%
	wmic qfe | find "KB4012598"
	if %errorlevel% EQU 1 (
		wget http://download.windowsupdate.com/d/msdownload/update/software/secu/2017/02/windows6.0-kb4012598-x86_13e9b3d77ba5599764c296075a796c16a85c745c.msu
		windows6.0-kb4012598-x86_13e9b3d77ba5599764c296075a796c16a85c745c.msu
	) else (echo 更新已安裝&&echo %date%-%time% KB4012598 更新已安裝>>%logfile%)
	goto end
)

:ver_WXP
echo Windows XP version %version%
wmic qfe | find "KB4012598"
if %errorlevel% EQU 1 (
	wget http://download.windowsupdate.com/d/csa/csa/secu/2017/02/windowsxp-kb4012598-x86-custom-cht_a84b778a7caa21af282f93ea0cdada0f7abb7d6a.exe
	windowsxp-kb4012598-x86-custom-cht_a84b778a7caa21af282f93ea0cdada0f7abb7d6a.exe
) else (echo 更新已安裝&&echo %date%-%time% KB4012598 更新已安裝>>%logfile%)
goto end

:end
echo.
pause