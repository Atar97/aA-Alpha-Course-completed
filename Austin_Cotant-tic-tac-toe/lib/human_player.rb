class HumanPlayer
  attr_accessor :name, :mark
  def initialize(name = "Player 1", mark = :X)
    @name = name
    # @mark = mark
  end

  def get_move
    puts "Where would you like to move?"
    str = gets.chomp
    [str[0].to_i, str[-1].to_i]
  end

  def display(board)
    puts board.to_s
  end
end
