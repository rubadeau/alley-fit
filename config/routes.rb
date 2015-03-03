Rails.application.routes.draw do

   root 'clients#index'

   resources :clients
   resources :workouts
   resources :assessments

end
