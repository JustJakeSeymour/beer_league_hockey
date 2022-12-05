Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/divisions", to: "divisions#index"
  get "/teams", to: "teams#index"
  get "/divisions/new", to: "divisions#new"
  get "/divisions/:id", to: "divisions#show"
  get "/teams/:id", to: "teams#show"
  post "/divisions", to: "divisions#create"
  get "/divisions/:id/edit", to: "divisions#edit"
  patch "/divisions/:id", to: "divisions#update"
  get "/divisions/:id/teams", to: "division_teams#index"
  get "/divisions/:id/teams/new", to: "division_teams#new"
  post "/divisions/:id/teams", to: "division_teams#create"
  get "/teams/:id/edit", to: "teams#edit"
end
