Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
  }

  root 'homepage/home#index'

  namespace :homepage do
    resources :home, only: :index
  end

  namespace :app do
    root 'urls#index'
    resources :urls
  end

  match "404", to: "errors#not_found", via: :all
  match "500", to: "errors#internal_server_error", via: :all
  get '/:short_url', to: 'redirects#redirect'
end