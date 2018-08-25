require_relative 'board.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'
require 'byebug'

class HumanPlayer
  attr_accessor :board, :name

  def initialize(board = Board.new, name = 'Player_1')
    @board = board
    @name = name
  end

  def get_guess
    puts "Guess where a ship may be"
    guess = gets.chomp
    guess = HumanPlayer.good_guess(guess)
    if guess
      # byebug
      if board.empty?(guess)
        puts "#{guess} is a miss"
        board.position_value(guess, :m)
      elsif board.position_value(guess) == :s
        puts "Hit, nice job"
        board.position_value(guess, :h)
      else
        puts "Guess again! This position has already been guessed"
      end
    else
      puts "Your Guess wasn't in a proper form"
    end
    guess
  end

  def self.good_guess(str)
    if str[0] == '[' && str[2] == ',' && str[4] == ']'
      return [str[1].to_i, str[3].to_i]
    elsif str[1] == ','
      return [str[0].to_i, str[2].to_i]
    end
    false
  end

  def setup(opp_board)
    puts "Would you like to use a random setup? (y/n)"
    if gets.chomp == 'y'
      Ship.cannon_ships.each do |name, size|
        Ship.place_random_ship(name, opp_board)
      end
      puts opp_board.display
    else
      Ship.cannon_ships.each do |name, size|
        added = false
        until added
          added = true
          puts "Where would you like to start your #{name}"
          input = gets.chomp
          pos = HumanPlayer.good_guess(input)
          puts "Will it be horizontal (type 'horz'), or vertical (type 'vert')"
          input = gets.chomp
          unless ['horz', 'vert'].include?(input)
            puts "Your ship's orrientation wasn't parseable \n"
            added = false
          end
          if pos
            temp_ship = Ship.new(:size => size, board:opp_board, position:pos, orrientation:input)
            put = temp_ship.add if added
              unless put
                puts "Your ship couldn't be placed with the initial conditions you provided\n"
                puts opp_board.display
                added = false
              end
          else
            puts "Your start position wasn't in the proper form\n"
            added = false
          end
        end
        puts "Here is your board as it stands"
        puts opp_board.display
      end
    end
  end

end

class ComputerPlayer
  attr_accessor :board, :name, :ships

  def initialize(board = Board.new)
    @board = board
    @name = 'SkyNet'
  end

  def good_guess(arg)
    # byebug
    if arg
      spot = @board.position_value(arg)
      return spot == nil || spot == :s
    end
    false
  end

  def get_guess
    numbers = (0..9).to_a
    guess = false
    until good_guess(guess)
      guess = [numbers.shuffle.first, numbers.shuffle.first]
    end
    spot = @board.position_value(guess)
    if spot == :s
      @board.position_value(guess, :h)
    else
      @board.position_value(guess, :m)
    end
    guess
  end

  def setup(opp_board)
    Ship.cannon_ships.each do |name, size|
      Ship.place_random_ship(name, opp_board)
    end
  end
end
