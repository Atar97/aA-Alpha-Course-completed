def measure(n = 1, &prc)
  first = Time.now
  n.times {prc.call}
  after = Time.now
  (after - first)/n
end
