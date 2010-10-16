Planitshareit::Application.routes.draw do
  resources :trips do
    resources :events
  end

  devise_for :users
end
