Rails.application.routes.draw do
  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations", #登録簿
    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
