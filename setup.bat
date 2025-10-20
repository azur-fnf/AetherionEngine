@echo off
title Psych Engine Setup - Haxe 4.2.5
color 0a

echo ==================================================
echo      Friday Night Funkin' Psych Engine Setup
echo ==================================================
echo.
echo Verificando instalacao do Haxe...
where haxe >nul 2>nul
if %errorlevel% neq 0 (
    echo ERRO: Haxe nao encontrado no PATH.
    echo Instale o Haxe 4.2.5 antes de rodar este script!
    pause
    exit /b
)

echo.
echo Instalando bibliotecas necessarias...
echo ==================================================
REM Instalar bibliotecas via haxelib
haxelib install lime 7.9.0 -y
haxelib install openfl 9.1.0 -y
haxelib install flixel 5.2.2 -y
haxelib install flixel-addons 2.11.0 -y
haxelib install flixel-ui 2.5.0 -y
haxelib install hscript 2.5.0 -y
haxelib install hxcpp 4.2.1 -y
haxelib install polymod 1.4.2 -y
haxelib install discord_rpc -y
haxelib install linc_luajit -y
haxelib install hxCodec -y

echo.
echo Configurando Lime e OpenFL...
haxelib run lime setup -y
haxelib run openfl setup -y

echo.
echo ==================================================
echo Todas as bibliotecas foram instaladas com sucesso!
echo Para compilar, use:
echo     haxelib run lime test windows
echo ou:
echo     haxelib run lime build windows
echo ==================================================
pause
