Resugen::Application.routes.draw do

  root :to =>  "activities#index"
  
  devise_for :users

  resources :addresses

  resources :details

  resources :activities do
    resources :details
  end
  
end
