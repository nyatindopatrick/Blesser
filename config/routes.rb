Rails.application.routes.draw do
  root "pages#index"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions
      resources :blessings do
        resources :comments
        resources :likes
      end
    end
  end
  get "*path", to: "pages#index", via: :all
end
