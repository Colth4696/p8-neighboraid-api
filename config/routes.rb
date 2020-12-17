Rails.application.routes.draw do

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/create/:id', to: 'chats#create', :as => :create
  resources :users, only: [:create, :show, :index]
  resources :tasks
  resources :chats
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
