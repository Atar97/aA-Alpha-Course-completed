class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(options = {})
    defaults = {guesser: HumanPlayer.new, referee: ComputerPlayer.new}
    defaults = defaults.merge(options)
    @guesser = defaults[:guesser]
    @referee = defaults[:referee]
    @board = nil
  end

  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board = Array.new(secret_length)
  end

  def take_turn
    guess = @guesser.guess(@board)
    guess_indices = @referee.check_guess(guess)
    update_board(guess_indices, guess)
    @guesser.handle_response(guess, guess_indices)
    str = ""
    @board.each do |el|
      if el
        str += el
      else
        str+="_"
      end
    end
    str
  end

  def update_board(indices, guess)
    indices.each {|idx| @board[idx] = guess}
  end

  def won?
    @board.none? {|el| el == nil}
  end

  def play
    won = false
    counter = 0
    setup
    until won
      puts take_turn
      counter+=1
      won = won?
    end
    puts "congratulations you've won! \nThe correct word was #{@board.join}!"
    puts "it took you #{counter} guesses"
  end
end

class HumanPlayer
  attr_accessor :dictionary, :secret_word, :secret_word_length, :guesses
  def initialize(dictionary = [])
    @dictionary = dictionary
    @secret_word = false
    @secret_length = nil
    @guesses = []
  end

  def guess(board)
    guess = false
    until guess
      puts "Your guesses so far are #{@guesses.to_s}"
      puts "Guess a letter"
      guess = gets.chomp
      if @guesses.include?(guess)
        guess = nil
        puts "You've already guessed that one!"
      end
    end
    guess
  end

  def pick_secret_word
    puts "How long is your secret word?"
    @secret_word_length = gets.to_i
  end
  def register_secret_length(input)
    @secret_length = input
  end

  def check_guess(char)
    puts "Where does #{char} appear in your word?"
    str = gets.chomp
    indices = []
    if str.length > 2
      i = 1
      while i < str.length
        indices << str[i].to_i
        i+=2
      end
    end
    indices
  end

  def handle_response(char, array)
    @guesses << char
  end

end

class ComputerPlayer
  attr_accessor :dictionary, :secret_word
  def initialize(dictionary = [])
    @dictionary = dictionary
    @secret_word = false
    @secret_word_length = nil
  end

  def pick_secret_word
    @secret_word = @dictionary[rand(@dictionary.length)]
    @secret_word.length
  end

  def check_guess(char)
    indices = []
    @secret_word.each_char.with_index do |chr, i|
      indices << i if chr == char
    end
    indices
  end

  def register_secret_length(input)
    @secret_word_length = input
  end

  def guess(board)
    counter_hash = Hash.new(0)
    candidate_words.each do |word|
      word.each_char { |chr| counter_hash[chr] += 1 }
    end
    found = false
    until found
      best_guess = counter_hash.sort_by {|k, v| v}.last[0]
        if board.include?(best_guess)
          counter_hash[best_guess] = 0
        else
          found = true
        end
      end
      best_guess
  end

  def handle_response(char, array)
    #this itterates over every word with the right length
    words = []
    candidate_words.each do |word|
      #this checks if the words of the right length work with the guess
      goodword = true
      word.each_char.with_index do |c, i|
        if !word.include?(char)
          goodword = false unless array.empty?
        elsif char == c && !array.include?(i)
          goodword = false
        end
      end
      words << word if goodword
    end
    @dictionary = words
  end

  def candidate_words
    @dictionary = @dictionary.select do |word|
      word.length == @secret_word_length
    end
  end
end
