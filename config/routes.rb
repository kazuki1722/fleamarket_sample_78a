Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :credit_cards, only: [:new] do
    collection do
      get 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end

  root 'items#index'
  resources :items do
    collection do
      get 'signup'
      get 'search'
      get 'ransack'
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
    member do
      post   '/like/:item_id', to: 'likes#like',   as: 'like'
      delete '/like/:item_id', to: 'likes#unlike', as: 'unlike'
    end
    resources :messages, only:[:create,:update,:destroy] do
      member do
        get 'restore'
      end
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
   
  resources :mypages, only: [:index] do
    collection do
      get 'logout'
      get :likes
    end
  end
  scope :mypages do
    resources :cards, only: [:index]
  end
end