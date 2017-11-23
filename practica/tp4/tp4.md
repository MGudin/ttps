# Practica 4

## Gemas y bundler

1. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura tienen?
   
   Una gema es el nombre que se le da a las librerias de
   terceros(third party libraries) escritas en ruby.
   
   Es una forma de sencilla de compartir codigo, dado que su
   instalacion se simplifica.
   
   Las gemas tienen un conjunto de especificaciones, algunas
   requeridas y otras no, entre las que se encuentran:
   
   **Requeridas**
   
   - **files:** indica los archivos incluidos en la gema.
   
   - **name:** El nombre de la gema,
   
   - **summary:** Una descripcion corta. (sera lo que aparezca cuando
     se ejecute ```gem list -d```
     
   - **version:** La version de la gema.
   
   **Opcionales**
   
   - **author=**.
   
   - **authors=**
   
   - **description**
   
   - **email**
   
2. ¿Cuáles son las principales diferencias entre el comando gem y
   Bundler? ¿Hacen lo mismo?
   
   Mientras que gem se utiliza para instalar gemas, bundler es
   utilizado para manejar dependencias de los proyectos.
   Bundler **utiliza** el comando gem e instala las gemas
   especificadas en un archivo llamado gemfile.
    
3. ¿Dónde instalan las gemas los comandos gem y bundle?
   **Tip: gem which y bundle show .**
   
   El comando ```gem``` instala las gemas en un directorio especial
   .gem en un ambiente basico.(en este caso, como utilizo rbenv las
   instala dentro del directorio .rbenv).
   
   En cuando a ```bundle```, instala las gemas en un directorio
   .bundle/ dentro del directorio raiz del proyecto donde se esta
   utilizando.
   
4. ¿Para qué sirve el comando gem server? ¿Qué información podés
   obtener al usarlo?
   
   Segun la documentacion, (```gem help server```), el comando inicia
   un proceso servidor que informa las gemas instaladas en el sistema
   junto con sus dependencias y correspondientes links a la
   documentacion.
      
5. Investigá un poco sobre Semantic Versioning (o SemVer). ¿Qué
   finalidad tiene? ¿Cómo se compone una versión? ¿Ante qué
   situaciones debería cambiarse cada una de sus partes?

    **Semver** es una forma de versionar el codigo, de forma tal que
    con el crecimiento del mismo no se produzcan inconsistencias en
    cuanto a sus dependencias y a la vez no produzca conflictos en
    software que utilice el mismo.
    
    Para realizar versionado semantico en principio se debe declarar
    una API publica.
    
    El versionado semantico consta de 3 numeros(X.Y.Z) cuyo
    significado es el que sigue:
    
    - X indica cambios en la api por lo que aquel software que utilice
      el codigo puede presentar conflictos.
      
    - Y indica cambios en el codigo privado sin cambiar la API, por lo
      tanto no debe tomarse como una pontencial causa de fallos.
      
    - Z indica arreglos de bugs, o sea son patches.
    
    Como bien se puede ver, X se incrementa cuando se cambia la api
    publica, Y se incrementa cuando se cambia el codigo privado y Z
    cuando se corrige un error.
    
6. Creá un proyecto para probar el uso de Bundler:
   1. Inicializá un proyecto nuevo en un directorio vacío con el
      comando ```bundle init```
      
      ```sh
      $ mkdir project_six
      $ cd project_six & bundle init
      ```
   2. Modificá el archivo Gemfile del proyecto y agregá la gema
      colorputs
      
      ```ruby
      gem "colorinputs"
      ```
      
   3. Creá el archivo prueba.rb y agregale el siguiente contenido:

        ```ruby
        require 'colorputs'
        puts "Hola!",:rainbow_bl
        ```
        
    4. Ejecutá el archivo anterior de las siguientes maneras:

       ```ruby
       ruby prueba.rb
       bundle exec ruby prueba.rb
       ```
       
       ```bundle exec ruby prueba.rb``` tambien tira error, pero
       indica que la gema no esta instalada.
       
    5. Ahora utilizá el comando ```bundle install``` para instalar las
       dependencias del proyecto
       
    6. Volvé a ejecutar el archivo de las dos maneras enunciadas en el
       paso 4. 

    7. Creá un nuevo archivo prueba_dos.rb con el siguiente contenido:
    
        ```ruby
        Bundle.require
        puts "Hola!", :red
        ```
    
    8. Ahora ejecutá este nuevo archivo:
    
    ```ruby
    ruby prueba_dos.rb
    ```
    
    ```ruby
    bundle exec ruby prueba_dos.rb
    ```
    
7. Utilizando el proyecto creado en el punto anterior como referencia,
   contestá las siguientes preguntas:
   
   1. ¿Qué finalidad tiene el archivo Gemfile?
   
   Gemfile especifica las gemas de las que depende el proyecto.
   
   2. ¿Para qué sirve la directiva source del Gemfile? ¿Cuántas pueden
      haber en un mismo archivo?
   
   Dicha directiva indica a que repositorios ira a buscar bundler las gemas
   listadas en el Gemfile una vez que ejecutemos bundle install.
   
   Puede haber cualquier cantidad de sources en un Gemfile, el unico
   requisito es que sean repositorios de gemas validos.
   
   3. Acorde a cómo agregaste la gema colorputs, ¿qué versión se
      instaló de la misma? Si mañana se publicara la versión 7.3.2,
      ¿esta se instalaría en tu proyecto? ¿Por qué? ¿Cómo podrías
      limitar esto y hacer que sólo se instalen releases de la gema en
      las que no cambie la versión mayor de la misma?

   Se instalo la ultima version(0.2.3). Si maniana la version de la
   misma sufre un major release, se instalara esa ultima ya que
   bundler toma por defecto la ultima version estable.
   
   Para tener control sobre las versiones que se instalaran se
   utilizan operadores(< <= > >=) que de por si ya dan una idea de que
   version deseamos que se instale. Por ejemplo, si queremos la
   version 1.1.0 pero no deseamos los major releases que pueden fallar
   con nuestro codigo simplemente agregamos al gem '>=1.1.0', '<2.0',
   esto instalara la version estable mas nueva de la rama 1.1 y cuando
   se lance una 2.0.0 no la tendra en cuenta. Existe un atajo para
   lograr esto ultimo utilizando *twiddle-wakka*, un operador especial
   *~>*.
   
   Por lo anterior, sea una gema llamada 'library', si deseamos que se
   instale solo cierta version mayor, pondremos en el gemfile:
   ```ruby
   gem 'libreria', '~>2' # solo queremos que se instale la version 2.x.x
   ```
   
   4. ¿Qué ocurrió la primera vez que ejecutaste prueba.rb? ¿Por qué?

   Tiro un error, ya que al no estar instalada la gema, toma el
   require como a un archivo del proyecto el cual no existe.
   
   5. ¿Qué cambió al ejecutar bundle install?
   
   Al ejecutar bundle install, se instalaron las gemas del gemfile, es
   decir 'colorputs'. Entonces prueba.rb comienza a funcionar.
   
   6. ¿Qué diferencia hay entre bundle install y bundle update?
   
   Cuando se hace un bundle install, bundle resuelve las dependencias
   del gemfile, instala las gemas y crea un gemfile.lock donde se
   guardan las versiones que se instalaron. De esta forma, en el
   proximo bundle install no se resolveran las dependencias de nuevo,
   sino que se utilizara el gemfile.lock para instalar las mismas
   gemas que se instalaron la primera vez. Esto es util para tener las
   mismas dependencias entre distinas maquinas.
   
   Ahora bien, dado que bundle install no va a volver a utilizar el
   gemfile(siempre y cuando no haya cambiado), se vuelve engorroso
   tener que modificar a mano el gemfile.lock cada vez que queremos
   utilizar una version mas nueva de una gema ya instalada. Para ello
   existe el bundle update que recibe opcionalmente el nombre de una
   gema y resuelve su dependencia a la mas nueva estable. En caso de
   no recibir parametros actualiza todas las gemas del gemfile.
   
   7. ¿Qué ocurrió al ejecutar prueba_dos.rb de las distintas formas
      enunciadas? ¿Por qué? ¿Cómo modificarías el archivo prueba_dos.rb
      para que funcione correctamente?
   
   Al ejecutar ```ruby prueba_dos.rb``` aparece un error que indica
   que Bundler no esta definido. Esto lo arreglaria agregando 
   
   ```ruby
   require 'bundler'.
   ```
   Al ejecutarlo de la forma ```bundler exec ruby prueba_dos.rb```
   funciona. Esto se debe bundler exec hace que todas las gemas
   listadas en el gemfile esten disponibles para su
   utilizacion(calculo que tambien bundler mismo, aunque no este en
   el gemfile?)
   
8. Desarrollá una gema (llamada MethodCounter, por ejemplo) que
   empaquete toda la funcionalidad implementada en el ejercicio 4 de
   la práctica 2 (el módulo Countable). La forma de usarla sería algo
   similar a esto: 
   
   ```ruby
   require 'method_counter'
   
   class MiClase
       include MethodCounter::Countable

        def hola
        puts "Hola"
        end
    
        def chau
            puts "Chau"
        end

        count_invocations_of :hola, :chau
    end
    ```
## Sinatra

1. ¿Qué es Rack? ¿Qué define? ¿Qué requisitos impone?

    Rack es una interfaz ruby que se interpone entre servidores
    web(acaso es un app server??). Una aplicacion rack, envuelve
    requests y response en de una manera muy sencilla, de forma tal
    que manejamos la comunicacion entre un servidor y una aplicacion
    ruby casi inmediatamente.
    
    Para tener una aplicacion rack, debemos respetar:
    - La app en si debe ser un objeto que responda al mensaje #call,
      como un Proc.
    - Debe recibir un unico parametro, el **environment**.
    - Debe devolver un arreglo de exactamente tres componentes:
      - Codigo de respuesta(2x,4x, 5x... etc)
      - Un hash con los headers.
      - El body de la respuesta.
    
2. Implementá una app llamada "MoL" de Rack que responda con un número
   al azar entre 1 y 42, y que devuelva el status HTTP 200 sólo en
   caso que el número a devolver sea 42, en cualquier otro caso debe
   retornar un status 404.
   
   El core de la app se encuentra en [app.rb](./mol/app.rb) que es una simple clase
   que genera un numero al azar y establece un status code.
   En el archivo [mol.rb](./mol/mol.rb) se levanta con rack.

3. Sinatra se define como "DSL para crear aplicaciones web". ¿Qué
   quiere decir esto? ¿Qué es un DSL? 

   **DSL** hace referencia a Domain Specific Language que es un
   lenguaje para resolver un problema especifico. Para el caso es un
   lenguaje minimalista que utiliza ruby con el proposito de crear
   aplicaciones web sencillas.
   
4. Implementá la misma app "MoL" de antes, ahora utilizando Sinatra
   para obtener el mismo resultado.

   La app se encuentra en el directorio [sinatra_mol](./sinatra_mol).

5. Utilizando Sinatra, desarrollá una aplicación web que tenga los
   siguientes endpoints:
   
    - GET / lista todos los endpoints disponibles (sirve a modo de
    documentación)
    
    - GET /mcm/:a/:b calcula y presenta el mínimo común múltiplo de
    los valores numéricos :a y :b

    - GET /mcd/:a/:b calcula y presenta el máximo común divisor de los
    valores numéricos :a y :b
    
    - GET /sum/* calcula la sumatoria de todos los valores numéricos
    recibidos como parámetro en el splat
    
    - GET /even/* presenta la cantidad de números pares que hay entre
    los valores numéricos recibidos como parámetro en el splat
    
    - POST /random presenta un número al azar
    - POST /random/:lower/:upper presenta un número al azar entre
      :lower y :upper (dos valores numéricos)

    La app se encuentra
    en [/sinatra/endpoints](./sinatra/endpoints.rb).

6. Implementá un middleware para Sinatra que modifique la respuesta
   del web server y "tache" cualquier número que aparezca en el body de
   la respuesta, cambiando cada dígito por un caracter X. Utilizalo en la
   aplicación anterior para corroborar su funcionamiento.

    El Middleware se encuentra
    en
    [/sinatra/endpoints/middlewares.rb](./sinatra/endpoints/middlewares.rb). 
    
7. Implementá otro middleware para Sinatra que agregue una cabecera a
   la respuesta HTTP, llamada X-Xs-Count, cuyo valor sea la cantidad
   de caracteres X que encuentra en el body de la respuesta. ¿Cómo
   debés incluirlo en tu app Sinatra para que este middleware se
   ejecute antes que el desarrollado en el punto anterior?
   
   El Middleware se encuentra en
   [/sinatra/endpoints/middlewares.rb](./sinatra/endpoints/middlewares.rb),
   mas precisamente la clase XCharacterCount,

8. Desarrollá una aplicación Sinatra para jugar al ahorcado. La
   aplicación internamente debe manejar una lista de palabras (cada
   una asociada a algún identificador de tu elección y a información
   sobre los intentos realizados para adivinar esa palabra), donde
   cada una representa una partida de ahorcado que puede ser jugada
   una sóla vez por ejecución del servidor de la aplicación web.
   
   La misma debe poseer las siguientes URLs:
   
   - **POST /** inicia una partida. Internamente tomará una palabra al
     azar de entre las de la lista, y luego debe redirigir (con un
     redirect HTTP) a la URL propia de la partida (utilizando el
     identificador de la palabra elegida) para que el jugador pueda
     comenzar a adivinar.
     
   - **GET /partida/:id** muestra el estado actual de la partida
     (letras adivinadas, intentos fallidos y cantidad de intentos
     restantes). Si se adivinó la palabra o no quedan más intentos,
     deberá reflejarse también en la (partida??-se corta el enunciado)

   - **PUT /partida/:id** acepta un parámetro por PUT llamado intento
     que debe contener la letra que el jugador intenta para adivinar
     la palabra. Internamente la aplicación chequeará si se pueden
     hacer más intentos en la partida, en caso afirmativo actualizará
     el estado de la partida, y en respuesta deberá hacer un redirect
     HTTP a la partida (a /partida/:id) para mostrar al jugador el
     estado de su partida.
    
