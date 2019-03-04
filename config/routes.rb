Rails.application.routes.draw do
  resources :room_plants
  resources :rooms
  resources :users
  resources :plants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :plants, only: [:show, :index] do
        get 'search', on: :collection
      end
      resources :users
      resources :rooms
    end
  end
end
