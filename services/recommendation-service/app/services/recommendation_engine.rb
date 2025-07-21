require 'faraday'
require 'json'

class RecommendationEngine
  LMS_BASE_URL = 'http://localhost:3001' 
  # <-- LMS service port docker-compose ke hisaab se adjust karo

  def self.recommend(user_id)
    courses = fetch_courses
    completed_courses = UserProgress.where(user_id: user_id, completed: true).pluck(:course_id)

    next_course = courses.find { |c| !completed_courses.include?(c["id"]) }
    next_course ? next_course["name"] : "No new courses"
  end

  def self.fetch_courses
    response = Faraday.get("#{LMS_BASE_URL}/courses")
    JSON.parse(response.body)
  rescue => e
    Rails.logger.error "Failed to fetch courses: #{e.message}"
    []
  end
end
