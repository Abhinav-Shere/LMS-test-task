module LmsService
  module Handlers
    class CourseCommandHandler < Sequent::CommandHandler
      on Commands::CreateCourseCommand do |command|
        repository.add_aggregate Aggregates::CourseAggregate.new(command)
      end
    end
  end
end
