Rails.application.routes.draw do
  get 'flights/index'
  
  resources :flights
end
