require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == 'admin' && password == 'password'
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get "rooms/show"
  resources :tops
  resources :users, only: %i[new create show edit update destroy]
  resources :gears, only: %i[new index create edit update destroy]
  resources :groups, only: %i[new create index show] do
    resources :informations, only: %i[new create index edit update]
    resources :posts, only: %i[new index create] do
      resources :votes, only: [:create, :destroy]
    end
    member do
      get :set_voting_period
      patch :update_voting_period
    end
  end
  
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  get 'logout' => 'user_sessions#destroy', :as => :logout
  delete 'gears/:id' => 'gears#destroy'
  mount ActionCable.server => '/cable'
  
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
