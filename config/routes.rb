Rails.application.routes.draw do
  root to: 'root#index'

   resources :events
   resources :users
   resources :comments do
   	  get :report, on: :collection
   end
 
end
