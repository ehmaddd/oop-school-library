# frozen_string_literal: true

# Student class
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hocky
    '¯\(ツ)/¯'
  end
end
