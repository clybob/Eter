class Point < ActiveRecord::Base
  validates :user_name, :event, :badge, :points, presence: true
  
  belongs_to :user
  belongs_to :event
  belongs_to :badge
end
