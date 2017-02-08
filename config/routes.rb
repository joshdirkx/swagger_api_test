Rails.application.routes.draw do
  resources :posts
  namespace :internal do
    resources :documentation, only: [:index]
  end
end

