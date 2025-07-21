module LmsService
  module Events
    class CourseCreated < Sequent::Event
      attrs name: String
    end
  end
end
