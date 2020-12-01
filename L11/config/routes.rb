Rails.application.routes.draw do
  root 'euclid#index'
  get 'euclid/index'
  get 'euclid/output'
  get 'euclid/cached'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
