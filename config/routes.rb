Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/reviews' => 'reviews#index'
  get '/reviews/:id' => 'reviews#show'
  post "/reviews" => "reviews#create"
  get '/recruiters' => 'recruiters#index'
  get '/recruiters/:id' => 'recruiters#show'
end
