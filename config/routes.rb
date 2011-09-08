SteamRails::Application.routes.draw do
  root :to => 'main#index'
  match ':user/:game' => 'achievements#show'
end
