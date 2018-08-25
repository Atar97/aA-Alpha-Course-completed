require 'byebug'
class ComputerPlayer
  attr_accessor :name, :board, :mark
  def initialize(name = "Comp 1", mark = :O)
    @name = name
    @board = nil
    @mark = mark
  end

  def get_move
    win = @board.winnning_move(@mark)
    return win if win
    @board.valid_moves.shuffle.first
  end

  def display(board)
     @board = board
  end

  def to_s
    @name
  end

end
