Rails.application.routes.draw do

  resources :usuarios
  
  root             'home#index'
  get 'ajuda'   => 'estaticas#ajuda'
  get 'sobre'   => 'estaticas#sobre'
  get 'contato' => 'estaticas#contato'
  get 'signup'  => 'users#new'

  get 'login'   => 'sessao#new'
  post 'login'   => 'sessao#create'
  delete 'logout'   => 'sessao#destroy'

end
