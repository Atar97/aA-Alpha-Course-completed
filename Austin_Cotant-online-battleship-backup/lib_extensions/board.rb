require_relative 'player.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'

class Board
  attr_accessor :grid

  def initialize(grid = nil)
    unless grid
      @grid = Board.default_grid
    else
      @grid = grid
    end
  end

  def self.default_grid
    answer = []
    10.times {answer << Array.new(10,nil)}
    answer
  end

  #returns what the value of the position was, changes it to value if a value is given
  def position_value(pos, value = 42)
    unless value == 42
      @grid[pos[0]][pos[1]] = value
    end
      @grid[pos[0]][pos[1]]
  end

  def each(&prc)
    (0...@grid.length).each do |i|
      (0...@grid[0].length).each do |j|
        prc.call(@grid[i][j])
      end
    end
  end

  def empty?(arg = false)
    if arg
      return false if @grid[arg[0]][arg[1]]
    else
      each {|el| return false if el}
    end
    true
  end

  def count
    counter = 0
    each {|el| counter +=1 if el == :s}
    counter
  end


  def full?
    each {|el| return false unless el}
    true
  end

  def place_random_ship
    unless full?
      placement = []
      placement << (0...@grid.length).to_a.shuffle.first
      placement << (0...@grid[0].length).to_a.shuffle.first
      @grid[placement[0]][placement[1]] = :s
    else
      raise 'Board is full'
    end

  end

  def display
    str = "_0_1_2_3_4_5_6_7_8_9\n"
    counter = 0
    each do |el|
      if el
        str += "|#{el}"
      else
        str += "| "
      end
      if counter % 10 == 9
        str+= "|#{counter/10}\n"
      end
      counter +=1
    end
    str + "____________________\n"
  end

  def display_hidden_ships
    str = "_0_1_2_3_4_5_6_7_8_9\n"
    counter = 0
    each do |el|
      if el && el != :s
        str += "|#{el}"
      else
        str += "| "
      end
      if counter % 10 == 9
        str+= "|#{counter/10}\n"
      end
      counter +=1
    end
    str + "____________________\n"
  end

  def won?
    each {|el| return false if el == :s}
    true
  end

  def [](arg)
    @grid[arg[0]][arg[1]]
  end

end
