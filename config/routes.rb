Wws::Application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :admin do
    root 'index#index'

    resources :houses do
    	resources :wines, only: :index
    end
    resources :wines

    resources :sales
  end

end
