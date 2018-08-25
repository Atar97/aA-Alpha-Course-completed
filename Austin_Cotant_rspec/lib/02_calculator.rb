def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1-num2
end

def sum(arr)
  ans = 0
  arr.each {|el| ans += el}
  ans
end

def multiply(num1, num2)
  num1*num2
end

def power(num1, num2)
  num1**num2
end

def factorial(num)
  if num < 1
    return 0
  end
  answer = 1
  (1..num).each {|el| answer*=el }
  answer
end
