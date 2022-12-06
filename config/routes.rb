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
  get "/divisions/:id/teams", to: "divisions/teams#index"
  get "/divisions/:id/teams/new", to: "divisions/teams#new"
  post "/divisions/:id/teams", to: "divisions/teams#create"
  get "/teams/:id/edit", to: "teams#edit"
  patch "/teams/:id", to: "teams#update"
  delete "/divisions/:id", to: "divisions#destroy"
  delete "/teams/:id", to: "teams#destroy"
end
