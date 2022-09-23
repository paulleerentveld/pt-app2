Rails.application.routes.draw do
  resources :instructors
  resources :clients
  resources :workouts
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
