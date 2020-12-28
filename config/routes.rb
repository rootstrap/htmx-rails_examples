# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'examples#index'

  resources :examples, only: [] do
    collection do
      get :click_to_edit
    end
  end

  resources :contacts
end
