# TTPS - Ruby - Practica 1 #

## I - GIT ##

1. Ejecutá git o git help en la línea de comandos y mirá los
   subcomandos que tenés disponibles.

 -  add        Add file contents to the index
 -  bisect     Find by binary search the change that introduced a bug
 -  branch     List, create, or delete branches
 -  checkout   Checkout a branch or paths to the working tree
 -  clone      Clone a repository into a new directory
 -  commit     Record changes to the repository
 -  diff       Show changes between commits, commit and working tree, etc
 -  fetch      Download objects and refs from another repository
 -  grep       Print lines matching a pattern
 -  init       Create an empty Git repository or reinitialize an existing one
 -  log        Show commit logs
 -  merge      Join two or more development histories together
 -  mv         Move or rename a file, a directory, or a symlink
 -  pull       Fetch from and integrate with another repository or a local branch
 -  push       Update remote refs along with associated objects
 -  rebase     Forward-port local commits to the updated upstream head
 -  reset      Reset current HEAD to the specified state
 -  rm         Remove files from the working tree and from the index
 -  show       Show various types of objects
 -  status     Show the working tree status
 -  tag        Create, list, delete or verify a tag object signed with GPG


2. Ejecutá el comando git help help. ¿Cuál fue el resultado?

Se abrio el manpage en relacion al comando `$ git help`

3. Utilizá el subcomando help para conocer qué opción se puede pasar
   al subcomando add para que ignore errores al agregar archivos.

`$ git add . --ignore-errors`

4. ¿Cuáles son los estados posibles en Git para un archivo? ¿Qué
   significa cada uno?
   
De [Git Basics](https://git-scm.com/book/id/v2/Getting-Started-Git-Basics):

Para comenzar, vale aclarar que casi todas las operaciones en git son
locales, es decir no es necesario interactuar con los servidores web,
lo que produce un funcionamiento rapido sin importar las variables de
nuestra conexion a internet, si existiese.

Git almacena snapshots de nuestro repositorio local en su base de
datos, de forma que en cualquier momento podamos volver a algun
momento determinado en el tiempo.

Dicho esto, existen tres estados en los que los archivos de nuestro
repositorio local pueden estar, ellos son:

- **Commited:** Los archivos en este estado se encuentran guardados en la
  base de datos.
  
- **Modified:** Los archivos se encuentran modificados respecto a su
  estado antesrior en la base de datos del repositorio.
  
- **Staged:** Este estado indica que el archivo modificado esta
  marcado para ser persistido en la base de datos, aunque aun no fue
  hecho.
  
5. Cloná el repositorio de materiales de la materia:
   https://github.com/TTPSruby/capacitacion-ruby-ttps.git.  Una vez
   finalizado, ¿cuál es el hash del último commit que hay en el
   repositorio que clonaste?  Tip: git log.
   
No se encuentra el repo.


6. ¿Para qué se utilizan los siguientes subcomandos?
   - init
   - status
   - log
   - fetch
   - merge
   - pull
   - commit
   - stash
   - push
   - rm
   - checkout

7. Creá un archivo de texto en el repositorio que clonaste en el
   ejercicio 5 y verificá el estado de tu espacio de trabajo con el
   subcomando status. ¿En qué estado está el archivo que agregaste?


8. Utilizá el subcomando log para ver los commits que se han hecho en
   el repositorio, tomá cualquiera de ellos y copiá su hash (por ejemplo,
   800dcba6c8bb2881d90dd39c285a81eabee5effa), y luego utilizá el
   subcomando checkout 3 of 6 para viajar en el tiempo (apuntar tu copia
   local) a ese commit. ¿Qué commits muestra ahora git log? ¿Qué ocurrió
   con los commits que no aparecen? ¿Qué dice el subcomando status?
   
   
9. Volvé al último commit de la rama principal (master) usando
   nuevamente el subcomando checkout. Corroborá que efectivamente haya
   ocurrido esto.


10. Creá un directorio vacío en el raiz del proyecto clonado. ¿En qué
    estado aparece en el git status? ¿Por qué?
    
    
11. Creá un archivo vacío dentro del directorio que creaste en el
    ejercicio anterior y volvé a ejecutar el subcomando status. ¿Qué
    ocurre ahora? ¿Por qué?
    
    
12. Utilizá el subcomando clean para eliminar los archivos no
    versionados (untracked) y luego ejecutá git status. ¿Qué información
    muestra ahora?
    
    
13. Actualizá el contenido de tu copia local mediante el subcomando
    pull.
