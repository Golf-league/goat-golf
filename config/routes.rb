Rails.application.routes.draw do
  root to: 'leaderboard#leaderboard'
  get "/leaderboard" => "leaderboard#leaderboard"
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :users
  resources :scores, only: [:index, :new, :create]
end
