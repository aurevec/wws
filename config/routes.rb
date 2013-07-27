Wws::Application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :admin do
    root 'index#index'

    resources :houses do
    	resources :house_wines, only: :index, as: :wines
    end

    resources :sales do
      resources :sale_wines, only: :index, as: :wines
    end

    resources :wines
  end

end
