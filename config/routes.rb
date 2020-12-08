Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000/"


  namespace :api, defaults: { format: :json } do
    
    resources :testimonies, only: [:index, :show]
    resources :follows
    resources :countries
    resources :locations
    resources :climates
    resources :garden_types
    resources :post_tags
    resources :garden_tags
    resources :tags
    resources :events
    resources :post_comments, only: [:index, :show]
    resources :garden_comments, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :gardens  do
      resources :garden_comments
      resources :garden_tags
      resources :posts do
        resources :tags
        resources :post_comments
      end
    end

    resources :users do 
      resources :gardens do
        resources :tags
        resources :garden_types
        resources :events
        resources :countries
        resources :locations
        resources :climates
        resources :follows
        resources :garden_tags
      end
      resources :posts do
        resources :tags
        resources :post_comments
      end
      resources :testimonies
      resources :follows
    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/register'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
