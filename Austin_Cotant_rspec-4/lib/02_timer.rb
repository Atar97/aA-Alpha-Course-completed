class Timer
  attr_accessor :seconds
  def initialize(s = 0)
    @seconds = s
  end

   def time_string
     sec_str = (seconds % 60).to_s
     min_str = (seconds/60 % 60).to_s
     hour_str = (seconds/3600).to_s
     arr = [sec_str, min_str, hour_str]
     arr.map! do |el|
       if el.length == 1
         el = '0' + el
       elsif el.length == 0
         el = "00"
       else
         el
       end
     end 
     arr[2] + ":" + arr[1] + ":" + arr[0]
   end

 end
