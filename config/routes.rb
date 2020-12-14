Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000/"


  namespace :api, defaults: { format: :json } do
    
    get '/upload', to: 's3_uploads#set_s3_direct_post'

    resources :testimonies
    resources :follows
    resources :countries
    resources :locations
    resources :climates
    resources :garden_types
    resources :post_tags
    resources :post_comments
    resources :garden_tags
    resources :tags
    resources :events
    resources :garden_comments
    resources :queries, only: [:index]
    resources :post_likes, except: [:update]
    resources :garden_likes, except: [:update]
    get '/upload', to: 's3_uploads#set_s3_direct_post'

    resources :posts do
      resources :post_comments
      resources :tags
      resources :post_tags
    end

    resources :gardens  do
      resources :garden_comments
      resources :garden_tags
      resources :events
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
