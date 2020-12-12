# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users
  root 'todoer#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'warning', to: 'todoer#warning'
  post 'tasks', to: 'todoer#create'
  get 'tasks', to: 'todoer#add_task'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
