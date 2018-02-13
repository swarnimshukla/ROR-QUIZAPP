  Rails.application.routes.draw do
  get 'logout/index'
  get 'game/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:{registerations: "registerations"}
  get 'dashboard/index'
  get 'welcome/index'
  post 'game/index/', to: 'game#index'
  post 'game/first'
  post 'game/index'
  get 'game/wrong'
  root 'welcome#index'
  post 'game/submit',to: 'game#submit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 