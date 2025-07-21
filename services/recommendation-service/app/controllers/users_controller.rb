class UsersController < ApplicationController
  def next_course
    user_id = params[:id]
    recommended = RecommendationEngine.recommend(user_id)
    render json: { user_id: user_id, recommended_course: recommended }
  end
end
