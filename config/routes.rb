Rails.application.routes.draw do
  namespace :public do
    # Errorが出たら14-19をここに戻す
  end

 get 'homes/top'
  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:destroy,:update]
    resources :food
    resources :sports
  end



  namespace :public do
    devise_scope :customer do
      post 'customers/guest_sign_in', to: 'sessions#new_guest'
    end
    delete '/customer_sports/all_destroy'
    resources :customer_sports, only: [:new, :create, :destroy]
    delete '/customer_foods/all_destroy'
    resources :customer_foods, only: [:new, :create, :destroy]
    get 'food/index'
    get 'hand', to: 'hand#index'

    resources :posts, only: [:new, :index, :show,:create,:destroy] do
      resources :post_comments, only: [:create,:destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    resource :favorites, only: [:create, :destroy]
    resources :customers do
      collection do
        get 'confirmation'
        patch 'withdrawal'
      end
   end
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

# resources :posts, except: [:index] do

# end

 root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
