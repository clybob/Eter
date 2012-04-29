class UsersController < ObjectsController
  def get_class
    User
  end

  def field_for_search
    "name"
  end

end