Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events, only: %i[new index show create edit destroy delete]

  resources :users, only: %i[new create show]
  resources :attendances, only: %i[create destroy]
  resources :events do
    member do
      post 'attend', to: 'attendances#create'
      delete 'unattend', to: 'attendances#destroy'
    end
  end
  root to: 'events#index'
end
