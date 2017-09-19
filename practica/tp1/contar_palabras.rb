def contar_palabras(string, substring)
  return string.scan(/\b#{substring}\b/i).count
end

puts contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.","la")
