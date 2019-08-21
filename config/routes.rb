Rails.application.routes.draw do
  devise_for :users
  resources :medicaments
  resources :medicament_groups
  resources :substances

  root to: 'medicaments#index'
end
