Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  get 'users/show/:id' => 'users#show', as: :show_user

  root 'photos#index'

  resources :photos
  resources :comments


end
