Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists do
    resources :clues
  end
  devise_for :users
  post "/lists/:list_id/clues/:id", to: "clues#validate", as: :validate_answer
  post "/clues", to: "clues#answer"
  get "/lists/:list_id/newcluefromaddress", to: "clues#new_from_address", as: :new_from_address
  post "/lists/:list_id/newcluefromaddress", to: "clues#create_from_address", as: :create_from_address

end
