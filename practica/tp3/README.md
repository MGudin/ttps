# Practica 3

## Excepciones

1. Investigá la jerarquía de clases que presenta Ruby para las
   excepciones. ¿Para qué se utilizan las siguientes clases?
   
   Todas las excepciones son subclases de Exception, dicha
   especificacion se utiliza para identificar en forma mas precisa los
   tipos de errores que pueden ocurrir en la ejecucion de un programa.
   
   **IOError**
   
   Se dispara cuando ocurre un error en la Entrada/Salida, por ejemplo
   manejando archivos.
   
   **NameError**
   
   Se dispara cuando se utiliza un nombre de variable que bien no esta
   definido o es incorrecto.
   
   **RuntimeError**
   
   Se dispara cuando se trata de ejecutar una operacion invalida. Por
   ejemplo:
   
   ```ruby
   [1,2,3].frozen << 4
   ```
   
   **NotImplementedError**
   
   Se dispara cuando se intenta realizar una operacion que no es
   soportada por el SO subyacente. Por ejemplo un fork en un SO que no
   soporta dicha operacion.
   
   **StopIteration**
   
   Se dispara cuando se termina una iteracion. En particular sucede
   cuando se invoca en un enumerator #next sin que haya proximo
   elemento.
   Cabe destacar que la sentencia loop la rescata.
   
   **TypeError**
   
   Se dispara cuando se espera un objeto de un tipo especifico y se
   provee otro sin una conversion implicita, es decir que no es
   posible pasarlo al tipo deseado automaticamente.
   
   **SystemExit**
   
   Se levanta cuando se finaliza un script mediante ctrl+c
   
2. ¿Cuál es la diferencia entre raise y throw? ¿Para qué usarías una u
   otra opción?
   
   **Raise** forma parte del manejo de errores en ruby. Es una
   sentencia que levanta un error. Por otro lado **throw** no es parte del
   manejo de errores, su ejecucion no esta asociada a la clase
   Exception. Su ejecucion se utiliza para controlar el flujo de un
   programa, por ejemplo volver a un determinado punto en el stack de
   ejecucion dada cierta condicion.
   
   Raise lo utilizaria cuando ocurre un error tal que no pueda o deba
   poder seguir ejecutandose el bloque.
   
   Thow lo utilizaria cuando sucede una condicion que implique
   abandonar una estructura de control sin que ello sea
   conceptualmente un error.

3. ¿Para qué sirven begin..rescue..else y ensure? Pensá al menos 2
   casos concretos en que usarías estas sentencias en un script Ruby.

   Todos son parte del manejo de errores en ruby.

   **begin** se utiliza para dar entrada a un bloque de codigo que
   puede generar errores.

   **rescue** se utiliza para atender las distintas excepcines que se
   pueden levantar en el bloque delimitado por el begin y el primer
   rescue.
   
   **else** se ejecuta cuando no se levanta ninguna excepcion.
   
   **ensure** se ejecuta siempre, haya ocurrido o no una excepcion. Se
   utiliza para dejar un estado contundente mas alla de la ejecucion
   del codigo.

   Un ejemplo podria ser al hacer un map sobre un arreglo.
   
   ```ruby
   arr = [1,2,0,10]
   division = arr.map.with_index do
        |e,i|
        begin
            e/arr[i+1]
        rescue ZeroDivisionError
            p "division por 0. Saltando"
        rescue TypeError
            p "Llegamos al final del arreglo"
        else
            p e.to_s + "/" + arr[i+1].to_s
        ensure
            p "------------------------------"
        end
    end
    ```
4. ¿Para qué sirve retry? ¿Cómo evitarías caer en un loop infinito al
   usarla? 
   
   **retry** sirve para volver a ejecutar el codigo del bloque donde
   se produjo la excepcion.
   Para no caer en un bucle infinito utilizo un if que depende de una
   variable. De forma tal que en la primer pasada entre en la rama
   verdadera, donde cambio el valor de la variable y lanzo el
   retry. Si vuelve a levantarse la excepcion entrara por la falsa
   quien levantara otra excepcion.
   
5. ¿Cuáles son las diferencias entre los siguientes métodos?

