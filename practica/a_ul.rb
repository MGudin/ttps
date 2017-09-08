def wrap_in_tags(tag, text="")
  "<#{tag}>#{text}</#{tag}>"
end

def to_ul(hash)
  html=""
  hash.each do |key, value|
    html=html+wrap_in_tags("li",key.to_s+":"+value.to_s)
  end
  p wrap_in_tags("ul", html)
end

hash={perros:1,gatos:1,peces:0}
to_ul(hash)
