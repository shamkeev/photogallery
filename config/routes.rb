Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  root 'photos#index'

  resources :photos
  resources :comments
end
