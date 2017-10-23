FIBONACCI = Enumerator.new do |yielded|
  a=b=1
  loop do
    yielded << a
    a,b = b,a+b
  end
end
