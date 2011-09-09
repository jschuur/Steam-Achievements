SteamRails::Application.routes.draw do
  root :to => 'achievements#index'
  
  resources :users
  
  # OmniAuth routes
  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#error"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/settings" => "users#edit", :as => :settings

  # Catch all for user/game achievement URL
  match '/a/:user/:game' => 'achievements#show', :as => :achievements
  match '/a' => redirect("/")
end