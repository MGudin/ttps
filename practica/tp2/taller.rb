class Taller
  def probar(objeto)
    objeto.arrancar
  end
end

class Vehiculo

  attr_accessor :llave, :en_marcha, :class_repr
  
  def initialize(c)
    @llave = true
    @en_marcha = false
    @class_repr = c
  end

  def arrancar
    @llave
  end

  def status
    if @en_marcha
      p "#{@class_repr} esta en marcha"
    else
      p "#{@class_repr} se encuentra apagado"
    end
  end

  private
  def poner_en_marcha
    @llave
  end

  
end

class Auto < Vehiculo

  attr_accessor :freno_de_mano, :punto_muerto

  def initialize(class_representation)
    super
    @freno_de_mano = false
    @punto_muerto = true
    
  end

  def arrancar
    @en_marcha=(super and poner_en_marcha)
  end

  private
  def poner_en_marcha
    !@freno_de_mano and @punto_muerto
  end
end

class Moto < Vehiculo
  attr_accessor :patada

  def initialize(class_representation)
    super
    @patada=true
  end

  def arrancar
    @en_marcha = poner_en_marcha
  end
  
  private
  def poner_en_marcha
    @patada
  end
end

class Lancha < Vehiculo

  def initialize(class_representation)
    super
  end

  def arrancar
    @en_marcha = super
  end
end

def test_case()
  taller = Taller.new
  auto = Auto.new("El auto")
  moto = Moto.new("La moto")
  lancha = Lancha.new("La lancha")

  arreglo = [auto, moto, lancha]

  arreglo.each do |vehiculo|
    p "probando #{vehiculo.class_repr}"
    p "con todo"
    taller.probar(vehiculo)
    vehiculo.status
    p "sin llave"
    vehiculo.llave = false
    taller.probar(vehiculo)
    vehiculo.status
  end
end
