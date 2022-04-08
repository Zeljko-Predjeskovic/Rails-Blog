Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/articles/showAll", to: "articles#showAll"

  root "homes#home"
 


  resources :users do
    resources :articles do
      resources :comments
    end
  end

  get "/home", to:"homes#home"


  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"


end
