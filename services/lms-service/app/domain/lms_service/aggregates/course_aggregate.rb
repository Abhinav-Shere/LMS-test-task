module LmsService
  module Aggregates
    class CourseAggregate < Sequent::AggregateRoot
      def initialize(command)
        super(command.aggregate_id)
        apply Events::CourseCreated, name: command.name
      end

      on Events::CourseCreated do |event|
        @name = event.name
        @created_at = Time.now
        @updated_at = Time.now
      end
    end
  end
end
