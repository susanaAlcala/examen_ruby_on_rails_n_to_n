class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

after_create :set_todos
has_many :todo_users
has_many :todos, through: :todo_users

def completed_count
  self.todo_users.where(completed: true).count
end

private

  def set_todos
    @user = User.last
    @user.todos << Todo.all
    @user.save
  end

  

end
