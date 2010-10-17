Planitshareit::Application.routes.draw do
  resources :trips do
    resources :events
    resources :albums do
      resources :images
    end
  end
  
  match 'trips/:trip_id/driving' => "driving_directions#index", :as => "driving"
  match 'trips/:trip_id/day/:day/driving' => "driving_directions#index", :as => "driving"
  
  root :to => "pages#index"
  
  devise_for :users, :path_names => { :sign_up => "register", :sign_in => 'login' }
end
