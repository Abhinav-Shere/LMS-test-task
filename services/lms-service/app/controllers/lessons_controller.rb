class LessonsController < ApplicationController
  def index
    render json: Lesson.all
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def create
    command = LmsService::Commands::CreateLessonCommand.new(
      aggregate_id: Sequent.new_uuid,
      course_id: params[:course_id],
      title: params[:title],
      content: params[:content]
    )
    Sequent.command_service.execute_commands(command)
    render json: { message: "Lesson created successfully!" }, status: :created
  end

  def complete
    command = LmsService::Commands::CompleteLessonCommand.new(
      aggregate_id: params[:id],
      user_id: params[:user_id]
    )
    Sequent.command_service.execute_commands(command)
    send_event_to_recommendation_service(params[:user_id], params[:id])

    render json: { message: "Lesson marked as completed!" }
  end

  private

  def send_event_to_recommendation_service(user_id, lesson_id)
    lesson = Lesson.find(lesson_id)
    HTTParty.post(
      "http://recommendation-service:3000/events/lesson_completed",
      body: {
        user_id: user_id,
        course_id: lesson.course_id,
        lesson_id: lesson.id
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue => e
    Rails.logger.error "Failed to notify recommendation service: #{e.message}"
  end
end
