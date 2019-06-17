Rails.application.routes.draw do
  get 'todo_users/create'
  resources :todos, only: :index do
    resources :todo_users, only: [:index, :create]
    post 'incomplete/', to:'todo_users#incomplete', as: 'incomplete_todo'  
  end
 
  resources :todo_users, only: [:index, :create]
  
  devise_for :users
  delete 'destroy_user_session', to: 'devise/sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todos#index"
end
