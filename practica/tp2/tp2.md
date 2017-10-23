# TP2

## Metodos

1. Implementá un método que reciba como parámetro un arreglo de
   números, los ordene y devuelva el resultado. Por ejemplo:
   
``` ruby
ordenar_arreglo([ 1,4,6,2,3,0,10] )
#=>[0,1,2,3,4,6,10]
```

[De ej1.rb](./ej1.rb)
```ruby
def ordenar_arreglo ary
  ary.sort
end
```

2. Modificá el método anterior para que en lugar de recibir un arreglo
   como único parámetro, reciba todos los números como parámetros
   separados. Por ejemplo:
   
```ruby
ordenar(1,4,6,2,3,5,0,10,9)
#=>[0,1,2,4,5,6,9,10]
```

[De ej2.rb](./ej2.rb)
```ruby
def ordenar(*args)
  [*args].sort
end
```

3. Suponé que se te da el método que implementaste en el ejercicio
   anterior para que lo uses a fin de ordenar un arreglo de números
   que te son provistos en forma de arreglo.
   ¿Cómo podrías invocar el método? Por ejemplo, teniendo la siguiente
   variable con los números a ordenar:
   
```ruby
entrada= [ 10,9,1,2,3,5,7,8]
#Dada`entrada',invocara#ordenarutilizandosusvaloresparaordenarlos
```
*??? Preguntar*

```ruby
ordenar(*entrada)
```

4. Escribí un método que dado un número variable de parámetros que
   pueden ser de cualquier tipo, imprima en pantalla la cantidad de
   caracteres que tiene su representación como String y la
   representación que se utilizó para contarla.
   
   **Nota:** Para convertir cada parámetro a string utilizá el método
   #to_s presente en todos los objetos.

    Por ejemplo:
    
```ruby
longitud(9,Time. now,'Hola',{un:'hash'},:ruby)
#Debeimprimir:
#"9"-->1
#"2017-09-1413:22:10+0000"-->25
#"Hola"-->4
#{:un=>"hash"}-->13
#ruby-->4
```

[De longitud.rb](./longitud.rb)
```ruby
def to_string(obj, separator="-->")
  obj_to_s = obj.to_s
  print obj_to_s, separator, obj_to_s.length, "\n"
end

def longitud(*args)
  args.each do |a|
    to_string(a)
  end
end
```

5. Implementá el método cuanto\_falta? que opcionalmente reciba como
   parámetro un objeto Time y que calcule la cantidad de minutos que
   faltan para ese momento. Si el parámetro de fecha no es provisto,
   asumí que la consulta es para la medianoche de hoy.
   
   Por ejemplo:

```ruby
cuanto\_falta? Time.new(2017,12,31,23,59,59)
#Debe retornar la cantidad de minutos que faltan para las 23:59:59 del
#31/12/2017
cuanto_falta?
#Debe retornar la cantidad de minutos que faltan para la medianoche de
#hoy
```

[De cuanto_falta.rb](./cuanto_falta.rb)

```ruby
def midnight
  now = Time.now
  Time.new(now.year, now.month, now.day, 23, 59, 59)
end

def cuanto_falta?(datetime=midnight())
  (datetime - Time.now )/60
end
```

6. Analizá el siguiente código e indicá qué problema(s) puede tener.

```ruby
#Tira un dado virtual de 6 caras
def tirar_dado
    rand 1. .6
end

#Mueve la ficha de un jugador tantos casilleros como indique el dado
#en un tablero virtual de 40 posiciones.

#Si no se recibe la cantidad de casilleros, aprovecho el valor por
#defecto para ese parámetro para evitar tener que
#llamar a #tirar_dado dentro del cuerpo del método.

def mover_ficha(fichas,jugador,casilleros=tirar_dado)
    fichas[jugador] += casilleros
    if fichas[jugador] > 40
        puts"Ganó#{jugador}!!"
        true
    else
        puts"#{jugador}ahora está en el casillero #{fichas[jugador]}"
        fichas[jugador]
    end
end

posiciones= {azul:0,rojo:0,verde:0}
finalizado=false

