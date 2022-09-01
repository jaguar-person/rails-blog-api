# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :posts, only: [:index, :create]
    get "/posts/ips", to: "posts#ip_list"

    resources :ratings
  end
end
