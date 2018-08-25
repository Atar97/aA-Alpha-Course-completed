require_relative 'human_player.rb'
require_relative 'computer_player.rb'
require_relative 'board.rb'
require_relative 'game.rb'

array = [[1,2,3],[4,5,6],[7,8,9]]
brd1 = Board.new
brd1.place_marks([0,0], [1,0], :O)
brd2 = Board.new(array)
puts brd2
print brd2.select {|el| el.even?}.to_s + "\n"
puts brd1
brd1.winnning_move(:O)
puts brd1

# comp1 = ComputerPlayer.new
# comp1.board = brd1
# p comp1.get_move
