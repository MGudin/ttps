# TTPS - Ruby - Practica 1 #

## I - GIT ##

1. Ejecutá git o git help en la línea de comandos y mirá los
   subcomandos que tenés disponibles.

 -  **add**        Add file contents to the index
 -  **bisect**     Find by binary search the change that introduced a bug
 -  **branch**     List, create, or delete branches
 -  **checkout**   Checkout a branch or paths to the working tree
 -  **clone**      Clone a repository into a new directory
 -  **commit**     Record changes to the repository
 -  **diff**       Show changes between commits, commit and working tree, etc
 -  **fetch**      Download objects and refs from another repository
 -  **grep**       Print lines matching a pattern
 -  **init**       Create an empty Git repository or reinitialize an existing one
 -  **log**        Show commit logs
 -  **merge**      Join two or more development histories together
 -  **mv**         Move or rename a file, a directory, or a symlink
 -  **pull**       Fetch from and integrate with another repository or a local branch
 -  **push**       Update remote refs along with associated objects
 -  **rebase**     Forward-port local commits to the updated upstream head
 -  **reset**      Reset current HEAD to the specified state
 -  **rm**         Remove files from the working tree and from the index
 -  **show**       Show various types of objects
 -  **status**     Show the working tree status
 -  **tag**        Create, list, delete or verify a tag object signed with GPG


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

### Ruby. Sintaxis y tipos basicos  ###

1. Investigá y probá en un intérprete de Ruby cómo crear objetos de los siguientes tipos
básicos usando literales y usando el constructor new (cuando sea posible):

- Arreglo (Array)

[De la Documentacion:](https://ruby-doc.org/core-2.4.1/Array.html)

Un arreglo puede ser creado en forma literal, encerrando sus
elementos(que pueden ser de distinto tipo) entre corchetes.

```ruby
["uno", 2.0 , [3, 4]] #=> ["uno", 2.0 , [3, 4]]
```

Tambien se puede crear llamando al constructor de la clase Array con
cero, uno o dos parametros; donde el primero denota la dimension del
arreglo y el segundo el objeto por defecto que habra en cada
indice. En caso se ser llamado sin parametros inicializa un arreglo
vacio.

``` ruby
Array.new #=> []
Array.new(2) #=> [nil,nil]
Array.new(2,true) #=> [true,true]
```

El ultimo metodo, popula el arreglo con las referencias **al mismo
objeto**. Es posible crear un arreglo con distintos objetos pasandole
un bloque al constructor de la siguiente manera.

```ruby
Array.new(4) {|i| i.to_s } #=> [ "1", "2", "3", "4" ]
```

- Diccionario o hash (Hash)
- String (String)
- Símbolo (Symbol)
2. ¿Qué devuelve la siguiente comparación? ¿Por qué?
3. Escribí una función llamada reemplazar que reciba un String y que busque y reemplace
en el mismo cualquier ocurrencia de { por do\n y cualquier ocurrencia de } por \nend, de
modo que convierta los bloques escritos con llaves por bloques multilínea con do y end.
Por ejemplo:
4. Escribí una función que convierta a palabras la hora actual, dividiendo en los siguientes
rangos los minutos:
Si el minuto está entre 0 y 10, debe decir "en punto",
si el minuto está entre 11 y 20, debe decir "y cuarto",
si el minuto está entre 21 y 34, debe decir "y media",
si el minuto está entre 35 y 44, debe decir "menos veinticinco" (de la hora
siguiente),
si el minuto está entre 45 y 55, debe decir "menos cuarto" (de la hora siguiente),
y si el minuto está entre 56 y 59, debe decir "casi las" (y la hora siguiente)
Tomá como ejemplos los siguientes casos:
 'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id
reemplazar("3.times { |i| puts i }")
# => "3.times do\n |i| puts i \nend"
