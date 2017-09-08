# coding: utf-8

def create_association_table(n)
  # Dado un numero para rotar, creamos un hash cuyas claves seran las
  # letras del alfabeto y sus valores las correspondientes letras
  # rotadas.
  alphabet=("a".."z").to_a
  uppercase_alphabet=("A".."Z").to_a
  downcase_hash = Hash[alphabet.zip(alphabet.rotate(n))]
  upcase_hash = Hash[uppercase_alphabet.
                      zip(uppercase_alphabet.rotate(n))]
  downcase_hash.merge(upcase_hash)
end

def encript(char, table)
  # Acorde a una tabla de conversion, devuelve el valor encriptado del
  # caracter recibido como parametro, o bien el mismo caracter enviado
  # si no se encuentra en la tabla
  table[char] || char
end
  
def rot(string,n)
  table = create_association_table(n)
  string.each_char.inject("") do |encripted, char|
    encripted + encript(char,table)
  end
end

p rot("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!",13)
