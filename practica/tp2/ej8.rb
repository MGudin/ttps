VALUE= 'global'
module A
  VALUE= 'A'
  class B
    VALUE= 'B'
    def self.value
      VALUE
    end

    def value
      'iB'
    end
  end
  
  def self.value
    VALUE
  end
end

class C
  class D
    VALUE= 'D'
    def self.value
      VALUE
    end
  end
  module E
    def self.value
      VALUE
    end
  end
  def self.value
    VALUE
  end
end

class F < C
  VALUE= 'F'
end
