Rails.application.routes.draw do

  # resources :tools

  namespace :admin do
    resources :tools
  end
  resources :tools, only: [:show, :index]

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'welcome#index'
end
