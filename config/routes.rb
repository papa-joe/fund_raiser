Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: %i[show create update destroy]
      resources :tokens, only: [:create]
      resources :days, only: %i[show index create update]
      resources :locations, only: %i[show index create]
    end
  end
end
