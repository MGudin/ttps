# coding: utf-8

require 'minitest/autorun'
require 'minitest/spec'

require_relative 'expansor'


describe 'expansor' do

  #Casos de prueba con situaciones y/o entradas de datos esperadas
  describe 'Casos felices' do
    describe 'cuando la entrada es el string "a"' do
      it 'debe devolver "a"' do
        Expansor.expansor('a').must_equal('a')
      end
    end
    describe 'cuando la entrada es el string "f"' do
      it 'debe devolver "ffffff"' do
        Expansor.expansor('f').must_equal 'ffffff'
      end
    end
    describe 'cuando la entrada es el string "escoba"' do
      it 'debe devolver "eeeeessssssssssssssssssscccooooooooooooooobba"' do
        Expansor.expansor('escoba').must_equal 'eeeeessssssssssssssssssscccooooooooooooooobba'
      end
    end
  end
  #Casos de pruebas sobre situaciones inesperadas y/o entradas de datos 
  #anómalas
  describe 'Casos tristes' do
    describe 'cuando la entrada no es un string' do
      it 'debe disparar una excepción estándar con el mensaje "La entrada no es un string"' do
        error = proc{Expansor.expansor(1)}.must_raise StandardError
        error.message.must_match 'La entrada no es un string'
      end
    end
    describe 'cuando la entrada es el string vacío' do
      it 'debe disparar una excepción estándar con el mensaje "El string es vacío"' do
        error = proc{Expansor.expansor('')}.must_raise StandardError
        error.message.must_match 'El string es vacio'

      end
    end
    describe 'cuando la entrada es el string "9"' do
      it 'debe disparar un excepción estándar con el mensaje "El formato del string es incorrecto"' do
        error = proc{Expansor.expansor('9')}.must_raise StandardError
        error.message.must_match 'El formato del string es incorrecto'
      end
    end
    describe 'cuando la entrada es el string "*"' do
      it 'debe disparar una excepción estándar con el mensaje "El formato del string es incorrecto"' do
        error = proc{Expansor.expansor('*')}.must_raise StandardError
        error.message.must_match 'El formato del string es incorrecto'
      end
    end
  end
end
