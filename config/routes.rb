Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: %i[show create update destroy]
      post 'user/register', to: 'users#register'
      post 'user/login', to: 'tokens#login'
      get 'users', to: 'users#index'
      get 'user/:id', to: 'users#show'
      patch 'user/:id', to: 'users#update'
      delete 'user/:id', to: 'users#destroy'
      post 'restaurant/sign_in', to: 'tokens#create'
      post 'restaurant/sign_up', to: 'restaurants#sign_up'
      patch 'restaurant/:id', to: 'userestaurantsrs#update'
    end
  end
end
