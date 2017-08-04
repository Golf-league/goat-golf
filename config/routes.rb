Rails.application.routes.draw do
  root to: 'leaderboard#leaderboard'
  get "/leaderboard" => "leaderboard#leaderboard"
  get "/this_year" => "leaderboard#this_year"
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :users
  resources :scores, only: [:index, :new, :create]
end
