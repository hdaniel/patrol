Rails.application.routes.draw do

  resources :devices do
    resources :logs
  end

  resources :logs

  root 'devices#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
