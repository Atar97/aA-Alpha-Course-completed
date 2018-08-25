class Array
  def times_array(n = 1)
    self.map {|el| el * n}
  end
end
