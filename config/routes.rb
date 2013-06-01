Wws::Application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'index#index'
  end

end
