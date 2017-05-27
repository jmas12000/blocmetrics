Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show] do
    resources :registered_applications, only: [:create, :destroy, :show]
  end
  
  resources :events, only: [:index, :show]
  
  
  root 'users#show' 
end
