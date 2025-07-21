Rails.application.routes.draw do
  resources :courses, only: [:create, :index, :show] do
    resources :lessons, only: [:create, :index]
  end

  post "/lessons/:id/complete", to: "lessons#complete"
  get "users/:id/stats", to: "users#stats"
end
