# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  ans = Hash.new
  str.split.each do |word|
    ans[word] = word.length
  end
  ans
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  bigv = hash.values.max
  bigk = nil
  hash.each do |key, value|
    if value == bigv
      bigk = key
    end
  end
  bigk
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k, v|
    older[k] = v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  answer = Hash.new(0)
  word.each_char { |chr| answer[chr] += 1  }
  answer
end

class Hash
  #takes a value and returns an array of keys that have that value
  def keys_for_value(value)
    answer = []
    self.each do |k, v|
      if v == value
        answer << k
      end
    end
    answer
  end
end
# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  answer = Hash.new
  arr.each_with_index do |el, i|
    answer[el] = 1
  end
  answer.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  answer = {even:0, odd:0}
  numbers.each do |el|
    if el % 2 == 0
      answer[:even] += 1
    else
      answer[:odd] += 1
    end
  end
  answer
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  hsh = {a:0,e:0,i:0,o:0,u:0}
  string.each_char do |c|
    hsh.each do |k, v|
      if k.to_s == c
        hsh[k] += 1
      end
    end
  end
  hsh.keys_for_value(hsh.values.max).sort.first.to_s
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  correct_stu = []
  students.each {|k,v| correct_stu << k if v > 6}
  correct_stu.combination(2)
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  number_of_species = specimens.uniq.length
  hsh = Hash.new(0)
  specimens.each do |el|
    hsh[el] += 1
  end
  smallest_population_size = hsh.values.min
  largest_population_size = hsh.values.max
  number_of_species**2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  norm_count = character_count(normal_sign)
  vandal_count = character_count(vandalized_sign)
  norm_count.each do |k, v|
    return false if v < vandal_count[k]
  end
  true 
end

def character_count(str)
  hsh = Hash.new(0)
  str.downcase.each_char do |c|
    hsh [c] += 1
  end
  hsh
end
