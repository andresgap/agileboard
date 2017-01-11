Rails.application.routes.draw do
  get 'sprints/index'

  get 'sprints/new'

  get 'sprints/create'

  get 'sprints/update'

  get 'sprints/show'

  get 'sprints/destroy'

  mount Ckeditor::Engine => '/ckeditor'
  get 'projects/index'

  get 'projects/new'

  get 'projects/create'

  get 'projects/edit'

  get 'projects/update'

  get 'projects/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resources :projects 
  resources :sprints  
end
