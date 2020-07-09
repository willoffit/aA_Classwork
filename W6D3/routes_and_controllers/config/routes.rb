# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                user_index GET    /users(.:format)                                                                         users#index
#                  new_user GET    /users/new(.:format)                                                                     users#new
#               create_user POST   /users(.:format)                                                                         users#create
#                 show_user GET    /users/:id(.:format)                                                                     users#show
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#               update_user PATCH  /users/:id(.:format)                                                                     users#update
#               delete_user DELETE /users/:id(.:format)                                                                     users#delete
#               revamp_user PUT    /users/:id(.:format)                                                                     users#revamp
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representaon GET    /rails/active_storage/representationtion_key/*filename(.:format) active_storage/repr
#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :users
  # get '/users', to: 'users#index', as: 'user_index'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # post '/users', to: 'users#create', as: 'create_user'
  # get '/users/:id', to: 'users#show', as: 'show_user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch '/users/:id', to: 'users#update', as: 'update_user'
  # delete '/users/:id', to: 'users#delete', as: 'delete_user'
  # put '/users/:id', to: 'users#revamp', as: 'revamp_user'

  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :artworks, only: [:index, :create, :show, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
end