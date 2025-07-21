module LmsService
  module Handlers
    class LessonCommandHandler < Sequent::CommandHandler
      on Commands::CreateLessonCommand do |command|
        LessonAggregate.new(command).create
      end

      on Commands::CompleteLessonCommand do |command|
        LessonAggregate.load(command.aggregate_id).complete
      end
    end
  end
end
