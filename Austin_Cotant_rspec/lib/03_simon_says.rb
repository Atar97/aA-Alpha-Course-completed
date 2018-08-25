def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(str, num =2)
  answer = str
  (0...num-1).each {answer+=" "+str}
  answer
end

def start_of_word(str, num = 1)
  str.chars.take(num).join
end

def first_word(str)
  return str.split[0]
end

def titleize(str)
  answer = str.split
  little_words = ['the', 'over', 'and', 'it', 'but']
  answer.each_with_index do |word, i|
    if i == 0
      answer[i] = word.capitalize
    elsif !(little_words.include?(word))
      answer[i] = word.capitalize
    end
  end
  return answer.join(" ")
end
