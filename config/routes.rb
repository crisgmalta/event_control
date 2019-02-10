Rails.application.routes.draw do
	
  resources :events
  resources :users
  resources :comments 
  resources :reports do
    get :pdf, on: :collection
  end

end
