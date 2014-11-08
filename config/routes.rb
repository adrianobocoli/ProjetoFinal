Rails.application.routes.draw do

  resources :usuarios
  
  root             'home#index'
  get 'ajuda'   => 'estaticas#ajuda'
  get 'sobre'   => 'estaticas#sobre'
  get 'contato' => 'estaticas#contato'
  get 'signup'  => 'users#new'
end
