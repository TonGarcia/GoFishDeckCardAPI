Rails.application.routes.draw do
  resources :decks
  resources :cards
  resources :games
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # API external connections
  namespace :api, defaults: {format: :json} do
    # API Version: 1
    namespace :v1 do
      post '/games' => 'games#new'
    end
  end

end
