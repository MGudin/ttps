# Agrego dinamicamente el metodo divisible a la clase Integer.
# Dicho metodo devuelve true si el numero es divisible por n, lo que
# indica que es un multiplo de n.

class Integer
  def divisible?(n)
    true if self.remainder(n) == 0
  end
end

def suma_multiplos(n)
  multiples=(1..n).to_a.select do |i|
    i.divisible?(3) || i.divisible?(5)
  end
  multiples.sum
end

p suma_multiplos(10)
#=> 3+5+6+9+10 = 33
