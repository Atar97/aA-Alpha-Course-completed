require_relative 'ship.rb'

class BattleshipGame
  attr_reader :board, :player

  def initialize(player1 = HumanPlayer.new, board = Board.new)
    @board = board
    @player1 = player1
    @player.board = @board1
  end

  def play
    until game_over?
      play_turn
    end
    puts "Game over!!"
  end

  def board_state
    puts @board.display_hidden_ships
    puts "There are #{count} ships left to destroy"

  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def attack(arg)
    @board.grid[arg[0]][arg[1]] = :x
  end

  def play_turn
    guess = @player.get_guess
    board_state
  end
end
