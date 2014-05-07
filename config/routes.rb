Vanilla::Application.routes.draw do

  devise_for :users
  root to: 'landing#show'

  resources :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :drinks, only: [] do
        resources :ingredients
      end
    end
  end
end
