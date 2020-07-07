Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items, only: [:index, :new]
  resources :users, only: :index do
    collection do
      get 'logout'
      get 'card'
    end
  end
  resources :credit_cards, only: :new
end

