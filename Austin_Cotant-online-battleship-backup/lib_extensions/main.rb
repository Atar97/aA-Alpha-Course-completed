require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'
require 'byebug'

#game = BattleshipGame.new
# 30.times do
#   game.boards[1].place_random_ship
#   game.boards[-1].place_random_ship
# end
#
# game.play

player1 = HumanPlayer.new
test_game = BattleshipGame.new(player1)
puts test_game.players[1].board.display
Ship.place_random_ship(:battleship, test_game.players[1])
Ship.place_random_ship(:battleship, test_game.players[1])
Ship.place_random_ship(:battleship, test_game.players[1])
ship1 = Ship.new(size:3, board:test_game.players[1].board)
ship1.add
# (0...3).each {|el| test_game.players[1].board.position_value([0,el],:h)}
puts test_game.players[1].board.display
