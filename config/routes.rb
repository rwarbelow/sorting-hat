Rails.application.routes.draw do

  root to: 'welcome#show'

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/admin/dashboard", to: "admin/users#dashboard"

  namespace :admin do
    resources :users, only: [:show, :index] do 
      resources :points, only: [:new, :create, :destroy]
    end
  end

  resources :rewards

  resources :users, only: [:new, :create, :show] do
    get "/rewards", to: "user/rewards#index"
    post "/rewards", to: "user/rewards#create"
  end
end
