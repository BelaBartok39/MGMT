require 'sidekiq/web'

Rails.application.routes.draw do
  get 'templates/index'
  draw :madmin
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
    resources :impersonates do
      post :impersonate, on: :member
      post :stop_impersonating, on: :collection
    end
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'

  resources :staff_dates do
    resources :employees, except: [:index, :show] do
      post :import_temp, on: :member
    end
      post "send_email", on: :member
  end

  resources :templates, except: [:show] do
    resources :employees
  end
end
