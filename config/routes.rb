Rails.application.routes.draw do

  root to: 'welcome#show'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users, only: [:new, :create, :show]
end
