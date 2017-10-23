def test_exceptions(*args)
  begin
    yield args
  rescue RuntimeError
    p "Algo malio sal"
    :rt
  rescue NoMethodError => e
    p "No encontre un metodo: " + e.message
    :nm
  rescue Exception => e
    p "no se que hacer"
    raise e
  else 
    :ok
  end
end
