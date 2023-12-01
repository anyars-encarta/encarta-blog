# routes.rb
Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  # get 'login', to: 'users#login', as: 'login'

  # get 'likes/new'
  # post 'likes/create'
  # get 'comments/new'
  # post 'comments/create'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end