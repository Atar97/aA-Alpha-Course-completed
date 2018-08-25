require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'
#
# game = BattleshipGame.new
# 5.times {game.board.place_random_ship}
# game.play
# ship1 = Ship.new(position:[4,9], orrientation:'vert')
# ship2 = Ship.new(position:[5,7], board:ship1.board)
# puts ship1.add
# puts ship2.add
# puts ship1.board.display

comp1 = ComputerPlayer.new
comp1.board.position_value([5,5],:s)
comp1.board.position_value([5,6],:h)
comp1.board.position_value([7,6],:m)
puts 
puts comp1.board.display
