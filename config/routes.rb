# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :posts
    resources :ratings
  end
end
