Rails.application.routes.draw do
  #get 'todo_users/create'
  get 'todo_users/conteo', to: 'todo_users#conteo'
  #resources 'todo/:id', to: 'todo#show', as: 'show_todo'
  resources :todos, only: [:show, :index] do
    resources :todo_users, only: [:index, :create]
    post 'complete/', to:'todo_users#complete', as: 'complete_todo'  
    post 'incomplete/', to:'todo_users#incomplete', as: 'incomplete_todo'  
  end
 
  resources :todo_users, only: [:index, :create]
  
  devise_for :users
  delete 'destroy_user_session', to: 'devise/sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todos#index"
end
