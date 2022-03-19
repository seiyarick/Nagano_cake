Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations", #登録簿
    sessions: 'public/sessions'
  }

  namespace :admin do
    get 'orders/show'
    get 'homes/top'
    get 'admin' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    root 'homes#top'
    resources :addresses, only: [:index, :edit]
    resources :orders, only: [:new, :index, :show]
    resources :cart_items, only: [:index]
    resources :customers, only: [:show, :edit]
    resources :items, only: [:index, :show]
  end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/edit'
  # end
  # namespace :admin do
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/show'
  #   get 'items/edit'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :public do
  #   get 'orders/new'
  #   get 'orders/index'
  #   get 'orders/show'
  #   get 'addresses/index'
  #   get 'addresses/edit'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :public do

  # end
  #顧客用

  #管理者用
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
