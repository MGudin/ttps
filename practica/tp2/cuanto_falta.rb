def midnight
  now = Time.now
  Time.new(now.year, now.month, now.day, 23, 59, 59)
end

def cuanto_falta?(datetime=midnight())
  (datetime - Time.now )/60
end

## TestCases

p "con parametros"
p cuanto_falta? Time.new(2017,9,20,13,21)
p "sin parametros, hasta medianoche"
p cuanto_falta?
  
