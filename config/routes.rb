# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'

  scope module: :web do
    resources :articles do
      scope module: :articles do
        resources :comments, only: [:create, :destroy]
      end
      patch :publish, on: :member
      patch :archive, on: :member
    end
    namespace :admin do
      resources :articles, except: [:create, :new] do
        patch :publish, on: :member
        patch :archive, on: :member
      end

      resources :comments, only: [:index] do
        scope module: :comments do
          resource :rating, only: [:update]
        end
      end
    end
  end
end
