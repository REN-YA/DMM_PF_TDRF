Rails.application.routes.draw do

  root 'homes#top' #TOPページ

    #ユーザーdevise
    devise_for :users,skip: [:passwords,], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
    }
  namespace :user do
    resources :users, only: [:index, :show, :update, :edit] do
    # 退会確認画面
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    end
    resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :notification, only: [:index]
    resources :favorites, only: [:create, :destroy]
    get 'followings' => 'relationship#followings', as: 'followings'
    get 'followers' => 'relationship#followers', as: 'followers'
    resources :relationship, only: [:create, :destroy]
  end

    #店舗側decvise
    devise_for :stores,skip: [:passwords,], controllers: {
    registrations: "store/registrations",
    sessions: 'store/sessions'
    }
  namespace :store do
    resources :stores, only: [:index, :show, :update, :edit] do
    # 退会確認画面
    get '/stores/unsubscribe' => 'stores#unsubscribe', as: 'unsubscribe'
    # 論理削除用のルーティング
    patch '/stores/withdrawal' => 'stores#withdrawal', as: 'withdrawal'
    end
    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
