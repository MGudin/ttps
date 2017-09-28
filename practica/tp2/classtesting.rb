class Parent

  def initialize
    @parent_state = true
  end

end

class Son < Parent

  def initialize son_argument
    @son_state = son_argument
  end
  
end
