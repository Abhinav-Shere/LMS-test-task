module LmsService
  module Aggregates
    class LessonAggregate < Sequent::AggregateRoot
      def initialize(command)
        super(command.aggregate_id)
        apply Events::LessonCreatedEvent, name: command.name, course_id: command.course_id
      end

      on Events::LessonCreatedEvent do |event|
        @name = event.name
        @course_id = event.course_id
        @created_at = Time.now
        @updated_at = Time.now
      end
    end
  end
end
