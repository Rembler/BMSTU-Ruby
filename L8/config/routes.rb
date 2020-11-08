Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'euclid#index'
  get 'euclid/output'
  get 'euclid/index'
end
