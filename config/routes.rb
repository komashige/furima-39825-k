Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:index, :create]
  end

  resources :buys do
    collection do
      post 'payment'
    end
  end
end
