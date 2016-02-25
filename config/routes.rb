Rails.application.routes.draw do

  root to: 'welcome#show'

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  namespace :admin do
    resources :users, only: [:show, :index]
  end

  resources :users, only: [:new, :create, :show]



end
