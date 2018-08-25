# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  return arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  return arr == arr.sort
end

# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  return str.count('AEIOUaeiou')
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  return str.delete('AEIOUaeiou')
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  int = int.to_s
  i = 0
  arr = []
  while i < int.length
    arr.push(int[i])
    i+=1
  end
  return arr.sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
    i = 0
    while i < str.length - 1
      if str[i].downcase == str[i+1].downcase
        return true
      end
      i+=1
    end
    return false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
    i = 0
    number = "("
    while i < arr.length
      number += arr[i].to_s
      if i == 2
        number += ') '
      end
      if i == 5
        number += '-'
      end
      i+=1
    end
    return number
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
    arr = str.split(',')
    arr = arr.sort
    return arr[-1].to_i - arr[0].to_i
end

#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  if offset > arr.length || offset < 0
    offset = offset % arr.length
  end
  return arr.drop(offset) + arr.take(offset)
end
