Rails.application.routes.draw do

  root 'welcome#index'

  get 'client-sign-up', to: 'client_registrations#new'
  post 'client-sign-up', to: 'client_registrations#create'
  get 'client-sign-out', to: 'client_authentication#destroy'
  get 'client-sign-in', to: 'client_authentication#new'
  post 'client-sign-in', to: 'client_authentication#create'

  # get 'trainer-sign-up', to: 'trainer_registrations#new'
  # post 'trainer-sign-up', to: 'trainer_registrations#create'
  # get 'trainer-sign-out', to: 'trainer_authentication#destroy'
  # get 'trainer-sign-in', to: 'trainer_authentication#new'
  # post 'trainer-sign-in', to: 'trainer_authentication#create'

  resources :trainers do
    resources :clients do
      resources :workouts
      resources :assessments, except: [:index]
      resources :goals, except: [:index]
      resources :food_logs, except: [:index]
    end
  end
end
