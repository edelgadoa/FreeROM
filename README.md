# FreeRom
Códigos FreeFem++ para resolver problemas de orden reducido


# Ordenes Git básicas para trabajar con Github

**DESCARGAR**

`git pull`  > descarga de los cambios de Github

**SUBIR**
1. Mirar archivos que han sido cambiados

	`git status` -- lista de archivos cambiado (en rojo)

2. Añadir los archivos cambiados

	`git add -A .` -- añade TODOS los archivos que hay en la carpeta
	
	`git add FILENAME` -- añade solo el archivo FILENAME

3. Comprobar que los archivos han sido añadidos

	`git status` -- los archivos añadidos aparecen ahora en verde

4. Crear el commit para subirlos

	`git commit -m "Mensaje con resumen de cambios" `

5. Subir los archivos

	`git push` -- sube los archivos
	
 # Trabajar con ramas (Branches)
1. Crear una rama LOCAL (solo se ve en tu ordenador)
	
	`git checkout -b branch-name` -- crea una rama en local llamada branch-name

2. La rama REMOTA (la vemos todos) se crea al hacer un push:
	
	`git push -u origin  branch-name` -- crea la rama remota

3. El resto del equipo puede acceder a la rama remota creada haciendo:
	
	```
	git fetch
	git checkout origin/branch-name 
	```
	 
4. Ya se trabaja normalmente en esa rama

5. Para cambiar de rama de trabajo se usa el comando 
	
	`git checkout branch-name`

6. Si queremos borrar una rama local, nos vamos a otra rama y hacemos
	
	`git branch -d branch-name`

7. Para borrar la rama remota hacemos
	
	`git push origin branch-name`
			

 # Otros comandos

`git log` -- lista de todas las subidas realizadas

`git rm FILENAME` -- elimina los archivos del repositorio (hay que hacer commit y push despues)

`git add -f FILENAME` -- añade el archivo FILENAME aunque su extensión esté en gitignore

`git branch -r` -- muestra las ramas (si no son del tipo origin/nombre_branch es una rama LOCAL)

`git hist` -- muestra el historial de commits

