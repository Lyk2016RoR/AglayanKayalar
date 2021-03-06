Rails.application.routes.draw do
	root "books#index"
  devise_for :editors
  devise_for :users

  resources :categories
  resources :wishlists, only: [:index, :create, :destroy]
  resources :okunmuspirincs, only: [:index, :create, :destroy] 
    resources :interpreters
  resources :publishers
  resources :authors do
    resources :acomments, only: [:index, :create, :destroy]
  end

  resources :books do
    resources :bcomments, only: [:index, :create, :destroy]
    collection do
      get :mywishlist
      get :okudugumpirincler
    end
  end
end
