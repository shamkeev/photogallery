Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  get 'users/:id' => 'users#show', as: :show_user

  root 'photos#index'

  resources :photos, :shallow => true do
    resources :comments
  end

end
