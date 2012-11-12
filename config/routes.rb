Resugen::Application.routes.draw do
  
  devise_for :users

  resources :activities

  resources :addresses

  resources :details

  resources :activities do
    resources :details
  end
  
end
