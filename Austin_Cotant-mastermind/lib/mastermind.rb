class Code
  PEGS = {r:'Red',
g:'Green',
b:'Blue',
y:'Yellow',
o:'Orange',
p:'Purple'}

  attr_reader :pegs
  def initialize(pegs)
    @pegs = pegs
    if pegs.is_a? String
    @pegs = pegs.chars
    end
  end

  def to_s
    @pegs
  end

  def self.parse(str)
    str = str.downcase
    if str.chars.all? {|chr| PEGS.keys.include?(chr.to_sym)}
      Code.new(str)
    else
      raise "String can't be parsed into a code"
    end
  end

  def self.random
    # this only makes codes with no duplicates
    # Code.parse(PEGS.keys.shuffle[0..3].join)
    str = ""
    4.times {str += PEGS.keys.shuffle[0].to_s}
    Code.parse(str)
  end

  def [](arg)
    pegs[arg]
  end

  #count.with_index didn't work for some reason
  def exact_matches(code)
    i = 0
    @pegs.count do |el|
      value = el == code.pegs[i]
      i +=1
      value
    end
  end

  def ==(code)
    if code.is_a? Code
      return @pegs == code.pegs
    end
    false
  end

  def near_matches(code)
    pegs1 = @pegs.uniq
    pegs2 = code.pegs.uniq
    matches = pegs1.count {|el| pegs2.include?(el) }
    matches = matches - exact_matches(code)
    if matches > 0
      return matches
    else
      return 0
    end
  end

end


class Game
  attr_reader :secret_code

  def initialize(code = Code.random)
    @secret_code = code
  end

  def get_guess
    puts "Enter your guess pittiful Human"
    guess = gets.chomp

    Code.parse(guess)
  end

  def display_matches(code)
    near = @secret_code.near_matches(code)
    exact = @secret_code.exact_matches(code)
    puts "You have #{near} near matches"
    puts "You have #{exact} exact matches"
  end

  def play
    guess = nil
    guess_count = 0
    until guess == @secret_code || guess_count == 9
      guess = get_guess
      guess_count += 1
      puts display_matches(guess)
    end
    if guess == @secret_code
      puts "Your guess of #{guess.to_s} was correct. It only took you #{guess_count} tries"
    else
      puts "You are out of guesses. #{@secrect_code.to_s} was the secret Code. Better luck next time."
    end
  end

end
