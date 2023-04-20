Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"


  resources :books, only: [:new, :show, :create, :index, :edit]
  resources :users, only: [:show, :index, :edit, :update]
  
  get 'homes/about', as: :about

end
