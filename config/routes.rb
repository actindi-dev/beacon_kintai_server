Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i(index show) do
    resources :working_days
    resources :sessions, only: %i(create destroy)
  end
end
