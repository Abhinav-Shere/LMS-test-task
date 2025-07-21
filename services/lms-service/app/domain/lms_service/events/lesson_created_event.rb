module LmsService
  module Events
    class LessonCreatedEvent < Sequent::Core::Event
      attrs name: String,
            description: String,
            course_id: String
    end
  end
end
