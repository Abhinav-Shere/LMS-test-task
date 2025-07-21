module LmsService
  module Projections
    class CoursesProjection < Sequent::Projector
      def initialize
        super
        @courses = []
      end
  
      def apply_course_created(event)
        @courses << event.name
      end
    end
  end
end
