Rails.application.routes.draw do

  namespace :console do
    get '/', to: 'home#index'
  end
  root to: 'home#index'

  mount_devise_token_auth_for 'User', at: 'auth'
end
