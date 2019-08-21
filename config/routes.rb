Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :medicaments
  resources :medicament_groups
  resources :substances

  root to: 'medicaments#index'
end
