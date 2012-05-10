class Event < ActiveRecord::Base
  validates :name, :editorial_id, :points, :presence => true
  validates :points, :numericality => true

  belongs_to :editorial
end
