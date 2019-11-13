Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   post '/guides' => 'travellers#createsearch'

  get 'travellers/dashboard' => 'travellers#index'
  get 'travellers/findguide' => 'travellers#findguide'
  root 'travellers#index'
  get '/travellers/becomeaguide' =>  'travellers#becomeaguide', as: 'user'
  post '/travellers/becomeaguide' => 'travellers#makeguide'
  resources :travellers
  resources :guides do
    resources :experiences
  end
  resources :reviews




  resources :conversations do

    resources :messages

  end





end