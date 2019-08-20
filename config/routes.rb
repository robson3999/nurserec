Rails.application.routes.draw do
  resources :medicaments
  resources :medicament_groups
  resources :substances

  root to: 'medicaments#index'
end
