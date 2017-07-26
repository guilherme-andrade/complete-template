Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  mount Spina::Engine => '/'

  resources :features
  resources :products

  root to: 'pages#home'
  mount Attachinary::Engine => "attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
