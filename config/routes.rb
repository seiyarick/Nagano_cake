Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations", #登録簿
    sessions: 'public/sessions'
  }

  namespace :admin do
   get 'homes/top'
    get 'admin' => 'homes#top'
    post 'homes/top' => 'homes#top'#管理者ログイン時に通るパス
    patch 'ordering_details/:id' => "order_details#update"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :orders, only: [:show, :create]
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    root 'homes#top'
    get 'orders/thanks' => 'orders#thanks'
    #get 'orders/confirm' => "orders#confirm"
    post 'orders/confirm' => "orders#confirm"
    get 'order/:id' => 'orders#show'
    patch '/customers/update_delete' => 'customers#update_delete'
    get 'customers/confirm' => "customers#confirm"
    delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :create]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show, :create]
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
