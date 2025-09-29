Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, param: :uuid, only: [ :index, :create, :show, :destroy ] do
        resources :orgs, only: [ :index ], module: :users
      end
      resources :organizations, param: :uuid, only: [ :index, :create, :show, :destroy ] do
        resources :memberships, only: [ :create ], module: :organizations
        delete 'memberships', to: 'organizations/memberships#destroy', as: :leave_membership
        resources :members, only: [ :index ], module: :organizations
      end
      resources :projects, param: :uuid, only: [ :index, :create, :show, :destroy ]
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
