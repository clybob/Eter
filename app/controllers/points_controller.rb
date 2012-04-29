class PointsController < ObjectsController
  def get_class
    Point
  end

  def field_for_search
    "points"
  end
end
