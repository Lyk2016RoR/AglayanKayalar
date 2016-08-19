Rails.application.routes.draw do
  devise_for :editors
  devise_for :users

  resources :interpreters
  resources :publishers
  resources :authors
  resources :books
end