until finalizado
    ['azul','rojo','verde'].shuffle.each do |jugador|
        finalizado= mover_ficha(posiciones,jugador)
    end
end
```

El problema con el codigo es que a medida que se desarrolla el juego,
devuelve el valor del hash de posiciones de las fichas. Que es un
valor truthy ya que va a devolver siempre algo mayor que cero. En
consecuencia nunca se ejecutara mas de una ronda. 

El shuffle no funciona a no ser que se utilicen simbolos. En realidad
el mover ficha que se ejecuta dentro del each(no puede acceder a los
elementos del hash por el indice). Por que?

El each se recorre entero aunque un jugador haya ganado,
sobreescribiendo el valor de finalizado, es decir, supongamos que el
primer jugador del each gana el juego, escribiendo true en finalizado,
se ejecutaran los otros dos de todas formas, sobreescribiendo la
variable y haciendo que el juego continue aunque haya un ganador.

7. Modificá el código anterior para, acorde a tu análisis, corregir
   los problemas que pueda tener.
   *Nota: asumí que el juego debe terminar al momento que el primer
   jugador supera la posición 40 en el tablero.*
   
Como bien mencione el en ejercicio anterior, el problema del mover_fichas
se resuelve utilizando simbolos en vez de strings, en el shuffle.

En cuanto al problema de la devolucion de valores truthy, podemos
eliminar la linea donde devuelve la posicion del jugador y simplemente
dejar el puts que devuelve nil, valor falso.

Por ultimo, para no ejecutar jugadas de mas una vez que un jugador ha
ganado, en vez el #each utilizamos el #take_while, que hace lo mismo
que el #each, solo que va tomando valores mientras el bloque devuelva
true.

[De juego.rb](./juego.rb)

```ruby
def mover_ficha(fichas,jugador,casilleros=tirar_dado)
    fichas[jugador] += casilleros
    if fichas[jugador] > 40
        puts"Ganó#{jugador}!!"
        true
    else
        puts"#{jugador}ahora está en el casillero #{fichas[jugador]}"
    end
end
(...)
until finalizado
  [:azul,:rojo,:verde].shuffle.take_while do |jugador|
    !finalizado = mover_ficha(posiciones,jugador)
  end
end
```

## Clases y Modulos

1. Modelá con una jerarquía de clases algo sencillo que represente la
   siguiente situación:
   - Tres tipos de vehículo: Auto, Moto y Lancha
   - Los tres tipos arrancan usando una llave.
     El auto, adicionalmente, requiere que no esté puesto el freno de
     mano y que el cambio esté en punto muerto. La moto, por otra
     parte, requiere una patada (sin la llave). La lancha arranca con
     la llave y listo. 
   - El arranque de los tres vehículos se prueba en un taller. La
     especificación de Taller es la siguiente:

```ruby 
class Taller
    def probar(objeto)
        objeto.arrancar
    end
end
```

Suponé que, posteriormente, el taller necesita probar una
motosierra. ¿Podrías hacerlo? ¿Cómo? ¿Qué concepto del lenguaje estás
usando para poder realizar esto?

Si, simplemente creo una clase que hereda de Vehiculo e implemento el
metodo #arrancar que es el que utiliza la clase Taller.

**Pregunta** Initialize. Si declaro en clase padre que no recibe nada
y en clase hija que recibe argumento chilla.


2. ¿Qué diferencia hay entre el uso de include y extend a la hora de
   incorporar un módulo en una clase?
   1.  Si quisieras usar un módulo para agregar métodos de instancia a
      una clase, ¿qué forma usarías a la hora de incluirlo en la clase?
   2. Si en cambio quisieras usar un módulo para agregar métodos de
      clase, ¿qué forma usarías a la hora de incluir el módulo en la
      clase? 

**Include** sirve para agregar metodos de instancia a una clase
mientras que **Extends** sirve para agregar metodos de clase. Dicho
esto, existe un "workaround" para utilizar una sola de las sentencias
y agregar tanto metodos de clase como de instancia.

Esto ultimo se logra mediante la utilizacion de un hook que posee el
include, de forma tal que al incluir los metodos de instancia se puede
cambiar la clase receptora del include. Este hook es el
**self.included** en donde se puede utilizar como sigue:

```ruby
module Foo
    
    def self.included(base)
        base.extend(ClassMethods)
    end
    
    module ClassMethods
    
        def bar
            p 'classmethod'
        end
        
    end #cierra el ClassMethods
    
    def baz
        p 'instance method'
    end
    
