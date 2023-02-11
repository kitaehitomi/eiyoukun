Rails.application.routes.draw do
 
  
  namespace :public do
    resources :customer_sports, only: [:new, :create, :destroy]
    delete '/customer_sports/all_destroy'
  end
  namespace :public do
    resources :customer_foods, only: [:new, :create, :destroy]
    delete '/customer_foods/all_destroy'
  end
  namespace :public do
    get 'food/index'
  end
  namespace :public do
    get 'hand/index'
  end
 get 'homes/top'
  namespace :admin do
    resources :customers , only: [:index,:show,:edit]
    resources :food 
    resources :sports
  end

  namespace :public do
    resources :post_images, only: [:new, :index, :show,:create] do
      resources :post_comments, only: [:create]
    end
    resource :favorites, only: [:create, :destroy]
    resources :customers
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

resources :posts, except: [:index] do
  resource :bookmarks, only: [:create, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
