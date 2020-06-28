Rails.application.routes.draw do
  get '/new', to: "users#new"
  post '/login', to: "sessions#create"
  post '/create', to: "users#create"
  get '/welcome/:id', to: "users#welcome"
  get '/login', to: "sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
