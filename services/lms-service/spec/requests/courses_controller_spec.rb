require 'rails_helper'

RSpec.describe "Courses API", type: :request do

  describe "GET /courses" do
    it "returns all courses" do
      Course.create!(name: "Ruby")
      get "/courses"
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data.size).to eq(1)
      expect(data[0]["name"]).to eq("Ruby")
    end
  end
  
  describe "GET /courses/:id" do
    it "returns the course if it exists" do
      course = Course.create!(name: "Rails")
      get "/courses/#{course.id}"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data["name"]).to eq("Rails")
    end

    it "returns 404 if course does not exist" do
      get "/courses/invalid-id"
      expect(response).to have_http_status(:not_found)
      data = JSON.parse(response.body)
      expect(data["error"]).to eq("Course not found")
    end
  end

  describe "POST /courses" do
    it "creates a new course" do
      post "/courses", params: { name: "JavaScript" }
      expect(response).to have_http_status(:created)
      data = JSON.parse(response.body)
      expect(data["name"]).to eq("JavaScript")
    end
  end
end
