Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'performances', to: 'performances#index'
  
  get 'portfolio', to: 'portfolios#show'
  post 'portfolio', to: 'portfolios#create'
  put 'portfolio', to: 'portfolios#update'
end
