Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # retaurants routs
      post 'restaurant/sign_in', to: 'tokens#sign_in'
      post 'restaurant/sign_up', to: 'restaurants#sign_up'
      patch 'restaurant/:id', to: 'restaurants#update'
      get 'restaurants', to: 'restaurants#index'
      get 'restaurant/:id', to: 'restaurants#show'
      delete 'restaurant/:id', to: 'restaurants#destroy'
      # user routes
      post 'user/register', to: 'users#register'
      post 'user/login', to: 'tokens#login'
      get 'users', to: 'users#index'
      get 'user/:id', to: 'users#show'
      patch 'user/:id', to: 'users#update'
      delete 'user/:id', to: 'users#destroy'
      # group routes
      post 'group', to: 'groups#create'
      patch 'group/:id', to: 'groups#update'
      get 'group/:id', to: 'groups#show'
      get 'groups', to: 'groups#index'

      get 'locations', to: 'locations#index'
    end
  end
end
