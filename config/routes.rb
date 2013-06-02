Wws::Application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :admin do
    root 'index#index'

    resources :houses
  end

end
