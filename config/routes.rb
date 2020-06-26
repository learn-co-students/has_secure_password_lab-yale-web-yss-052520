Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
