module LmsService
  module Commands
    class CreateCourseCommand < Sequent::Command
      attrs name: String
    end
  end
end
