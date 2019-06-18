class TodoUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo_users = current_user.todo_users.where(completed: true)
  end

  def show

  end

  def create
    @todo = Todo.find(params[:todo_id])
    @todo_users = TodoUser.new(todo: @todo, user: current_user, completed: true)
    if @todo_users.save
      redirect_to todos_path, notice: 'La tarea ha sido ingresada exitosamente'
    else
      redirect_to todos_path, alert: 'La tarea no ha podido ser ingresada'
    end 
  end

  def complete
    todo = Todo.find(params[:todo_id])
    todo_user = current_user.todo_users.find_by(todo_id: todo)
    todo_user.completed = true
    todo_user.save!

    redirect_to todos_path
  end


  def incomplete
    todo = Todo.find(params[:todo_id])
    todo_user = current_user.todo_users.find_by(todo_id: todo)
    todo_user.completed = false
    todo_user.save!

    redirect_to todos_path
  end

  
  
end
