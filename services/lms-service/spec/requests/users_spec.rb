require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "GET /users/:id/stats" do
    context "when lessons exist" do
      let!(:course) { Course.create!(name: "Ruby Basics") }
      let!(:lesson1) { Lesson.create!(course: course, title: "Intro", content: "Start", completed: true) }
      let!(:lesson2) { Lesson.create!(course: course, title: "Advanced", content: "Deep dive", completed: false) }

      it "returns user stats" do
        get "/users/123/stats"

        expect(response).to have_http_status(:ok)
        data = JSON.parse(response.body)
        expect(data["user_id"]).to eq("123")
        expect(data["total_courses"]).to eq(1)
        expect(data["total_lessons"]).to eq(2)
        expect(data["completed_lessons"]).to eq(1)
        expect(data["completion_percentage"]).to eq(50)
      end
    end

    context "when no lessons exist" do
      it "returns 404 with error" do
        get "/users/999/stats"

        expect(response).to have_http_status(:not_found)
        data = JSON.parse(response.body)
        expect(data["error"]).to eq("No lessons found")
      end
    end
  end
end