```ruby
def opcion_1
    a=[1,nil,3,nil,5,nil,7,nil,9,nil]
    b=3
    c=a.map do |x|
        x*b
        end
    puts c.inspect
    rescue 
        0
end
```
```ruby
def opcion_2
    c=begin
        a=[1,nil,3,nil,5,nil,7,nil,9,nil]
        b=3
        a.map do |x|
            x*b
        end
        rescue 0
    end
    puts c.inspect
end
```
```ruby
def opcion_3
    a=[1,nil,3,nil,5,nil,7,nil,9,nil]
    b=3
    c=a.map{ |x| x*b } rescue 0
    puts c.inspect
end
```
```ruby
def opcion_4
    a=[1,nil,3,nil,5,nil,7,nil,9,nil]
    b=3
    c=a.map{ |x| x*b rescue 0}
    puts c.inspect
end
```

**opcion_1** devuelve 0, ya que al producirse la excepcion en el map y no
tener un manejador pasa a buscarlo al scope del metodo, donde
encuentra el rescue(para cualquier error), quien devuelve 0. Como es
la ultima sentencia del metodo devuelve eso. Cabe aclarar que el
inspect nunca se ejecuta.

**opcion_2** imprime 0 y retorna nil. Esto sucede porque la asignacion de
c se encuentra en un bloque begin-end, con el rescue dentro. Entonces
se realiza el map, se levanta la excepcion y se salva con el rescue
quien devuelve 0. Se termina la ejecucion del bloque y en c queda el
valor 0. Al hacer inspect se imprime 0 y se devuelve lo que devuelve
puts(nil)

**opcion_3** imprime 0 y retorna nil. El caso es similar al de la
opcion_2. ???

**opcion_4** imprime el arreglo multiplicado por 3 en cada lugar y 0
en los lugares con nil. Retorna nil.
Esto se da porque el rescue se encuentra dentro del bloque del map,
entonces en cada multiplicacion por nil*3 se levanta la excepcion
quien es atendida por el rescue y se sigue la ejecucion.

6. Suponé que tenés el siguiente script y se te pide que lo hagas
   resiliente (tolerante a fallos), intentando siempre que se pueda
   recuperar la situación y volver a intentar la operación que
   falló. Realizá las modificaciones que consideres necesarias para
   lograr que el script sea más robusto. 


```ruby
# Este script lee una secuencia de no menos de 15 números desde teclado
# y luego imprime el resultado de la división de cada número por su 
# entero inmediato anterior.

# Como primer paso se pide al usuario que indique la cantidad de
# números que ingresará.

cantidad= 0
while cantidad<15
    puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
    cantidad=gets.to_i
end

# Luego se almacenan los números

numeros=1.upto(cantidad).map do
    puts'Ingrese un número'
    numero=gets.to_i
end

# Y finalmente se imprime cada número dividido por su número entero
# inmediato anterior

resultado=numeros.map{ |x| x/(x- 1)}
puts 'El resultado es: %s' %resultado.join(',')
```
[numeros.rb](./numeros.rb)
??? Al parecer el gets siempre trae strings, que son convertidos a 0
por #to_i. Debo tener eso en cuenta? o solo la posible division por 0.

8. Sea el siguiente código:

[excepciones.rb](./excepciones.rb)
```ruby
def fun3
    puts "Entrando a fun3"
    raise RuntimeError, "Excepción intencional"
    puts "Terminando fun3"
    rescue NoMethodError=>e
        puts"Tratando excepción por falta de método"
    rescue RuntimeError=>e
        puts"Tratando excepción provocada en tiempo de ejecución"
    rescue
        puts "Tratando una excepción cualquiera"
    ensure
    puts "Ejecutando ensure de fun3"
end

def fun2(x)
    puts"Entrando a fun2"
    fun3
    a=5/x
    puts "Terminando fun2"
end

def fun1(x)
    puts "Entrando a fun1"
    fun2(x)
    rescue 
        puts"Manejador de excepciones de fun1"
        raise
    ensure 
        puts"Ejecutando ensure de fun1"
end
   
begin 
x=0
    begin
    fun1(x)
    rescue Exception=>e
        puts "Manejador de excepciones de Main"
        if x==0
            puts "Corrección de x"
            x=1
            retry
        end
    end
    puts "salida"
end
```

1. Seguí el flujo de ejecución registrando la traza de impresiones que
   deja el programa y justificando paso a paso.

