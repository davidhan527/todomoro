Todomoro::Application.routes.draw do

  scope "api" do
    resources :tasks
  end
  
  root to: 'tomatoes#index'

  get "tomatoes/index"

  get 'auth/:provider/callback', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/failure', to: redirect('/')

  post 'tasks/:id/create', to: 'tasks#pomodorocreate'

  post 'tasks/:id/count', to: 'tasks#pomodorocount'
  
end
