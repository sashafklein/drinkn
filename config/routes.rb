Vanilla::Application.routes.draw do

  devise_for :users
  root to: 'landing#show'

  namespace :api, defaults: {format: :json} do
  end
end
