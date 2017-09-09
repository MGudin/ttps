
def fibonacci(array=[1,1,2])
  # calculo el numero
  term = array.slice(-2,2).sum
  fibonacci(array.push term) if term<4000000
  array
end

def calcular_suma()
  fibonacci().select do |n|
    n.even?
  end
       .sum
end

p calcular_suma