end

class MyClass
    include Foo
end
```

Al hacer el include se agregan el metodo de instancia, y al hacerlo
se ejecuta el hook que agrega el metodo de clase.


3. Implementá el módulo Reverso para utilizar como Mixin e incluilo en
   alguna clase para probarlo. Reverso debe contener los siguientes
   métodos: 
   1. #di\_tcejbo: Imprime el object_id del receptor en espejo (en
      orden inverso). 
   2. #ssalc: Imprime el nombre de la clase del receptor en espejo.

Como son metodos de instancia utilizo include del modulo
en [reverso.rb](./reverso.rb):

```ruby
module Reverso

  def di_tcejbo
    p object_id.to_s.reverse
  end

  def ssalc
    p self.class.to_s.reverse
  end

end
```


4.

5. Dada la siguiente clase abstracta GenericFactory, implementá
   subclases de la misma que permitan la creación de instancias de dichas
   clases mediante el uso del método de clase .create, de manera tal que
   luego puedas usar esa lógica para instanciar objetos sin invocar
   directamente el constructor new.
   
```ruby
class GenericFactory
    def self.create(**args)
        new(**args)
    end
    
    def initialize(**args)
        raise NotImplementedError
    end
end
```

El ::create hace un llamado a ::new, quien implicitamente hace un
llamado a #initialize. Como en la clase GenericFactory dicho elemento
levanta un NotImplementedError. Cualquier subclase debera redefinir el
metodo para que pueda ser instanciada.

Por ejemplo de [generic_factory.rb](./generic_factory.rb)

```ruby
class SomeClass < GenericFactory
  def initialize(**args)
    p "hola!"
  end
end
```

6. Modificá la implementación del ejercicio anterior para que
   GenericFactory sea un módulo que se incluya como Mixin en las
   subclases que implementaste. ¿Qué modificaciones tuviste que hacer
   en tus clases? 

Para este ejercicio GenericFactory es un modulo. Por lo tanto, tengo
dos formas de implementarlo.
    1. Crear un modulo con metodos de clase y otro con metodos de
    instancia. Luego utilizar extend e include respectivamente en la
    clase hija.
    2. Crear el modulo de forma tal que dentro del mismo definimos
    otro modulo con metodos de clase y utilizar el hook included.

De [generic_factory_mixin.rb](./generic_factory_mixin.rb)

```ruby
module GenericFactory

  def initialize(**args)
    raise NotImplementedError
  end

  module ClassMethods
    def create(**args)
      new(**args)
    end
  end
  
  def self.included(base)
    base.extend(ClassMethods)
  end
end


class CreateMethodClass
  include GenericFactory

  def initialize(**args)
    p "se incluyo GenericFactory como modulo"
  end
end
```

7. Extendé las clases TrueClass y FalseClass para que ambas respondan
   al método de instancia opposite, el cual en cada caso debe retornar
   el valor opuesto al que recibe la invocación al método. Por
   ejemplo: 

```ruby
false.opposite
#=>true
true.opposite
#=>false
true.opposite.opposite
#=>true
```

Primero creamos el modulo [Opposite](./opposite):

```ruby
module Opposite
  def opposite
    not self
  end
end
```

Luego se lo agregamos dinamicamente a TrueClass y FalseClass mediante
el metodo #include(Opposite).

8. Analizá el script Ruby presentado a continuación e indicá:

```ruby
VALUE= 'global'
module A
    VALUE= 'A'
    class B
        VALUE= 'B'
        def self.value
            VALUE
        end

        def value
            'iB'
        end
    end
    
    def self.value
        VALUE
    end
end

