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
