# File.open("dictionary.txt")
# main_dictionary = File.readlines("dictionary.txt")
# File.close("dictionary.txt")
require_relative 'hangman.rb'
main_dictionary = []
File.foreach('dictionary.txt') do |line|
  main_dictionary << line.chomp
end

player2 = HumanPlayer.new(main_dictionary)
# player1 = ComputerPlayer.new(main_dictionary)
player1 = ComputerPlayer.new(main_dictionary)
game = Hangman.new(referee:player2, guesser:player1)
# game.setup
# 5.times {game.take_turn}
puts game.play
