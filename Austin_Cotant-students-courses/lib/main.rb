local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require "student.rb"
require "course.rb"

stu1 = Student.new('Johnny', 'Rocket')
stu2 = Student.new('Alisha', 'Holmes')
art = Course.new('Art')
biology = Course.new('Biology')


stu1.enroll(art)
stu2.enroll(art)
stu1.enroll(biology)
stu1.enroll(biology)
puts '******** THIS IS THE NEXT LINE *********'
puts stu1
puts stu1.courses
