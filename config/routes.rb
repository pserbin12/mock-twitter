Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "toot#index"
  get "/timeline", to: "toot#timeline", as: :timeline
  get "/users", to: "user#index", as: :toot_users
  get "/users/:id", to: "user#show", as: :user
  get "/users/follow/:id", to: "user#follow", as: :follow_user
  get "/user/unfollow/:id", to: "user#unfollow", as: :unfollow_user
end
