Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/', to: 'welcome#home'
end
