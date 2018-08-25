require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require 'byebug'

class Ship
  # CANNON_SHIPS = {aircraft_carrier:5, battleship:4, sub:3, destroyer:3, patrol_boat:2}
  attr_accessor :position, :orrientation, :board

  def initialize(options = {})
    # byebug
    defaults = {size:4, position:[0,0], :orrientation => 'horz', board: Board.new}
    defaults = defaults.merge(options)
    # this block of code will store all the positions the ship occupies in an array
    temp = []
    if defaults[:orrientation] == 'vert'
      (0...defaults[:size]).each do |el|
        temp << [defaults[:position][0] + el, defaults[:position][1]]
      end
    else
      (0...defaults[:size]).each do |el|
        temp << [defaults[:position][0] , defaults[:position][1] + el]
      end
    end
    @position = temp
    @board = defaults[:board]
    @orrientation = defaults[:orrientation]
  end

  def to_s
    @position.to_s
  end

  #returns true if the sip intersects with another ship or the edge of the board
  def intersect?
    if @orrientation == 'vert' && (position[0][0] + @position.length) > 9
          return true
    elsif @orrientation == 'horz' && (position[0][1] + @position.length) > 9
          return true
    end
    @position.any? do |el|
      @board.position_value(el) == :s
    end
  end

  def add
    unless intersect?
      @position.each {|el| @board.position_value(el, :s)}
      return self
    else
      return false
    end
  end

  def sunk?
    @positions.all? {|el| @board.position_value(el) == :h}
  end

end
