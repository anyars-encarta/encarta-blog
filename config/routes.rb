Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # Set root to home#index for the base URL
  root 'users#index'

  # Individual routes for users, their posts, and specific posts
  # get 'users', to: 'users#index', as: 'users'
  # get 'users/:user_id', to: 'users#show', as: 'user'
  # get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'likes/new'
  post 'likes/create'
  get 'comments/new'
  post 'comments/create'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    resources :comments, only: [:new, :create]
  end

  resources :likes, only: [:new, :create]
end
