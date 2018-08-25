def reverser(&prc)
  prc.call.split.map {|el| el.reverse}.join(" ")
end

def adder(int =1, &prc)
  prc.call + int
end

def repeater(n =1, &prc)
  n.times {prc.call}
end
