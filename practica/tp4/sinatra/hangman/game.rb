module Game
  def setup
    @@words = {
      '1' => 'sarasa',
      '2' => 'hola',
      '3' => 'ruby',
      '4' => 'python',
      '5' => 'ttps'
    }
  end

  def self.included(base)
    @@words = {
      '1' => 'sarasa',
      '2' => 'hola',
      '3' => 'ruby',
      '4' => 'python',
      '5' => 'ttps'
    }
  end
end
