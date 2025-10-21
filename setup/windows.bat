@echo off
title Instalador Automático do Psych Engine 0.6.3 💖
color 0a

echo ============================================
echo     PSYCH ENGINE 0.6.3 - SETUP AUTOMATICO
echo ============================================
echo.
echo Instalando dependencias... aguarde 

REM Atualiza haxelib
haxelib upgrade --always

REM Instala versoes exatas recomendadas
haxelib install lime 7.7.0
haxelib install openfl 8.9.7
haxelib install flixel 4.11.0
haxelib install flixel-tools
haxelib install flixel-addons
haxelib install flixel-ui
haxelib install hxcpp
haxelib install hscript
haxelib install discord_rpc

REM Define versoes usadas
haxelib set lime 7.7.0
haxelib set openfl 8.9.7

echo.
echo Tudo instalado 🥰