def incrementar(x,delta=1)
  raise RuntimeError if x.class === 'String'
  x+delta
end

def concatenar(*args)
  args.compact.map{|elm| elm.to_s.strip } .reject{|s| s==""}.join(' ')
end
