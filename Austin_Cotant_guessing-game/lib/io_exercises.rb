# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game(size = 100)
  puts "Guess a number between 1 and #{size}"
  number = (1..size).to_a.shuffle.first
  guess = gets.to_i
  guessed = false
  guess_count = 1
  until guessed
    if guess > number
      puts guess
      puts "Your guess was too high, try again"
      guess = gets.to_i
    elsif guess < number
      puts guess
      puts "Your guess was too low, try again"
      guess = gets.to_i
    end
    guessed = guess == number
    guess_count += 1
  end
  puts "You got the Number!"
  puts number
  puts "You only used this many guesses"
  puts guess_count
end

def file_shuffler
  puts "Enter a filename"
  file_name = gets.chomp
  line_array = File.readlines(file_name)
  line_array.shuffle!
  File.open("#{file_name}-shuffled.txt", 'w') do |f|
    line_array.each {|line| f.print line}
  end
end
