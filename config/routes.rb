Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  post 'users/:user_id/posts', to: 'posts#create', as: :user_create_post
end
