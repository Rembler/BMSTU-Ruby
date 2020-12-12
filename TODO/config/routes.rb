# frozen_string_literal: true

Rails.application.routes.draw do
  get 'colleagues', to: 'colleagues#index'
  resources :sessions, only: %i[new create destroy]
  resources :users
  root 'todoer#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'warning', to: 'todoer#warning'
  post 'tasks', to: 'todoer#create'
  patch 'tasks', to: 'todoer#update'
  get 'tasks', to: 'todoer#add_task'
  get 'del', to: 'todoer#destroy'
  get 'move', to: 'todoer#move_to'
  get 'trash', to: 'todoer#to_trash'
  get 'trash_can', to: 'todoer#trash_can'
  get 'del', to: 'todoer#destroy'
  post 'del_all', to: 'todoer#clear_trash'
  get 'edit', to: 'todoer#edit'
  patch 'update', to: 'todoer#update'
  get 'update', to: 'todoer#edit'
  get 'colleague', to: 'colleagues#colleague'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
