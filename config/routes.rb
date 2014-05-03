Vanilla::Application.routes.draw do

  devise_for :users
  root to: 'landing#show'
end
