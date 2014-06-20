class User < ActiveRecord::Base
  include GinaAuthentication::UserModel
  
  has_many :events
  
  def ban
    self.update_attribute(:banned, true)
  end
  
  def unban
    self.update_attribute(:banned, false)
  end
  
  def to_s
    self.authorizations.last.try(:uid)
  end
end
