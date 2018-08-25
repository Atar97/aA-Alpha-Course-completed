require 'byebug'
class Fixnum
  numwords = %w(zero one two three four five six seven eight nine ten eleven
    twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  doubledigits = {20 => 'twenty', 30 => 'thirty', 40 => 'forty', 50 => 'fifty',
  60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'}
  temp = {}
  numwords.each_with_index do |el, i|
    temp[i] = el
  end
  NUMBERSIZE = {0 => '', 1 => "thousand", 2 => "million",
    3 => "billion", 4 => "trillion"}
  FINAL = temp.merge(doubledigits)

  def in_words
    str_self = self.to_s
    length = str_self.length
    counter = length
    itterations = 0
    answer = ""
    while counter > 1
      temp = str_self[(counter - 2)..counter].to_i
      answer += temp.up_to_1000_word + NUMBERSIZE[itterations]
      itterations += 1
      counter -= 3
    end
    answer
  end

  def under_100_word
    raise 'Get a smaller number' if self.to_s.length > 2
    if (0..19).include?(self)
      return FINAL[self]
    elsif (20..99).include?(self)
      if self % 10 == 0
        return FINAL[self]
      else
        return FINAL[self.digit(2)*10] + " " + FINAL[self.digit(1)]
      end
    end
  end

  def size?
    NUMBERSIZE.keys.select {|el| self >= el}
  end

  def digit(num)
    if num > self.to_s.length
      return nil
    end
    self.to_s[num * -1].to_i
  end

  def up_to_1000_word
    raise 'Get a smaller number' if self.to_s.length > 3
    if self == 0
      return 'zero'
    end
    word = ""
    if self.digit(3)
      word = self.digit(3).under_100_word + " hundred "
    end
    return word.chomp(' ') if self % 100 == 0
    word + (self % 100).under_100_word
  end



end
