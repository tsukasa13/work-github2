Rails.application.routes.draw do
  #顧客用
  # URL /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    resources :customers, only: [:show, :edit]
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
