require_relative '../tp1/contar.rb'

require_relative '../tp1/contar_palabras.rb'

require 'minitest/autorun'

class TestContar < MiniTest::Unit::TestCase

  def test_empty_strings_return_one
    assert_equal 1, contar("","")
  end

  def test_empty_string_as_second_argument
    assert_equal 0, contar("un string cualquiera", "")
  end

  def test_space_counts
    assert_equal 2,contar("un string cualquiera", " ")
  end
end

class TestContarPalabras < MiniTest::Unit::TestCase

  def setup
    @test_string = "La casa de la esquina tiene la puerta roja y la ventana blanca."
  end
  
  def test_counts_whole_word
    assert_equal 4, contar_palabras(@test_string,"la")
  end

  def test_empty_string
    assert_equal 0, contar_palabras("","la")
  end

  def test_empty_substring
    assert_equal 0, contar_palabras(@test_string, "")
  end
end

