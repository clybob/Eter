class Award < ActiveRecord::Base
  validates :name, presence: true
end
