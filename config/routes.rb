Rails.application.routes.draw do
  get '/tests' => 'tests#index'
  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end