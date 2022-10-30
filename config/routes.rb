Rottenpotatoes::Application.routes.draw do

  get 'pages/home'
  resources :movies
  # # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  
end
