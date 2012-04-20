class Event < ActiveRecord::Base
  validates :name, :presence => true
  validates :points, :presence => true 
  validates :editorial, :presence => true 
  belongs_to :editorial
end
