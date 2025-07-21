class EventsController < ApplicationController
  def lesson_completed
    user_id = params[:user_id]
    course_id = params[:course_id]
    lesson_id = params[:lesson_id]

    progress = UserProgress.find_or_initialize_by(user_id: user_id, course_id: course_id, lesson_id: lesson_id)
    progress.completed = true
    progress.save!

    render json: { message: 'Lesson progress recorded' }, status: :ok
  end
end
