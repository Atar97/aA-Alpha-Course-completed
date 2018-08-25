require 'byebug'
class Board
  attr_accessor :grid
  def initialize (grid = false)
    if grid
      @grid = grid
    else
      @grid = [[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]]
    end
  end

  def place_mark(position, mark = :X)
    # added this line so I can remove marks if I need to
    if mark == nil
      @grid[position[0]][position[1]] = mark
    elsif empty?(position)
      @grid[position[0]][position[1]] = mark
    end
    mark
  end

  def each(&prc)
    (0..2).each do |i|
      (0..2).each do |j|
        prc.call(@grid[i][j])
      end
    end
  end

  # select will return an array of positions for which calling
  # the block on those positions returns true
  def select(&prc)
    positions = []
    (0..2).each do |i|
      (0..2).each do |j|
        positions << [i,j] if prc.call(@grid[i][j])
      end
    end
    positions
  end

  def place_marks(*args, mark)
    args.each {|el| place_mark(el, mark)}
    mark
  end

  def empty?(position)
    if @grid[position[0]][position[1]]
      return false
    else
      return true
    end
  end
  def winner
    # now winner checks for both X and O
    [:X, :O].each do |mark|
      # checking the rows for the mark
      win = @grid.any? do |row|
            row.all? {|pos| pos == mark }
          end
      return mark if win
      # checking the columns for the mark
      (0..2).each do |i|
        win = (0..2).all? {|j| @grid[j][i] == mark}
        return mark if win
      end
      #checking the left diagonal for the mark
      return mark if (0..2).all? {|i| @grid[i][i] == mark}
      return mark if (0..2).all? {|i| @grid[i][2 - i] == mark}
    end
    nil
  end

  def over?
    # end if there is a winner
    if winner
      return true
    end
    # then this block checks if it's not full because then it isn't over
    (0..2).each do |i|
      (0..2).each do |j|
        return false if empty?([i,j])
      end
    end
    # if we make it through the above block the thing is full so it is over
    true
  end
  # right now winning_move adds the mark to the called on object when it finds
  # a winning move. I thought adding the temp = self.dup would take care of that
  # I changed the code to remove the winning mark before returning it
  # it is just a patch but I can't figure out how to fix it
  def winnning_move(mark)
    valid = valid_moves
    temp = self.dup
    valid_moves.each do |move|
      temp.place_mark(move,mark)
      if temp.winner
        temp.place_mark(move,nil)
        return move
      end
      temp.place_mark(move,nil)
    end
    false
  end

  def valid_moves
    select {|el| el == nil}
  end

  def to_s
    str = "|"
    (0..2).each do |i|
      (0..2).each do |j|
        if @grid[i][j]
          str += @grid[i][j].to_s + "|"
        else
          str += " |"
        end
      end
      str += "\n|"
    end
    str.chop
  end
end
