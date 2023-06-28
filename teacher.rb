module TeacherClass
  include PersonClass
  class Teacher < Person
    def initialize(age, specialization, name = 'Unknown', _parent_permission: true)
      design = 'teacher'
      super(age, design, name)
      @specialization = specialization
    end

    def can_use_services?
      true
    end
  end
end
