# Options Hashes
#
# Write a method `transmogrify` that takes a `String`. This method should
# take optional parameters `:times`, `:upcase`, and `:reverse`. Hard-code
# reasonable defaults in a `defaults` hash defined in the `transmogrify`
# method. Use `Hash#merge` to combine the defaults with any optional
# parameters passed by the user. Do not modify the incoming options
# hash. For example:
#
# ```ruby
# transmogrify("Hello")                                    #=> "Hello"
# transmogrify("Hello", :times => 3)                       #=> "HelloHelloHello"
# transmogrify("Hello", :upcase => true)                   #=> "HELLO"
# transmogrify("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
#
# options = {}
# transmogrify("hello", options)
# # options shouldn't change.
# ```

def transmogrify(string, options = {})
  defaults = {times: false, :upcase => false, :reverse => false}
  defaults = defaults.merge(options)
  temp = string
  str = string
  if defaults[:upcase]
    str = string.upcase
    string = string.upcase
  end
  if defaults[:reverse]
    str = string.reverse
    string = string.reverse
  end
  (defaults[:times] - 1).times {str += string} if defaults[:times]
  string = temp
  str
end
