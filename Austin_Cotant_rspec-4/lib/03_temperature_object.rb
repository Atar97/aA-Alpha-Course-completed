class Temperature
  def self.ftoc(f)
    (f - 32)*5.0/9.0
  end

  def self.ctof(c)
    c*9/5.0 + 32
  end

  def initialize(values)
    if values[:c]
      @temperature = values[:c]
    elsif values[:f]
      @temperature = Temperature.ftoc(values[:f])
    else
      @temperature = 0
    end
  end

  def in_fahrenheit
    Temperature.ctof(@temperature)
  end

  def in_celsius
    @temperature
  end

  def self.from_celsius(int)
    Temperature.new({c: int})
  end

  def self.from_fahrenheit(int)
    Temperature.new({f: int})
  end
end
