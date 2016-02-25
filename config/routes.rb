Rails.application.routes.draw do

  root to: 'welcome#show'

  resources :users, only: [:new, :create, :show]

end
