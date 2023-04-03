Rails.application.routes.draw do
  authenticate :user do
    mount Motor::Admin => '/admin'
  end
  resources :projects
  resources :chapters, except: :show do
    get ':slug', to: 'chapters#show', as: :find_by_slug, on: :collection
  end

  resources :countries
  devise_for :users, controllers: {
    registrations: 'users/registrations', # Override devise registration controller
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'landing#index'

  get 'about', to: 'landing#about', as: :landing_about
end
