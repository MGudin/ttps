def procesar_hash(aHash, aProc)
  aHash.invert.transform_values! do |value|
    aProc.call(value)
  end
end
