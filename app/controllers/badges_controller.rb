class BadgesController < ObjectsController
  def get_class
    Badge
  end

  def field_for_search
    "name"
  end
end
