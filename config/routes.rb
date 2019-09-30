Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
  }

  constraints user_root: 'user' do
    authenticated :user do
      root 'app/urls#index', as: :authenticated_user_root
    end
  end

  root 'homepage/home#index'

  namespace :homepage do
    resources :home, only: :index
  end

  namespace :app do
    'app/urls#index'
    resources :urls
  end

  match "404", to: "errors#not_found", via: :all
  match "500", to: "errors#internal_server_error", via: :all
  get '/:short_url', to: 'redirects#redirect'
end