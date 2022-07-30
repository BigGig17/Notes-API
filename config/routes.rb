Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations],
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  get '/member-data', to: 'members#show'
  
  resources :users
  namespace :api do
    namespace :v1 do
      resources :notes
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
