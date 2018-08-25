require_relative 'ship.rb'
require_relative 'board.rb'
require_relative 'battleship.rb'
require_relative 'ship.rb'
require 'byebug'

class GameWithExplain
  attr_accessor :game
  def initialize(player1, player2)
    @game = BattleshipGame.new(player1, player2)
  end

  def self.start
    game = false
    puts 'Welcome to Battleship a game of skill and chance'
    puts "Enter the number of human players (1/2)"
    playcount = gets.to_i
    if playcount == 2
      puts "What is the name of Player1?"
      p1 = HumanPlayer.new(Board.new, gets.chomp)
      puts "What is the name of Player2"
      p2 = HumanPlayer.new(Board.new, gets.chomp)
      game = GameWithExplain.new(p1, p2)
    elsif playcount == 1
      puts "What is the name of Player1?"
      p1 = HumanPlayer.new(Board.new, gets.chomp)
      p2 = ComputerPlayer.new
      game = GameWithExplain.new(p1, p2)
    else
      p1 = ComputerPlayer.new
      p2 = ComputerPlayer.new
      game = GameWithExplain.new(p1, p2)
    end
    game
  end

end
