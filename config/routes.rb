Rails.application.routes.draw do
  namespace :api do
    get "/people" => "people#index"
    get '/people/:id' => 'people#show'

    get '/organizations' => 'organizations#index'
    get '/organizations:id' => 'organizations#show'
  end
end