def notacion_entera(array)
  converted=0
  array.map.with_index do |value, index|
    converted = converted + value * (256**index)
  end
  converted
end

def notacion_hexa(array)
  converted='#'
  array.each do |i|
    converted=converted+i.to_s(16)
  end
  converted
end

a=[0,128,255]
p notacion_entera(a)
p '-------------------'
p notacion_hexa(a)
