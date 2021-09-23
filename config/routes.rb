Rails.application.routes.draw do
  resources :friendships
  resources :friend_requests
  resources :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
