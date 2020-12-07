Rails.application.routes.draw do
  resources :testimonies
  resources :follows
  resources :countries
  resources :locations
  resources :climates
  resources :garden_types
  resources :post_tags
  resources :garden_tags
  resources :tags
  resources :events
  resources :post_comments
  resources :garden_comments
  resources :posts
  resources :gardens
  default_url_options :host => "http://localhost:3000/"


  namespace :api, defaults: { format: :json } do
    resources :users
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
