Rails.application.routes.draw do
  default_url_options :host => "http://localhost:3000/"


  namespace :api, defaults: { format: :json } do
    
    get '/upload', to: 's3_uploads#set_s3_direct_post'

    resources :testimonies, except: [:update]
    resources :follows, except: [:update, :index]
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
    resources :admins, only: [:index]

    resources :posts do
      resources :post_comments, only: [:create]
      resources :post_tags, only: [:create]
    end

    resources :gardens  do
      resources :garden_comments, only: [:create]
      resources :garden_tags, only: [:create]
      resources :events, only: [:create]
    end

    resources :users do 
      resources :gardens, only: [:create]
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
