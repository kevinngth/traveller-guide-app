Rails.application.routes.draw do

  root 'travellers#index'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'travellers/dashboard' => 'travellers#index'
  get 'travellers/findguide' => 'travellers#findguide'
  post 'travellers/findguide' => 'travellers#createsearch'
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