Planitshareit::Application.routes.draw do
  resources :trips do
    resources :events
  end
  
  root :to => "pages#index"
  
  devise_for :users, :path_names => { :sign_up => "register", :sign_in => 'login' }
end
