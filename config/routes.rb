Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies do
    collection do
      get :top
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :stars, only: [:index, :show, :new, :create]
    resources :directors, only: [:index, :show, :new, :create]
  end
  resources :forums, only: [:index, :show, :new, :create] do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  get '/contact', to: "pages#contact"
end
