Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :users
  post 'images/compress', to: 'images#compress'
  get 'images/:id/download', to: 'images#download'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
