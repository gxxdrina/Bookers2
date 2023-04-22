Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: :about


  resources :books#, only: [:new, :show, :create, :index, :edit, :update]
  resources :users, only: [:show, :index, :edit, :update]
  
end
