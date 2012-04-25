class UsersController < ObjectsController

  def index
    @users = User.search(params[:search], params[:page])
  end

  def get_class
    User
  end

end