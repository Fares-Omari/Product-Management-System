Rails.application.routes.draw do
  resources :products
  devise_for :users
  root "main#home"
  get "main/home"


end
