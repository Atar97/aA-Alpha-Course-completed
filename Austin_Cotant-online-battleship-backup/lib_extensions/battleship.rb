require_relative 'ship.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'
require 'byebug'

class BattleshipGame
  attr_reader :boards, :players

  def initialize(player1 = HumanPlayer.new, player2 = ComputerPlayer.new)
    # I add the nil so that I can change the active player by * -1
    # the board that player1 is guessing on is board 1 when we do setup
    # player1 will set up board 2 because all the player guessing actions guess
    # on their own instance of @board
    @boards = [nil, Board.new, Board.new]
    @players = [nil, player1, player2]
    @players[1].board = @boards[1]
    @players[-1].board = @boards[-1]
    @active_player = 1
  end

  def play
    until game_over?
      play_turn
      @active_player *= -1
    end
    puts "Game over!!"
    puts "#{players[1].name}'s board was this at the end"
    puts @boards[-1].display
    puts "#{players[-1].name}'s board was this at the end"
    puts @boards[1].display
  end

  def board_state
    puts @board.display_hidden_ships
    puts "There are #{count} ships left to destroy"

  end

  def count
    @boards[active_player].count
  end

  def game_over?
    @boards[@active_player].won?
  end

  def play_turn
    # byebug
    human = @players[@active_player].is_a? HumanPlayer
    opp_ships = @boards[@active_player].count #will make a count_ships method soon
    if human
      puts "This is your board"
      puts @boards[@active_player * -1].display
      puts "This is your opponent's board"
      puts @boards[@active_player].display_hidden_ships
    end
    @players[@active_player].get_guess
    if human && opp_ships > @boards[@active_player].count #will also make a count_ships method
      puts "Congratulations, you sunk a ship!"
    end
  end

end
