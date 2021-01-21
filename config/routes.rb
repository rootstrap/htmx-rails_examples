# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'examples#index'

  resources :examples, only: [] do
    collection do
      get :click_to_edit
      get :bulk_update
      get :click_to_load
      get :delete_row
    end
  end

  resources :contacts do
    collection do
      put :activate
      put :deactivate
    end
  end
end
