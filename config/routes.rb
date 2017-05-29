Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show] do
    resources :registered_applications, only: [:create, :destroy, :show]
  end
  
  resources :registered_applications, only: [] do
    resources :events, only: [:show]
  end
  
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
  
  
  root 'users#show' 
end
