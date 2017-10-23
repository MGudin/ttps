module Countable


  ## Incluyo metodos de clase
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def count_invocations_of *args
      @@tracked_methods = args
    end

    alias_method :new_initialize, :initialize

    def initialize
      p "entro al initialize nuevo"
      old_initialize
    end
  end

  
  def invoked? sym
  end

  def invoked sym
  end

  ## class variables -> debo definirla si o si?
  @@tracked_methods = []
  ## instance variables
    
end

class SimpleClass

  include Countable

  def initialize
    p "entro al initialize original"
  end
  
  def salute
    p "hey you"
  end

  def salute_name name
    p "hi #{name}!"
  end

  count_invocations_of :salute
end
