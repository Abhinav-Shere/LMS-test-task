require 'rails_helper'

RSpec.describe "Lessons API", type: :request do
  let!(:course) { Course.create!(name: "Ruby") }
  let!(:lesson) { Lesson.create!(course: course, title: "Intro to Ruby", content: "Basics") }

  describe "POST /lessons/:id/complete" do
    it "marks a lesson as completed" do
      post "/lessons/#{lesson.id}/complete"
      expect(response).to have_http_status(:ok)

      lesson.reload
      expect(lesson.completed).to be true
    end

    it "returns 404 if lesson not found" do
      post "/lessons/invalid-id/complete"
      expect(response).to have_http_status(:not_found)
    end
  end
end
