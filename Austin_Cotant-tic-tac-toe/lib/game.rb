require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player1, :player2, :current_player
  def initialize(p1, p2)
    @board = Board.new
    @player1 = p1
    @player2 = p2
    @current_player = @player1
  end

  #this passes the specs but I feel like play_turn should use
  #@board.place_mark(move, @current_player.mark)
  def play_turn
    move = @current_player.get_move
    switch_players!
    @board.place_mark(move, :X)
  end

  def switch_players!
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end
