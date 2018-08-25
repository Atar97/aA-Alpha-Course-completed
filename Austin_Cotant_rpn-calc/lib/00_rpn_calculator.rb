require 'byebug'
class RPNCalculator

  def initialize(arr = [])
    @calculator = arr
  end

  attr_accessor :calculator

  def push(element)
    @calculator.push(element)
  end

  def plus
    raise 'calculator is empty' if @calculator.length == 0
    last = @calculator.pop
    @calculator[-1] = @calculator[-1] + last
  end

  def value
    raise 'calculator is empty' if @calculator.length == 0
    @calculator.last
  end

  def minus
    raise 'calculator is empty' if @calculator.length == 0
    last = @calculator.pop
    @calculator[-1] = @calculator[-1] - last
  end

  def times
    raise 'calculator is empty' if @calculator.length == 0
    last = @calculator.pop
    @calculator[-1] = @calculator[-1] * last
  end

  def divide
    raise 'calculator is empty' if @calculator.length == 0
    last = @calculator.pop
    @calculator[-1] = @calculator[-1] / last.to_f
  end

  def tokens(str)
    arr = str.split
    opperators = %w(+ - * /)
    arr.each_with_index do |el, i|
      if opperators.include?(el)
        arr[i] = el.to_sym
      else
        arr[i] = el.to_i
      end
    end
    arr
  end

  def evaluate(str)
    things = self.tokens(str)
    things.each do |el|
      if el.is_a? Integer
        self.push(el)
      elsif el == :+
        self.plus
      elsif el == :-
        self.minus
      elsif el == :/
        self.divide
      elsif el == :*
        self.times
      end
    end
    self.value
  end

  def empty
    @calculator = []
  end 


end
