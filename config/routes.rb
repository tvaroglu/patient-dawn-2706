Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'
  post '/teams/:competition_id', to: 'competition_teams#create'

end
