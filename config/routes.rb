Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :medicaments
  resources :medicament_groups
  resources :substances

  scope :admin do
    get :panel, to: 'admin#panel'
    post :upload_substances_csv, to: 'admin#upload_substances_csv' 
    post :upload_drugs_csv, to: 'admin#upload_drugs_csv' 
  end

  root to: 'medicaments#index'
end
