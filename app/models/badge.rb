class Badge < ActiveRecord::Base
  validates :name, :description, :media, :url, :award_id, presence: true

  belongs_to :award
  belongs_to :event
end
