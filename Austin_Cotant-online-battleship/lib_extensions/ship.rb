require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require 'byebug'

class Ship
  CANNON_SHIPS = {:aircraft_carrier => 5, :battleship => 4, :sub => 3, :destroyer=> 3, :patrol_boat => 2}
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
      @board.ships << self
      return self
    else
      return false
    end
  end

  def sunk?
    @position.all? {|el| @board.position_value(el) == :h}
  end

  def self.place_random_ship(name, board)
    rand_orrient = ['horz','vert'].shuffle.first
    if rand_orrient == 'horz'
      pos_horz = (0..9 - CANNON_SHIPS[name]).to_a
      pos_vert = (0..9).to_a
    else
      pos_horz = (0..9).to_a
      pos_vert = (0..9 - CANNON_SHIPS[name]).to_a
    end
    added = false
    until added
    rand_pos = [pos_vert.shuffle.first, pos_horz.shuffle.first]
      ship = Ship.new({position:rand_pos, size:CANNON_SHIPS[name], orrientation:rand_orrient, board:board})
      added = ship.add
    end
    ship
  end

  def self.cannon_ships
    CANNON_SHIPS
  end

end
