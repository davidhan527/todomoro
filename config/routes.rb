Todomoro::Application.routes.draw do

  scope "api" do
    resources :tasks
  end
  
  root to: 'tomatoes#index'

  get "tomatoes/index"

  get 'auth/:provider/callback', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/failure', to: redirect('/')
  
  # auth failure route does not work on development but only in production
end
