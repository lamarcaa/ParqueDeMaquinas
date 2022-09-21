@echo off
usuario=%userprofile%
:menu
cls
echo                  #======================================================#
echo                  #                        MENU                          #
echo                  # 1 Salvar lista de usuarios e seus papeis             #
echo                  # 2 Salvar Lista de Diretorios contidos na raiz        #
echo                  # 3 Salvar a lista de processos em execucao no momento #
echo                  # 4 Gerar um relatorio CSV                             #
echo                  # 5 Desligar o equipamento                             #
echo                  #======================================================#

echo. 
echo.
choice /c 12345 /m "Escolha uma opcao.:" 

if %errorlevel%==1 goto :ex1
if %errorlevel%==2 goto :ex2
if %errorlevel%==3 goto :ex3
if %errorlevel%==4 goto :ex4
if %errorlevel%==5 goto :ex5

:ex1
cls
mkdir c:\relatorios
date /t C:\>>c:/relatorios\%COMPUTERNAME%-userslist.txt
time /t C:\>>c:/relatorios\%COMPUTERNAME%-userslist.txt
net users>>c:/relatorios\%COMPUTERNAME%-userslist.txt
echo Lista criada
timeout /t 8
goto menu

:ex2
cls
mkdir c:\relatorios
date /t C:\>>c:/relatorios\%COMPUTERNAME%-dirlist.txt
time /t C:\>>c:/relatorios\%COMPUTERNAME%-dirlist.txt
dir /ad c:\>>c:/relatorios\%COMPUTERNAME%-dirlist.txt
echo Lista criada
timeout /t 8
goto menu

:ex3
cls
mkdir c:\relatorios
date /t C:\>>c:/relatorios\%COMPUTERNAME%-pslist.txt
time /t C:\>>c:/relatorios\%COMPUTERNAME%-pslist.txt
tasklist>>c:/relatorios\%COMPUTERNAME%-pslist.txt
echo Lista criada
timeout /t 8
goto menu

:ex4
cls
mkdir c:\relatorios
echo %COMPUTERNAME%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %USERDOMAIN%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %USERNAME%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %DriverData%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %PROCESSOR_IDENTIFIER%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %PROCESSOR_ARCHITECTURE%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %PROCESSOR_LEVEL%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
echo %windir%>>c:\relatorios/%COMPUTERNAME%-computadores.csv
timeout /t 8
goto menu

:ex5
cls
echo Desligando
echo Se precisar parar o desligamento digite shutdown -a
shutdown -s



