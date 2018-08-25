# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  answer = ""
  str.each_char do |chr|
    if chr.downcase != chr
      answer += chr
    end
  end
  return answer
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  leng = str.length
  if leng % 2 == 0
    return str[leng/2 - 1] + str[leng / 2]
  else
    return str[(leng/2).floor]
  end
end

# Return the number of vowels in a string.
# VOWELS = %w(a e i o u)
def num_vowels(str)
  return str.downcase.count('aeiou')
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  answer = 1
  i = 0
  while i < num
    i+=1
    answer *= i
  end
  answer
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  if arr.length == 0
    return ""
  else
    str = ""
    arr.each do |el|
      str += el.to_s + separator
    end
  end
  str.chars.take(str.length - separator.length).join
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  i = 0
  answer = ""
  while i < str.length
    if i % 2 == 0
      answer += str[i].downcase
    else
      answer += str[i].upcase
    end
    i+=1
  end
    return answer
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  array = str.split(" ")
  array.each_with_index do |el, i|
    if el.length > 4
      array[i] = array[i].chars.reverse.join
    end
  end
  return array.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  array = (1..n).to_a
  array.each_with_index do |el, idx|
    if el % 3 == 0 && el % 5 == 0
      array[idx] = "fizzbuzz"
    elsif el % 3 == 0
      array[idx] = "fizz"
    elsif el % 5 == 0
      array[idx] = "buzz"
    end
  end
  array
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  nu = []
  arr.each { |el| nu.unshift(el)}
  nu
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num < 2
    return false
  end
  if num == 2
    return true
  end
  (2..(num**0.5).floor).each do |el|
    if num % el == 0
      return false
    end
  end
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  answer = []
  (1..num).each do |el|
    if num % el == 0
      answer.push(el)
    end
  end
  answer
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  answer = []
  (1..num).each do |el|
    if num % el == 0
        if prime?(el)
          answer.push(el)
        end
    end
  end
  answer
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  # can't have an oddball with fewer than 3 elements
  if arr.length < 2
    return nil
  #checking the edgecase of the first element being the odball
  elsif arr[0] % 2 != arr[1] % 2 && arr[0] % 2 != arr[2] % 2
    return arr[0]
  else
    ob = arr[0]
    arr.each do |el|
      if el % 2 != ob % 2
        return el
      end
    end
  end
  ob
end
