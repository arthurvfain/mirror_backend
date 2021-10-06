Rails.application.routes.draw do
  resources :reflections, only: [:show]
  resources :friendships, only: [:index, :show, :create]
  resources :friend_requests, only: [:show, :create, :destroy]
  resources :users, only: [:index, :show, :create, :destroy]
  resources :sessions, only: [:create]
  post '/reflect/:user/:mirror', to: 'reflections#create'
  get '/reflection_gen', to: 'reflections#generate'
  delete '/sessions', to: 'sessions#destroy'
  get '/me', to: 'sessions#me'
  delete '/cancel_request/:requester/:requestee', to: 'friend_requests#cancel_request'
  delete '/unfriend/:user/:friend', to: 'friendships#destroy'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
