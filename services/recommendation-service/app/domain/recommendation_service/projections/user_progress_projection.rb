module RecommendationService
  module Projections
    class UserProgressProjection < Sequent::Projection
      manages_table :user_progresses
      on Events::LessonCompleted do |event|
        create_record :user_progresses, {
          user_id: event.user_id,
         course_id: event.course_id,
          lesson_id: event.lesson_id,
          completed: true
        }
      end
    end
  end
end
