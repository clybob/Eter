class Badge < ActiveRecord::Base
  belongs_to :award
  belongs_to :event
end
