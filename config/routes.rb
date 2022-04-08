Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"

  get "/articles/showAll", to: "articles#showAll"

  resources :users do
    resources :articles do
      resources :comments
    end
  end
end
