require_relative 'person'

module StudentClass
  include PersonClass
  class Student < Person
    attr_reader :name

    def initialize(age, classroom, name = 'Unknown', _parent_permission: true)
      design = 'student'
      super(age, design, name)
      @classroom = classroom
    end

    def play_hocky
      '¯\(ツ)/¯'
    end

    def classroom=(classroom)
      @classroom = classroom
      classroom.students.push(self) unless classroom.students.include?(self)
    end
  end
end
