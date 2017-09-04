def reemplazar(str="")
    return str.gsub("{", "\n").gsub("}", "\nend")
end

puts reemplazar("3.times { |i| puts i }")
