Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#show'
  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
end
