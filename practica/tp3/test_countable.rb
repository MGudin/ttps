# note: somehow cant use @class in emacs. Indentantion gets @c as a refference to indent 0.0

require 'minitest/autorun'
require 'minitest/unit'

require 'securerandom'

require_relative '../tp2/countable'
module TestCountableInterface

  def test_it_has_invoked_method
    assert_respond_to @object, :invoked
  end

  def test_it_has_invoked_question_method
    assert_respond_to @object, :invoked?
  end

  def test_count_invocation_of_wo_args
    assert_silent {@klass.count_invocations_of}
  end

  def test_correct_hash_initialization
    method = @method.to_sym
    @klass.count_invocations_of method
    hash = @klass.tracked_methods
    assert_block {hash.key? method }
    assert_equal @klass.invocations_of method
  end

  def test_methods_call_being_added
    method = @method.to_sym
    @klass.count_invocations_of method
    @object.send method
    hash = @klass.tracked_methods
    assert_equal @object.invoked(method), 1
  end

  def test_count_invocation_with_undefined_method
    random_method = (SecureRandom.hex 10).delete "0123456789"
    assert_silent {@klass.count_invocations_of random_method.to_sym}
  end
end

class TestCountableSampleClass < Minitest::Test
  class SimpleClass
    include Countable
    
    def salute
      p "hey you"
    end

    def dismiss
      p "goodbye"
    end
  end

  include TestCountableInterface
  def setup
    @klass = SimpleClass
    @object = SimpleClass.new
    @method = :salute
  end
end

class TestCountableStringClass < Minitest::Test
  include TestCountableInterface

  def setup
    @klass = String
    @method = :downcase
    @klass.include(Countable)
    @klass.count_invocations_of @method
    @object = String.new "Sarasa"
  end
end
