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

[De la documentacion](https://ruby-doc.org/core-2.4.1/Hash.html)
El diccionario es una estructura de datos del tipo clave-valor, donde
las claves deben ser unicas y pueden ser cualquier tipo de objeto.

Existen varias formas de crear un arrgelo. Dentro de las formas
literales encontramos:

```ruby
{ "hola" => "hola", "que tal?" => "bien"} #=> { "hola" => "hola","quetal?" => "bien"} 
# pueden utilizarse simbolos como claves
{ :hola => "hola, :quetal => "bien" } #=> { :hola => "hola, :quetal=>"bien" }
# o bien
{ hola: "hola", quetal: "bien"} #=> {:hola=>"hola", :quetal=>"bien"}
```

Tambien pueden crearse invocando al constructor de la clase Hash que
puede recibir un argumento que denota el valor por defecto que
se devuelve en caso que no exista la clave especificada.

```ruby
h = Hash.new() #=> {}
i = Hash.new("no existe la clave") #=> {}
h["clave"] #=> nil
i["clave"] #=> "no existe la clave"
#finalmente puede establecerse el valor por defecto
#dinamicamente.
h.default = 0
h["clave"] #=> 0
```

- String (String)

[De la documentacion](https://ruby-doc.org/core-2.4.1/String.html)
Los string son objetos que manipulan secuencias de bytes que
tipicamente representan caracteres.

La clase String contiene metodos que manipulan el propio objeto que
recibe el mensaje y otros que devuelven una instancia de un nuevo
objeto String; los primeros son aquellos que terminan con "!" y los
segundos son el resto. Por ello debe tenerse especial cuidado al manipular
este tipo de objetos. 

La forma literal de crear un string es mediante comillas(simples o
dobles)

```ruby
"ruby" #=> "ruby"
'ruby' #=> "ruby"
```

Tambien se pueden crear invocando al constructor de la clase String
que puede recibir hasta 3 parametros. 

*str* -> El string que se almacena.

*encoding* -> Especifica la codificacion del string

*capacity* -> Indica la capacidad del buffer interno que se utilizara
para almacenar el string. Muy util cuando se desea perfomance.


```ruby
r = String.new(str="Ruby") #=> "Ruby"
sin_str = String.new("Ruby") #=> "Ruby"
```

- Símbolo (Symbol)

[De la documentacion](https://ruby-doc.org/core-2.4.1/Symbol.html)

Un simbolo es una representacion de un objeto dentro del interprete
ruby. Mientras que un nombre puede ser de distintos tipos segun el
contexto en el que se encuentre, un simbolo sera el mismo objeto(hara
referencia siempre al mismo objeto) durante la ejecucion del programa
sin importar su contexto.

Se crean de forma literal, dicho de otra forma, la clase Symbol no
tiene un constructor.

```ruby
:"esto es un simbolo" #=> :"esto es un simbolo"
:ttps #=> :ttps
:ttps.object\_id #=> 1164188
:ttps.object\_id #=> 1164188
"ttps".object\_id #=> 47423746712840
"ttps".object\_id #=> 47423746250580
```

2. ¿Qué devuelve la siguiente comparación? ¿Por qué?

```ruby
'TTPS Ruby'.object\_id == 'TTPS Ruby'.object\_id
```

Devuelve false, porque los strings son objetos de tipo String y aunque
contengan el mismo contenido son objetos distintos.


3. Escribí una función llamada reemplazar que reciba un String y que busque y reemplace
   en el mismo cualquier ocurrencia de { por do\n y cualquier ocurrencia de } por \nend, de
   modo que convierta los bloques escritos con llaves por bloques multilínea con do y end.

```ruby
reemplazar("3.times { |i| puts i }")
# => "3.times do\n |i| puts i \nend"
```

Se puede utilizar el metodo gsub de la clase String que a grandes
rasgos toma una regex y la reemplaza por un string pasado por
parametro. Dicho metodo devuelve una copia del string pasado por
parametro. Entonces encadenando los metodos como a continuacion
obtenemos el resultado esperado.

[reemplazar.rb](./reemplazar.rb)
```ruby
def reemplazar(str="")
    return str.gsub("{", "\n").gsub("}", "\nend")
end
```

4. Escribí una función que convierta a palabras la hora actual, dividiendo en los siguientes
   rangos los minutos:
   - Si el minuto está entre 0 y 10, debe decir "en punto",
   - si el minuto está entre 11 y 20, debe decir "y cuarto",
   - si el minuto está entre 21 y 34, debe decir "y media",
   - si el minuto está entre 35 y 44, debe decir "menos veinticinco" (de la hora
     siguiente),
   - si el minuto está entre 45 y 55, debe decir "menos cuarto" (de la hora siguiente),
     y si el minuto está entre 56 y 59, debe decir "casi las" (y la hora siguiente)


5. Escribí una función llamada contar que reciba como parámetro dos
   string y que retorne la cantidad de veces que aparece el segundo
   string en el primero, sin importar mayúsculas y minúsculas. Por
   ejemplo:
   
```ruby
    contar("La casa de la esquina tiene la puerta roja y la ventana blanca.","la")
    #=>5
```
[contar.rb](./contar.rb)

```ruby
def contar(string, substring)
  return string.scan(/#{substring}/i).count
end
```

6. Modificá la función anterior para que sólo considere como aparición
   del segundo string cuando se trate de palabras completas. Por ejemplo: 
   
```ruby
contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.","la")
#=>4
```

[contar\_palabras.rb](./contar_palabras.rb)

```ruby
def contar_palabras(string, substring)
  return string.scan(/\b#{substring}\b/i).count
end
```

7. Dada una cadena cualquiera, y utilizando los métodos que provee la
   clase String, realizá las siguientes operaciones sobre el string:

   - Imprimilo con sus caracteres en orden inverso.
   - Eliminá los espacios en blanco que contenga.
   - Convertí cada uno de sus caracteres por su correspondiente valor
     ASCII.
   - Cambiá las vocales por números (a por 4, e por 3, i por 1, o
     por 0, u por 6).

[ej7.rb](./ej7.rb)

8. ¿Qué hace el siguiente código?

```ruby
[ :upcase,:downcase,:capitalize,:swapcase].map do | meth|
        "TTPSRuby".send(meth)
end
```

Tenemos un arreglo de simbolos que son metodos de la clase String. 
El metodo map del array con el bloque ejecuta el mismo con cada
elemento del array. 

El metodo send de la clase object, recibe como parametro un simbolo
que representa un metodo e invoca el metodo en la instancia que
recibe el mensaje send.

Por lo tanto, termina invocando los metodos:
- upcase
- downcase
- capitalize
- swapcase

sobre el string "TTPS Ruby".

