Rails.application.routes.draw do
  resources :tasks do
    member do
      patch 'complete'
      patch 'uncomplete'
    end 
    collection do 
      patch :sort
    end
  end
  root :to => 'tasks#index'
end
