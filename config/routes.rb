Rails.application.routes.draw do
  namespace :console do
    get '/', to: 'home#index'
  end
  root to: 'home#index'
end
