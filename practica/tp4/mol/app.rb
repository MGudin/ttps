class Mol


  def self.run
    @@code=400
    @@number = Random.rand (1..42)
    code
  end

  def self.statusCode
    @@code
  end

  def self.number
    @@number
  end
  private
  def self.code
    @@code=200 if @@number==42
  end
end
