Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: %i[show create update destroy]
      resources :tokens, only: [:create]
    end
  end
end
