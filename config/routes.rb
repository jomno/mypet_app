Rails.application.routes.draw do
  resources :solutions, only: [:show]
  # post 'kakao_apis/get_place'
  # post 'kakao_apis/create'
  # post 'kakao_apis/get_solution'
  # post 'kakao_apis/reset'
  root "admin/dashboard#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  draw :api
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
