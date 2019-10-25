Rails.application.routes.draw do
  root 'flights#index'
  
  devise_for :users

  resources :flights do
  	collection do
  		post :confirm
  	end
  end
  resources :users
end