class C
    class D
        VALUE= 'D'
        def self.value
            VALUE
        end
    end
    module E
        def self.value
            VALUE
        end
    end
    def self.value
        VALUE
    end
end
    
class F < C
    VALUE= 'F'
end
```

1. ¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está
   obteniendo el valor?
   
   1. puts A.value
   Imprime "A" ya que esta llamando al metodo definido como self.value
   dentro del modulo A. Dicho metodo devuelve VALUE que se encuentra
   definido como A
   
   2. puts A::B.value
   Al hacer A::B.value se esta invocando al metodo de clase value de
   B, que se encuentra dentro del namespace del modulo A. Por lo
   tanto, viendo la definicion del metodo self.value y teniendo en
   cuenta que se inicializa la variable como "B", imprime "B".
   
   3. puts C::D.value
   En forma similar al punto anterior imprime D. La unica diferencia
   es que la clase D se encuentra definida dentro de la clase C. Como
   una clase es en esencia un modulo, funciona como un namespace.
   
   4. puts C::E.value
   En este caso, el lookup de la variable es como sigue: 
   - primero se busca en el modulo E, no se encuentra definido.
   - Luego se busca en la Clase C, donde tampoco se encuentra
     definida.
   - Finalmente obtiene el valor global.
   Entonces imprime "global"
   
   5. puts F.value
   Devuelve "global", ya que aunque F tenga definida la variable se
   ejecuta el metodo de C quien no lo tiene definido y lo sale a
   buscar al scope global.
   
2. ¿Qué pasaría si ejecutases las siguientes sentencias? ¿Por qué?

    1. puts A::value
    Devuelve "A", ya que se esta buscando el valor de value en el
    namespace de A.
    
    2. puts A.new.value
    Devuelve un NoMethodError. Como A es un modulo, no se puede
    instanciar como si fuese una clase. **Moraleja:** Una clase es un
    modulo, un modulo no es una clase.
    
    3. puts B.value
    Tira un unitialized constant, pues B esta definida solo dentro del
    scope de A.
    
    4. puts C::D.value
    Imprime "D". No hay nada mas que lo que ya se explico en el
    ejercicio previo

    5. puts C.value
    "global"
    
    6. puts F.superclass.value
    F.superclass hace referencia a C. Como C no tiene definido el
    value, devuelve "global".

## Bloques

1. Escribí un método da\_nil? que reciba un bloque, lo invoque y
   retorne si el valor de retorno del bloque fue nil. Por ejemplo:
   
```ruby
da_nil?{}
#=>true
da_nil? do
'Algo distinto de nil'
end
#=>false
```

De [danil.rb](./danil.rb)

```ruby
def da_nil?
  if yield
    false
  else
    true
  end
end
```

2. Implementá un método que reciba como parámetros un Hash y Proc, y
   que devuelva un nuevo Hash cuyas las claves sean los valores del
   Hash recibido como parámetro, y cuyos valores sean el resultado de
   invocar el Proc con cada clave del Hash original. Por ejemplo:
   
```ruby
hash= {'clave'= > 1,:otra_clave= > 'valor'}
procesar_hash(hash,- > (x){x. to_s. upcase})
#=>{1=>'CLAVE','valor'=>'OTRA_CLAVE'}
```

Utilizamos el metodo invert para cambiar claves por keys y viceversa
en el hash. Luego transform_values para invocar el bloque que
transforma los valores del hash.

De [procesar_hash.rb](./procesar_hash.rb)

```ruby
def procesar_hash(aHash, aProc)
  aHash.invert.transform_values! do |value|
    aProc.call(value)
  end
