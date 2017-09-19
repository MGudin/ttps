str="hey ruby"

puts "str=#{str}\n"

reverse=str.reverse

puts "orden inverso: #{reverse}\n"

wo_whitespaces=str.gsub(/(\s)*/,"")

puts "sin espacios:#{wo_whitespaces}\n"

ascii=str.encode(Encoding::ASCII)

puts "en ascii: #{ascii}\n"

vocals_hash={ "a" => 4, "e" => 3, "i" => 1, "o" => 0, "u" => 6 }

vocals_to_number = str.gsub(/[aeiou]/i, vocals_hash)

puts "Con vocales reemplazadas: #{vocals_to_number}"
