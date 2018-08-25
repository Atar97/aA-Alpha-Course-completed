local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require 'towers_of_hanoi.rb'


# tower = TowersOfHanoi.new(3)
# tower.move(2,1)
# tower.move(2,3)
# puts tower.render
# tower.move(1,3)
# puts tower.render







TowersOfHanoi.play
