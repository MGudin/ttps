def to_string(obj, separator="-->")
  obj_to_s = obj.to_s
  print obj_to_s, separator, obj_to_s.length, "\n"
end

def longitud(*args)
  args.each do |a|
    to_string(a)
  end
end

## TestCase

longitud(9,Time.now,'Hola',{un:'hash'},:ruby)
