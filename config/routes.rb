Rails.application.routes.draw do
  root 'users#index'

  namespace :api do
    namespace :v1 do
      resources :activities, only: :create
    end
  end

  resources :users do
    resources :working_days do
      resources :activities
    end
  end
  resources :sessions, only: %i(create destroy)
end
