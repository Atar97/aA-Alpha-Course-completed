# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.
require 'byebug'

LITTLE_WORDS = [
  'a',
  'of',
  "and",
  "the",
  "over"
]

def titleize(title)
  words = title.split(" ")
  titleized_words = []
  # byebug
  words.each_with_index do |word, i|
    if LITTLE_WORDS.include?(word) && i != 0
        titleized_words[i] = word.downcase
    else
      titleized_words[i] = word.capitalize
    end
  end

  titleized_words.join(" ")
end


# Write a method that returns the largest prime factor of a given integer.

def prime?(num)
  (2..num -1).none? { |factor| num % factor == 0 }
end

def largest_prime_factor(num)
  if num < 2
    return nil
  end
  num.downto(2) do |factor|
    if (num % factor).zero?
        return factor if prime?(factor)
    end
  end
end


# Write a symmetric_substrings method that takes a string and returns an array
# of substrings that are palindromes, e.g. symmetric_substrings("cool") => ["oo"]
# Only include substrings of length > 1.

def symmetric_substrings(str)
  symm_subs = []

  str.length.times do |start_pos|
    (2..(str.length - start_pos)).each do |len|
      substr = str[start_pos...(start_pos + len)]
      symm_subs << substr if substr == substr.reverse
    end
  end

  symm_subs
end


# Write a method that returns `true` if all characters in the string
# are unique and `false` if they are not.

def all_unique_chars?(str)
  letters = str.split('').reject{ |char| char == '  '}
  letters.uniq.length = letters.length
end
