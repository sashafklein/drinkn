Drinkn::Application.routes.draw do

  devise_for :users
  root to: 'landing#show'

  resources :users
  resources :drinks
  resources :ingredients

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :ingredients
      resources :drinks do 
        member do 
          get :drink_ingredients
          post :add
          post :remove
        end
      end
    end
  end
end
