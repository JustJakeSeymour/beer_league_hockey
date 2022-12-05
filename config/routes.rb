Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/divisions", to: "divisions#index"
  get "/teams", to: "teams#index"
  get "/divisions/new", to: "divisions#new"
  get "/divisions/:id", to: "divisions#show"
  get "/teams/:id", to: "teams#show"
  post "/divisions", to: "divisions#create"
end
