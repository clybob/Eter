class Point < ActiveRecord::Base
  validates :user, :event, :badge, uniqueness: true
  
  belongs_to :user
  belongs_to :event
  belongs_to :badge
end
