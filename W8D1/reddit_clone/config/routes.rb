Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :subs, only: [:edit]
  end
  
  resource :session, only: [:destroy, :create, :new]
  resources :subs, except: [:destroy, :edit]
  
  resources :posts, except: [:index, :destroy]
  


  root "subs#index"
end
