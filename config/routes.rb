Rails.application.routes.draw do
 
  get 'homes/top'
  namespace :admin do
    resources :customers , only: [:index,:show,:edit]
  end
  
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirmation'
    get 'customers/withdrawal'
    patch 'customers/update'
    patch'customers/withdrawal',as: 'withdrawal'
  end
  # devise_for :customers
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
