# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  namespace :api do
    namespace :v1 do
      resources :libraries, only: [] do
        resources :books, only: :index
      end
    end
  end
end