end
```

3. Implementá un método que reciba un número variable de parámetros y
   un bloque, y que al ser invocado ejecute el bloque recibido
   pasándole todos los parámetros que se recibieron encapsulando todo
   esto con captura de excepciones de manera tal que si en la
   ejecución del bloque se produce alguna excepción, proceda de la
   siguiente forma: 
   
   - Si la excepción es de clase RuntimeException, debe imprimir en
   pantalla "Algo salió mal...", y retornar :rt.
   - Si la excepción es de clase NoMethodError, debe imprimir
   "Noencontréunmétodo:" más el mensaje original de la excepción
   que se produjo, y retornar :nm.
   - Si se produce cualquier otra excepción, debe imprimir en pantalla
   "¡No sé qué hacer!", y relanzar la excepción que se produjo.
   
   En caso que la ejecución del bloque sea exitosa, deberá retornar
   :ok.
   
   **Tips:** Leer sobre las sentencias raise y rescue.
   
Las excepciones en ruby se tratan encerrando el bloque de codigo entre
begin end. Dentro de estos dos se pueden tratar los errores usando la
sentencia rescue ClaseDeError. Tambien se puede utilizar un else, en
caso de que la ejecucion del codigo encerrado no genere ninguna
excepcion.

Dentro del rescue podemos hacer referencia a la excepcion mediante la
notacion '=>' y acceder a las propiedades del objeto que representa la
excepcion.

De [exceptions](./exceptions.rb)

```ruby
def test_exceptions(*args)
  begin
    yield args
  rescue RuntimeError
    p "Algo malio sal"
    :rt
  rescue NoMethodError => e
    p "No encontre un metodo: " + e.message
    :nm
  rescue Exception => e
    p "no se que hacer"
    raise e
  else 
    :ok
  end
end
```

## Enumeradores

1. Si no lo hiciste de esa forma en la práctica 1, escribí un
   enumerador que calcule la serie de Fibonacci.
   
Usando el constructor de enumerator que recibe un bloque.

De [fibonnacci_enum](./fibonnacci_enum.rb)

```ruby
FIBONACCI = Enumerator.new do |yielded|
  a=b=1
  loop do
    yielded << a
    a,b = b,a+b
  end
end
```

2. ¿Qué son los lazy enumerators? ¿Qué ventajas les ves con respecto
   al uso de los enumeradores que no son lazy? **Tip:** Analizalo pensando
   en conjuntos grandes de datos. 
   
De
[Lazy enumerators](http://patshaughnessy.net/2013/4/3/ruby-2-0-works-hard-so-you-can-be-lazy)
(se refiere a la version 2.0 pero lo importante son los conceptos):

Existe una relacion entre el modulo Enumerable y
Enumerator. Enumerable provee metodos para tratar con objetos de forma
tal que se pueda sortear, buscar, seleccionar... etc. Dichos metodos
son el collect, select, any?... etc.
Enumerator es un objeto que produce datos de cierta forma.
Entonces, podria decirse que los metodos de enumerable consumen datos
generados por enumerator.

Ahora bien, los enumerators producen datos y por como funciona ruby,
al encadenar metodos(supongamos un collect sobre un arreglo) se
ejecuta el metodo, se devuelve un arreglo sobre el cual operan los
siguientes metodos, si hubiese. El problema es que si el arreglo que
devuelve el collect por algun motivo es infinito, no se ejecutaran
nunca los siguientes metodos.

De ahi que se introduce en ruby la lazy evaluation, en donde se
modifica este flujo de datos de forma tal que ya no se pasan entre
metodos arreglos de resultados. Sino que se van pasando elemento a
elemento, lo que posibilita iterar y operar sobre conjuntos de datos
infinitos, en donde el ultimo metodo de la cadena es quien tiene el
control de finalizacion.

Su ventaja resulta evidente con lo expuesto anteriormente, para
conjuntos de datos muy grandes puede operarse sobre los mismos incluso
antes de finalizar la iteracion, incluso puede operarse sobre un
conjunto infinito.

3. Extendé la clase Array con el método randomly que funcione de la
   siguiente manera:
   
   - Si recibe un bloque, debe invocar ese bloque con cada uno de los
   elementos del arreglo en orden aleatorio.
   
   - Si no recibe un bloque, debe devolver un enumerador que va
   arrojando, de a uno, los elementos del arreglo en orden aleatorio.
   
De [randomly](./randomly.rb)

```ruby
class Array

  def randomly
    ## como mandarle un bloque al each condicionalmente??
    enum = shuffle.to_enum
    if block_given?
      shuffle.each {|e| yield e }
    else
      enum
    end
  end
end
```

