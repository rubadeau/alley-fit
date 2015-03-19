Rails.application.routes.draw do

   root 'clients#index'

   resources :clients do
     resources :workouts, except: [:index]
     resources :assessments, except: [:index]
     resources :goals, except: [:index]
   end

end
