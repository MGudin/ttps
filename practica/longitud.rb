# coding: utf-8
def longitud(array)
  return array.map{ |str| str.length}
end

puts longitud([ 'TTPS','Opción','Ruby','Cursada2015']).to_s
