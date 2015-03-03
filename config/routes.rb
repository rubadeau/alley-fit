Rails.application.routes.draw do

   root 'clients#index'

   resources :clients do
     resources :workouts
     resources :assessments
   end

end
