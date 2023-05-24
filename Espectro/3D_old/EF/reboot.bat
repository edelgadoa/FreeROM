@ECHO OFF
ECHO 'Que parametros quieres actualizar'
set /p prob=
set nombre=parameters%prob%
set nombre2=SolEF%prob%
ECHO %nombre%
copy ..\auxiliary\parameters.txt ..\solutions\%nombre%.txt
del ..\solutions\txt\%nombre2%*