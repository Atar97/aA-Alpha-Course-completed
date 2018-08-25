class Student
  # I know my code is working because it works for all my tests but I can't
  # figure out why it keeps throwing the exception below in the spec first_name
  # is definded by by the attr_accessor and works when I use enroll in pry
  # 3) Student#enroll ignores attempts to re-enroll into a course
  #    Failure/Error: student.enroll(new_course)
  #    NoMethodError:
  #      undefined method `first_name' for #<RSpec::Mocks::TestDoubleProxy:0x007fcc580846f8>
  #    # ./lib/student.rb:32:in `=='
  #    # ./lib/student.rb:20:in `include?'
  #    # ./lib/student.rb:20:in `enroll'
  #    # ./spec/student_spec.rb:36:in `block (3 levels) in <top (required)>'
  attr_accessor :first_name, :last_name, :courses

  def initialize(first = nil, last = nil)
    @last_name = last
    @first_name = first
    @courses = []
  end

  def to_s
    self.name
  end

  def name
    @first_name + " " + @last_name
  end

  def enroll(course)
    conflict = @courses.any? do |c|
      c.conflicts_with?(course)
    end
    raise "Course conflicts with another course student is enrolled in" if conflict
    @courses << course unless @courses.include?(course)
    course.students << self unless course.students.include?(self)
  end

  def course_load
    c_load = Hash.new(0)
    @courses.each do |cors|
      c_load[cors.department] += cors.credits
    end
    c_load
  end

  def ==(other_student)
  @first_name == other_student.first_name && @last_name == other_student.last_name
  end



end
