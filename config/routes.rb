Rails.application.routes.draw do
  devise_for :users

  root 'gifs#index'

  resources :gifs do
    collection do
      get :my
    end
  end
end
