Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  get '/', to: 'users#index', as: :users
  get 'users/:id', to: 'users#show', as: :user_show
  get 'users/:id/posts', to: 'posts#index', as: :user_posts
  get 'users/:id/posts/:post_id', to: 'posts#show', as: :user_post_show
end
