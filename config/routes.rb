Rails.application.routes.draw do

  root 'travellers#landing'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home' => 'travellers#landing'
  get 'travellers/dashboard' => 'travellers#index'
  get '/profilepicture' => 'travellers#profilepic'
  post '/profilepicture' => 'travellers#createpic'
  get 'travellers/findguide' => 'travellers#findguide'
  post 'travellers/create' => 'travellers#createsearch'
  get 'travellers/searchresults'=> 'travellers#persistentresults'
  get '/travellers/becomeaguide' =>  'travellers#becomeaguide', as: 'user'
  post '/travellers/becomeaguide' => 'travellers#makeguide'

  resources :travellers

  resources :guides do
    resources :experiences
    resources :reviews
  end



  resources :conversations do
    resources :messages
  end


end