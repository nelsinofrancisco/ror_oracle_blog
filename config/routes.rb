Rails.application.routes.draw do
  devise_for :users, 
            controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
            passwords: 'users/passwords'} 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :posts, only: [:create], path: '/users/:user_id/posts/:id'

  resources :users do
    resources :posts
  end

  resources :posts do 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  root to: "users#index"
end
