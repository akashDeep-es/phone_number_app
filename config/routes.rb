Rails.application.routes.draw do
  
  post '/phones', to: 'numbers#create'
  post '/phones/:number', to: 'numbers#create'
  get '/phones', to: 'numbers#index'

end
