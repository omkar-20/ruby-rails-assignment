Rails.application.routes.draw do
  root "todos#index"

  resources :todos

  post 'login', to: 'sessions#create'
end
