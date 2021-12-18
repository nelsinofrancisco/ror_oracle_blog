Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :comments, only: [:create], path: '/users/:id/posts'

  resources :posts, only: [:create], path: '/users/:user_id/posts/:id'

  resources :users, only: [:index, :show] do
    resources :posts
  end

  resources :users, only: [:create, :new], path: '/users/:id'
  root to: "users#index"
end
