Rails.application.routes.draw do
  
  devise_for :users,
  :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  root to: "colonies#index"
  
  get '/statistics', to: 'statistics#index'
  
  resources :colonies do
    resources :cats, except: :index do
      resources :events, except: [:show, :index]
    end
  end
  
  resources :tasks
end