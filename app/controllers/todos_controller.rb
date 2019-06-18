class TodosController < ApplicationController
  before_action :set_todo, only: [:show]
  
  
  def index
    @todos = Todo.all
  end

  def show
    @users = User.all
    
  end




  private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_users
    params.requiere(:todo_users).permit(:completed)
  end

end
