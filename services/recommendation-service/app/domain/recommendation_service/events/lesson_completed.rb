module RecommendationService
  module Events
    class LessonCompleted < Sequent::Event
      attrs user_id: String, course_id: String, lesson_id: String
    end
  end
end
