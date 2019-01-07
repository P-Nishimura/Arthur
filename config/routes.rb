Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "topic#index"
  resources :topic do
    resources :opinion, only: [:create,:destroy,:update]
  end  
  resources :user,only: [:show,:edit,:update]
  
end
