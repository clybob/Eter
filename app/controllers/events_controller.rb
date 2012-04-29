class EventsController < ObjectsController
  def get_class
    Event
  end

  def field_for_search
    "name"
  end
end
