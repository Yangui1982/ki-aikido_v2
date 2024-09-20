Rails.application.routes.draw do
  devise_for :users
  root to: "actualities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :actualities, except: [:edit, :update]

  resources :events, except: :show

  get "about", to: "pages#about"
  get "info", to: "pages#info"
  get "media", to: "pages#media"
  get "enseignement", to: "pages#enseignement"
  get "bibliographie", to: "pages#bibliographie"
  get "dojos", to: "pages#dojos"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
