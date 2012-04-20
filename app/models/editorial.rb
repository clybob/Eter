class Editorial < ActiveRecord::Base
  validates :uri, :presence => true 
end
