module LmsService
  module Events
    class LessonCompletedEvent < Sequent::Event
      attrs course_id: String
    end
  end
end