- Entra a fun1 con x=0 (scope fun1) -> "Entrando a fun1"
  Desde fun1 entra a fun2 con x=0 (scope fun2) -> "Entrando a fun2"

- Desde fun2 entra a fun3 ->"Entrando a fun3"

- Desde fun3 Se levanta a proposito un RuntimeError por lo tanto no se
ejecuta el "terminando fun3". La excepcion es manejada por el rescue
RuntimeError dentro de fun3, quien imprime -> Tratando excepcion
provocada en tiempo de ejecucion". Finalmente pasa por el ensure e
imprime "ejecutando ensure de fun3".

- Vuelve a fun2, como x=0, al ejecutar ```a=5/x``` se levanta una
  excepcion ZeroDivisionError. Como la operacion no se encuentra
  dentro de un bloque begin-end, busca manejadores en fun2. Como no
  los encuentra, sigue hacia arriba en el stack. Es decir, los busca
  en fun1.

- Ya en fun1 encuentra un rescue por lo que imprime -> "manejador de
  excepciones de fun1". Ejecuta el raise y se vuelve a levantar una
  excepcion(RuntimeError).
  Como ya se ejecuto el rescue. sale a buscar un handler al stack, es
  decir al la funcion main.
  
- En main encuentra el rescue Exception, como RuntimeError hereda de
  Exception es manejada por este. quien imprime -> "manejador de
  excepciones de main"
  Se modifica el valor de x y se imprime "Correccion de x". Se ejecuta
  el retry que vuelve a ejecutar el bloque en que se encuentra. Es
  decir el main.

- Entra en fun1->fun2->fun3->RuntimeError->manejadordefun3->ensure de
fun3 y sale hacia quien lo llamo. fun2.

- En fun2 se ejecuta el ```a=5/x``` sin problemas por lo que se
imprime -> "terminando fun2"

- Por ultimo ya en el main se termina el script imprimiendo "salida"

salida:
"Entrando a fun1"
"Entrando a fun2"
"Entrando a fun3"
"Tratando excepcion provocada en tiempo de ejecucion"
"ejecutando ensure de fun3"
"manejador de excepciones de fun1"
"ejecutando ensure de fun1"
"manejador de excepciones de main"
"correccion de x"
"Entrando a fun1"
"Entrando a fun2"
"Entrando a fun3"
"Tratando excepcion provocada en tiempo de ejecucion"
"ejecutando ensure de fun3"
"Terminando fun2"
"salida"

2. ¿Qué pasaría si se permuta, dentro de fun3, el manejador de
   excepciones para RuntimeError y el manejador de excepciones
   genérico (el que tiene el rescue vacío)? 

   Al realizar la permutacion. El primer manejador que responde es el
   generico, por lo que se imprime "Tratando una excepcion cualquiera"
   en lugar de "tratando una excepcion provocada en tiempo de
   ejecucion"

3. ¿La palabra reservada retry que función cumple? ¿Afectaría el
   funcionamiento del programa si se mueve la línea x=0 dentro del
   segundo begin (inmediatamente antes de llamar a fun1 con x)?
   
   La palabra retry hace que se vuelva a ejecutar el bloque donde se
   resuelve la excepcion. Entonces se volveria a setear x
   en 0, entrando en un ciclo infinito.
   
## Testing

1. ¿En qué consiste la metodología TDD? ¿En qué se diferencia con la
   forma tradicional de escribir código y luego realizar los tests?
   
   TDD hace referencia a Test Driven Development. Es una forma de
   desarrollo en donde los tests tienen un rol fundamental.
   Basicamente se trata de un ciclo donde en primera instancia se crea
   un test para probar cierta funcionalidad. Dicho test falla,
   entonces se escribe el minimo codigo posible para que pase(aunque
   esto signifique hardcodear resultados). Luego se refactoriza, se
   escribe un nuevo test y comienza el ciclo de nuevo.
   La diferencia sustancial con el testing tradicional es que se
   desarrolla en base a los test, es decir, primero se escribe un test
   que falla para luego escribir codigo que pase el test.
   
2. Dado los siguientes tests, escribí el método correspondiente (el
   que se invoca en cada uno) para hacer que pasen:

