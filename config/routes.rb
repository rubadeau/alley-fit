Rails.application.routes.draw do

  root 'welcome#index'

  get 'client-sign-up', to: 'client-registrations#new'
  post 'client-sign-up', to: 'client-registrations#create'
  get 'client-sign-out', to: 'client-authentication#destroy'
  get 'client-sign-in', to: 'client-authentication#new'
  post 'client-sign-in', to: 'client-authentication#create'

  get 'trainer-sign-up', to: 'trainer-registrations#new'
  post 'trainer-sign-up', to: 'trainer-registrations#create'
  get 'trainer-sign-out', to: 'trainer-authentication#destroy'
  get 'trainer-sign-in', to: 'trainer-authentication#new'
  post 'trainer-sign-in', to: 'trainer-authentication#create'

  resources :trainers do
    resources :clients do
      resources :workouts
      resources :assessments, except: [:index]
      resources :goals, except: [:index]
      resources :food_logs, except: [:index]
    end
  end
end
