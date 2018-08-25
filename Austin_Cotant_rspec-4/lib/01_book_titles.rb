class Book

  def initialize
    @title = ""
  end
  attr_reader :title

  def title=(str)
    little_words = %w(in and the one are to of a an)
    arr = str.split
    arr.map! do |word|
      if little_words.include?(word)
        word
      else
      word.capitalize
      end
    end
    arr[0] = arr[0].capitalize
    @title = arr.join(" ")
  end
end
