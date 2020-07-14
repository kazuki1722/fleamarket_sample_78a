Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'
  resources :items, only: [:new, :show, :create] do
    collection do
      get 'signup'
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
   
  resources :mypages, only: :index do
    collection do
      get 'logout'
    end
  end
  scope :mypages do
    resources :cards, only: [:index, :new]
  end
end