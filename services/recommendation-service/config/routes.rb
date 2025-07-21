Rails.application.routes.draw do
  post '/events/lesson_completed', to: 'events#lesson_completed'
  get  '/users/:id/next-course', to: 'users#next_course'
end
