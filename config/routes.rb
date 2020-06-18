Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout' }
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular', to: 'portfolios#angular'
  get 'ruby_on_rails', to: 'portfolios#ror'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
