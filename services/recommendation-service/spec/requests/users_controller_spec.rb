require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "GET /users/:id/next-course" do
    before do
      Course.create!(name: "Ruby Basics")
      Course.create!(name: "Rails Advanced")
    end

    it "recommends the first course if user has no history" do
      get "/users/user_1/next-course"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data["recommended_course"]).to be_present
      expect(data["recommended_course"]["name"]).to eq("Ruby Basics")
    end

    it "recommends a different course if user already completed one" do
      UserProgress.create!(
        user_id: "user_1",
        course_id: Course.first.id,
        lesson_id: "lesson_1",
        completed: true
      )

      get "/users/user_1/next-course"
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data["recommended_course"]["name"]).to eq("Rails Advanced")
    end
  end
end
