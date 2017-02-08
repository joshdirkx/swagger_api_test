Rails.application.routes.draw do
  namespace :internal do
    resources :documentation, only: [:index]
  end
end

