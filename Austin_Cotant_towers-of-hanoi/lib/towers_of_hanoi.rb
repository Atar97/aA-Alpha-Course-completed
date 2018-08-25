# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

# My class doesn't pass all the specs but it works with all numbers of discs
# I didn't realize making an array of arrays would make my instance variables
# so much easier but this worked okay and I got to use send 

class TowersOfHanoi
  attr_accessor :left, :middle, :right, :size
  def initialize(size = 3)
    @size = size
    @left = (1..size).to_a
    @middle = []
    @right = []
  end

  #this method just makes it easier to choose options for tower selecting
  #when I don't actually have a tower
  OPTIONS = {1 => :left, 2 => :middle, 3 => :right}
  def sender(option)
    send(OPTIONS[option])
  end

  def to_s
    "left: #{@left} | middle: #{@middle} | right :#{right}"
  end

  def render_tower(option)
    tower = sender(option)
    rend = ""
    (0...@size).each_with_index do |el, i|
      if tower[i]
        rend += "|\n" + TowersOfHanoi.make_disc(tower[i]*2) + "\n"
      else
        rend += "|\n"
      end
    end
    rend.chomp("\n")
  end

  def render
    str = ""
    str += "Tower 1:" + "\n" + render_tower(1) + "\n\n"
    str += "Tower 2:" + "\n" + render_tower(2) + "\n\n"
    str += "Tower 3:" + "\n" + render_tower(3) + "\n\n"
  end

  def self.make_disc(int)
      (0...int).reduce("") {|acc, el| acc += '*'}
  end


  def move(from_tower, to_tower)
    if valid_move?(from_tower, to_tower)
      sender(to_tower).unshift(sender(from_tower)[0])
      sender(from_tower).shift
    else
      return false
    end
    true
  end

  def valid_move?(from_tower, to_tower)
    valids = [1,2,3]
    unless valids.include?(from_tower) && valids.include?(to_tower)
      return false
    end
    from = sender(from_tower)
    to = sender(to_tower)
    if from.length == 0
      return false
    elsif to.length == 0
      return true
    elsif to[0] < from[0]
      return false
    end
    true
  end

  def won?
    [2,3].any? {|el| (1..size).to_a == sender(el)}
  end

  def self.play
    puts "Welcome to Towers of Hanoi \n You win by moving all the discs from the center tower to another"
    puts "Please enter the number of DISCS you wish to use"
    tower = TowersOfHanoi.new(gets.to_i)
    until tower.won?
      puts tower.render
      puts "Enter the tower you would like to move a disc FROM"
      from = gets.to_i
      puts "Enter the tower you would like to move a disc TO"
      to = gets.to_i
      if tower.move(from, to)
        tower.move(from, to)
      else
        puts "Not a valid move: Discs can only be moved onto Larger Discs"
      end
    end
    puts tower.render
    puts "Congratulations you've won!!!!!!!!"
  end

end
