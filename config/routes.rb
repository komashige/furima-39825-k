Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:index, :create]
  end
  resources :users, only: :show

  resources :buys do
    collection do
      post 'payment'
    end
  end

  resources :items do
    member do
      get 'item_buys' # アクションに対するルートを追加
    end
  end
end
