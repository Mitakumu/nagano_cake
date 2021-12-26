Rails.application.routes.draw do
  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :public do
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/complete'
  end
  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    patch 'cart_items/destroy_all'
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end

  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    posswords:     'public/posswords',
    registrations: 'public/registrations'
  }
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    posswords:     'admin/posswords',
    registrations: 'admin/registrations'

  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
