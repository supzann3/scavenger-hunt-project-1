Rails.application.routes.draw do
  root to: 'home#index'
  resources :lists do
    resources :clues
  end
  devise_for :users
  post "/lists/:list_id/clues/:id", to: "clues#validate", as: :validate_answer
  post "/clues", to: "clues#answer"
end
