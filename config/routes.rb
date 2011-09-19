SteamRails::Application.routes.draw do
  root :to => 'achievements#index'
  
  # OmniAuth routes
  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#error"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/settings" => "users#edit", :as => :settings
  match "/users/disconnect_twitter" => "users#disconnect_twitter", :as => :disconnect_twitter
  match "/about" => "application#about", :as => :about

  # Catch all for user/game achievement URL
  match '/achievements/search' => 'achievements#search', :as => :search
  match '/a/:user/:game' => 'achievements#show', :as => :achievements
  match '/friends/:id' => 'friends#show', :as => :friends
end