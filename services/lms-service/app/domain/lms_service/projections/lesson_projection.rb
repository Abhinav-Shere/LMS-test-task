module LmsService
  module Projections
    class LessonRecord < Sequent::ApplicationRecord
      self.table_name = 'lessons'
    end

    class LessonProjection < Sequent::Core::Projector
      on Events::LessonCreatedEvent do |event|
        create_record(
          LessonRecord,
          aggregate_id: event.aggregate_id,
          name: event.name,
          description: event.description,
          course_id: event.course_id
        )
      end
    end
  end
end
