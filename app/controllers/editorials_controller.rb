class EditorialsController < ObjectsController
  def get_class
    Editorial
  end

  def field_for_search
    "uri"
  end
end
