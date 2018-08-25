class Dictionary

  def initialize
    @entries = {}
  end

  attr_accessor :entries

  def add(hsh)
    if hsh.is_a?(Hash)
      @entries.merge!(hsh)
    else
      @entries[hsh] = nil
    end
  end

  def include?(value)
    @entries.key?(value)
  end

  def find(entry)
    answer = {}
    @entries.each do |k, v|
      if k.include?(entry)
      answer[k] = @entries[k]
      end
    end
    answer
  end
  def keywords
    @entries.keys.sort
  end

  def printable
    output = ""
    @entries = @entries.sort_by {|k, v| k}
    @entries.each do |k, v|
      output += "[#{k}] \"#{v}\"\n"
    end
    output.chomp("\n")
  end
end
dict = Dictionary.new
dict.add("zebra" => "African land animal with stripes")
dict.add("fish" => "aquatic animal")
dict.add("apple" => "fruit")
