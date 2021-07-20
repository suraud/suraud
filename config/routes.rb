Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :console do
    get '/', to: 'home#index'
  end
  root to: 'home#index'
end
