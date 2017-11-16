class Expansor
  # Creates a hash wich key is a letter and value is the key n times
  # being n the order in the alphabet.
  # I.E : { 'a' => 'a', 'b' => 'bb', 'c' => 'ccc', ...}
  LETTERS_EXPANDED = Hash[('a'..'z').to_a.map.with_index{|x,i| [x,x*(i+1)]}]
  ERROR_MESSAGES = {'':'El string es vacio',
                    '9':'El formato del string es incorrecto',
                    '*':'El formato del string es incorrecto'}
                    
                         
  def self.expansor(str)
    begin
      raise StandardError, ERROR_MESSAGES[str.to_sym] if   ERROR_MESSAGES.key? str.to_sym
      str.gsub(/./, LETTERS_EXPANDED)
    rescue NoMethodError
      raise StandardError, 'La entrada no es un string'
    end
  end
end
