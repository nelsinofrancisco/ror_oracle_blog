Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users/:user_id/posts/:id", to: "posts#show", as: 'users_posts'
  get "/users/:user_id/posts", to: "posts#index", as: 'user_post'
  get "/users/:id", to: "users#show", as: 'users'
  get "/users", to: "users#index", as: 'user'
  root to: "users#index"
end
