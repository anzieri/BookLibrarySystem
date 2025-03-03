Rails.application.routes.draw do
  resources :borrowers, only: [:index, :show, :new, :create]
  resources :books do
    member do
      post 'borrow'
      patch 'return'
    end
  end
  root 'borrowers#index'
end
