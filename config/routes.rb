Rails.application.routes.draw do
  get "books", to: "books#index"
  get "books/:id", to: "books#show"

  post "books", to: "books#create"

  # put "books/:id", to: "books#update"
  match "books/:id", to: "books#update", via: [ :put, :patch ]
  delete "books/:id", to: "books#destroy"
end
