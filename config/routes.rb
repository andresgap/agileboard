Rails.application.routes.draw do
 

  mount Ckeditor::Engine => '/ckeditor'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'projects/index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resources :projects do
    resources :sprints, :only => [:index,:show ,:new,:create ,:edit, :update, :destroy] do
      resources :tasks,:only => [:index,:show ,:new,:create ,:edit, :update, :destroy]
    end
  end
  put "/projects/:project_id/sprints/:sprint_id/tasks" => "tasks#change_stage"
end
