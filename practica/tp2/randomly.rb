class Array

  def randomly
    ## como mandarle un bloque al each condicionalmente
    enum = shuffle.to_enum
    if block_given?
      shuffle.each {|e| yield e }
    else
      enum
    end
    

  end
end
