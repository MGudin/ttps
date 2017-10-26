module Countable


  ## Incluyo metodos de clase
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def count_invocations_of *args
      @@tracked_methods = {}
      args.each do |arg|
        @@tracked_methods[arg] = 0
      end
      wrap_instance_methods args
    end

    def tracked_methods
      @@tracked_methods
    end

    def tracked_methods(key)
      @@tracked_methods[key]
    end
    private
    def wrap_instance_methods methods
      methods.each do |method|
        # get a new name for method
        renamed_method = rename_method(method,"old_")
        # alias the method with the name generated
        alias_method  renamed_method, method
        # redefine the method. Decorate it to count
        # it invocation.
        define_method(method) do
          @@tracked_methods[method] += 1
          method(renamed_method).call
        end
      end
    end

    def rename_method method_symbol, prepend="", append=""
      (prepend.to_s + method_symbol.to_s + append.to_s).to_sym
    end
  end

  
  def invoked? sym
    self.class.tracked_methods(sym) != 0
  end

  def invoked sym
    self.class.tracked_methods(sym)
  end
    
end

class SimpleClass

  include Countable

  def salute
    p "hey you"
  end

  def dismiss
    p "Goodbye"
  end

  count_invocations_of :salute, :dismiss
end
