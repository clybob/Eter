class Event < ActiveRecord::Base
  validates :name, :editorial, :presence => true

  validates :points, :presence => true
  validates :points, :numericality => true

  belongs_to :editorial
end
