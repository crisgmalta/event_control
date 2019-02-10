Rails.application.routes.draw do
  root to: 'root#index'

  resources :events
  resources :users
  resources :comments 
  resources :reports do
    get :pdf, on: :collection
  end

end
