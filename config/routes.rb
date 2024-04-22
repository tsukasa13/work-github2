Rails.application.routes.draw do
  #顧客用
  # URL /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw', as: 'confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  end

  #管理者用
  # URL /admin/sign_in...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
  end
end
