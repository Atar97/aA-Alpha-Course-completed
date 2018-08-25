def translate_word(str ="")
  capital = str[0] == str[0].capitalize
  vowels =  ['A','E','I','O','U','a','e','i','o','u']
  cons = ("a".."z").to_a
  cons += ("A".."Z").to_a
  vowels.each do |el|
    cons.delete(el)
  end
  if vowels.include?(str[0])
    return str + "ay"
  else
    i = 0
    back = ""
    while cons.include?(str[i])
      if str[i].downcase == 'q'  && str[i+1] == 'u'
        back += "qu"
        str = str.chars.drop(back.length).join + back + "ay"
        str.downcase!
        str.capitalize! if capital
        return str
      end
      back += str[i]
      i+=1
    end
    str = str.chars.drop(back.length).join + back + "ay"
    str.downcase!
    str.capitalize! if capital
    return str
  end
  nil
end

def translate(str)
  array = []
  str.split.each {|word| array << translate_word(word)}
  array.join(" ")
end

puts translate("Alisha is my Best Friend")
