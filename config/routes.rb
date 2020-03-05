Rails.application.routes.draw do
  resources :solutions, only: [:show] do 
    member do
      get :link
    end
  end
  post 'kakao_apis/create'
  root "admin/dashboard#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
