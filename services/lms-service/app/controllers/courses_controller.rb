class CoursesController < ApplicationController
  def show
    course = Course.find_by(id: params[:id])
    if course
      render json: course
    else
      render json: { error: 'Course not found' }, status: :not_found
    end
  end
  def create
    course_id = Sequent.new_uuid
    Sequent.command_service.execute_commands(
      LmsService::Commands::CreateCourseCommand.new(aggregate_id: course_id, name: params[:name])
    )
    render json: { id: course_id, name: params[:name] }, status: :created
  end

  def index
    render json: Course.all
  end
end
