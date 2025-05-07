Rails.application.routes.draw do
  # get "home/index"
  # namespace :admin do
  #   get "users/index"
  # end
  # resources :daily_sales
  # resources :products
  # resources :categories
  # devise_for :users

  devise_for :users
  root 'home#index'

  resources :categories
  resources :products
  resources :daily_sales

  namespace :admin do
    resources :users, only: [:index] do
      member do
        patch :update_role
      end
    end
  end

  get 'admin/dashboard', to: 'dashboards#admin', as: 'admin_dashboard'
  get 'seller/dashboard', to: 'dashboards#seller', as: 'seller_dashboard'
  post 'admin/users/invite', to: 'admin/users#invite', as: 'invite_admin_users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
