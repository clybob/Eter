class AwardsController < ObjectsController

  def get_class
    Award
  end

  def field_for_search
    "name"
  end

end