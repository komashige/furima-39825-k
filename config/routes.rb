Rails.application.routes.draw do
  devise_for :users
  resources :furimas, only: :index
  root to: "furimas#index"
end
