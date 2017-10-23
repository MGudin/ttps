class GenericFactory
    def self.create(**args)
        new(**args)
    end
    
    def initialize(**args)
        raise NotImplementedError
    end
end


class SomeClass < GenericFactory
  def initialize(**args)
    p "hola!"
  end
end
