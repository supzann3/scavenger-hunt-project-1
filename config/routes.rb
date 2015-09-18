Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  get "/clues", to: "clues#index"
  post "/clues", to: "clues#answer"
end
