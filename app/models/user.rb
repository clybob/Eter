class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['name like ?', "%#{search}%"], :order => 'name ASC'
  end

end
