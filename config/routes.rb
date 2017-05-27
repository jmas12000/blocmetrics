Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show] do
    resources :registered_applications, only: [:create, :destroy, :show]
  end
  
  root 'users#show' 
end
