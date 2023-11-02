Rails.application.routes.draw do
  root "home#index"
  resources :posts do
    member do
      get :download
    end
  end
end
