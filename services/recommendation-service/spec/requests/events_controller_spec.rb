  require 'rails_helper'

  RSpec.describe "Events API", type: :request do
    describe "POST /events/lesson_completed" do
      it "creates a new UserProgress record" do
        post "/events/lesson_completed", params: {
          user_id: "user_1",
          course_id: "course_1",
          lesson_id: "lesson_1"
        }

        expect(response).to have_http_status(:ok)
        data = JSON.parse(response.body)
        expect(data["message"]).to eq("Lesson progress recorded")


        # Ensure the event is stored
        progress = UserProgress.last
        expect(progress.user_id).to eq("user_1")
        expect(progress.course_id).to eq("course_1")
        expect(progress.lesson_id).to eq("lesson_1")
        expect(progress.completed).to be true
      end
    end
  end
