module GenericFactory

  def initialize(**args)
    raise NotImplementedError
  end
  
  module ClassMethods
    def create(**args)
      new(**args)
    end
  end
  
  def self.included(base)
    base.extend(ClassMethods)
  end
end

module GFCM
  def create(**args)
    new(**args)
  end
end



class CreateMethodClass
  include GenericFactory
  extend GenericFactory::ClassMethods
  
  def initialize(**args)
    p "se incluyo GenericFactory como modulo"
  end
end

