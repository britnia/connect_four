Rails.application.routes.draw do
  resources :games
  root 'welcome#index'
end
