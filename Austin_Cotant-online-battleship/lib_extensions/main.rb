require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'
require_relative 'game.rb'
require 'byebug'

# this plays a computer vs human game
# player1 = HumanPlayer.new
# player2 = ComputerPlayer.new
# test_game = BattleshipGame.new(player1)
# test_game.play
game = false
puts 'Welcome to Battleship a game of skill and chance'
puts "Enter the number of human players (1/2)"
playcount = gets.to_i
if playcount == 2
  puts "What is the name of Player1?"
  p1 = HumanPlayer.new(Board.new, gets.chomp)
  puts "What is the name of Player2"
  p2 = HumanPlayer.new(Board.new, gets.chomp)
  game = BattleshipGame.new(p1, p2)
elsif playcount == 1
  puts "What is the name of Player1?"
  p1 = HumanPlayer.new(Board.new, gets.chomp)
  p2 = ComputerPlayer.new
  game = BattleshipGame.new(p1, p2)
else
  p1 = ComputerPlayer.new
  p2 = ComputerPlayer.new
  game = BattleshipGame.new(p1, p2)
end

game.play
