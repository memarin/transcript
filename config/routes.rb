Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :courses
  resources :subjects
  resources :users
end
