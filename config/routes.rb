Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  namespace :api do
    resources :user, only: [:index, :show] do
      resources :post, only: [:index] do
      resources :comment, only: [:index, :create]
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end



  post 'users/:user_id/posts', to: 'posts#create', as: :user_create_post
end
