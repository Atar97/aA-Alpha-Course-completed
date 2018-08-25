class Friend
  def initialize(name ="")
    @name = name
  end
  attr_accessor :name

  def greeting(name = "")
    if name == ""
      return "Hello!"
    else
      return "Hello, #{name}!"
    end
  end

end
