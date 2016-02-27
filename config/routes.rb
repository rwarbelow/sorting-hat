Rails.application.routes.draw do

  root to: 'welcome#show'

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  get "/admin/dashboard", to: "admin/users#dashboard"

  namespace :admin do
    resources :users, only: [:show, :index]
  end

  resources :users, only: [:new, :create, :show] do
    resources :points, only: [:new, :create]
  end
end