```ruby
require 'minitest/autorun'
require 'minitest/spec'

describe '#incrementar' do
    describe 'cuando el valor es numérico' do
        it 'incrementa el valor en un delta recibido por parámetro' do
            x=-9
            delta= 10
            assert_equal(1,incrementar(x,delta))
        end
        
        it 'incrementa el valor en un delta de 1 unidad por defecto' do
            x=10
            assert_equal(11,incrementar(x))
        end
    end

    describe 'cuando el valor es un string' do
        it 'arroja un RuntimeError' do
            x='10'
            assert_raises(RuntimeError) do
                incrementar(x)
            end
    
            assert_raises(RuntimeError) do
                incrementar(x,9)
            end
        end
    end
end

describe '#concatenar' do
    it 'concatena todos los parámetros que recibe en un string,
    separando por espacios' do
        class Dummies;end
        assert_equal('Lorem ipsum 4 Dummies',concatenar('Lorem',:ipsum,4,Dummies))
    end
    
    it 'Elimina dobles espacios si los hubiera en la salida final' do
        assert_equal('TTPSRuby',concatenar('TTPS',nil,'    ',"\t","\n",'Ruby'))
    end
end
```

De [incrementar_concatenar](./incrementar_concatenar.rb):

```ruby
def incrementar(x,delta=1)
  raise RuntimeError if x.class === 'String'
  x+delta
end

def concatenar(*args)
  args.compact.map{|elm| elm.to_s.strip } .reject{|s| s==""}.join(' ')
end
```

3. Implementá al menos 3 tests para cada uno de los siguientes
   ejercicios de las prácticas anteriores:
   1. De la práctica 1: 4 (en_palabras), 5 (contar), 6
      (contar_palabras) y 9 (longitud). 
      5 -> 
   2. De la práctica 2: 1 (ordenar_arreglo), 2 (ordenar), 4
      (longitud), 14 (opposite) y 16(da_nil?). 



4. Implementá los tests que consideres necesarios para probar el Mixin
   Countable que desarrollaste en el ejercicio 11 de la práctica 2, sin
   dejar de cubrir los siguientes puntos:

    * Testear en una clase existente
    * Testear en una clase creada únicamente con el propósito de testear
    * Testear qué ocurre antes de que se invoque el método del que se está contando las
      invocaciones
    * Testear la inicialización correcta del Mixin
    * Testear algún caso extremo que se te ocurra
    
Resuelto en [test_countable](./test_countable.rb).

Como se debe testear en dos clases diferentes, creo un modulo con
todos los asserts que correran en ambos casos, luego simplemente
incluyo el modulo en las clases Test y no repito codigo.

5. Suponé que tenés que desarrollar una función llamada 'expansor' la
   cual recibe un string (conformado únicamente con letras) y devuelve
   otro string donde cada letra aparezca tantas veces según su lugar
   en el abecedario. Un ejemplo simple sería:

```ruby
expansor 'abcd'
#=>'abbcccdddd'
```

A continuación se presentará su especificación (sin implementar):

```ruby
require'minitest/autorun'
require'minitest/spec'

describe 'expansor' do

#Casos de prueba con situaciones y/o entradas de datos esperadas
describe 'Casos felices' do
    describe 'cuando la entrada es el string "a"' do
        it 'debe devolver "a"'
        
        end
    describe 'cuando la entrada es el string "f"' do
        it 'debe devolver "ffffff"'
        
        end
    describe 'cuando la entrada es el string "escoba"' do
        it 'debe devolver "eeeeessssssssssssssssssscccooooooooooooooobba"'
        
        end
end

#Casos de pruebas sobre situaciones inesperadas y/o entradas de datos 
#anómalas
describe 'Casos tristes' do
    describe 'cuando la entrada no es un string' do
        it 'debe disparar una excepción estándar con el mensaje "La entrada no es un string"'
        
        end
    describe 'cuando la entrada es el string vacío' do
        it 'debe disparar una excepción estándar con el mensaje "El string es vacío"'

        end
    describe 'cuando la entrada es el string "9"' do
        it 'debe disparar un excepción estándar con el mensaje "El formato del string es incorrecto"'

        end
    describe 'cuando la entrada es el string "*"' do
        it 'debe disparar una excepción estándar con el mensaje "El formato del string es incorrecto"'
        
        end
    end
end
```

1. Completar la especificación de los casos de prueba.

En [test_expansor](./test_expansor.rb).

2. Implementar la función expansor y verificar que todos los casos pasen.

En [expansor](./expansor.rb).
