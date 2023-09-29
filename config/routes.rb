Rails.application.routes.draw do
  resources :furimas, only: :index
  root to: "furimas#index"
end
