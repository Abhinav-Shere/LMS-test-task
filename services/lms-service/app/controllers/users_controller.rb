class UsersController < ApplicationController
  def stats
    user_id = params[:id]

    total_lessons = Lesson.count
    return render json: { error: 'No lessons found' }, status: :not_found if total_lessons.zero?
    completed_lessons = Lesson.where(completed: true).count
    completion_percentage = total_lessons.zero? ? 0 : ((completed_lessons * 100) / total_lessons)

    total_courses = Lesson.select(:course_id).distinct.count

    course_progress = Course.all.map do |course|
      { course_id: course.id, completion_percentage: course.completion_percentage(user_id) }
    end

    render json: {
      user_id: user_id,
      total_courses: total_courses,
      total_lessons: total_lessons,
      completed_lessons: completed_lessons,
      completion_percentage: completion_percentage
    }
  end
end
