def contar(string, substring)
  return string.scan(/#{substring}/i).count
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.","la")
