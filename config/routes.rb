Rails.application.routes.draw do
  resources :favorites
  resources :movies
  resources :users
    post '/login', to: 'auth#create'
end
