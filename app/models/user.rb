class User < ActiveRecord::Base
  include GinaAuthentication::UserModel

  has_many :events
  has_many :groups
  has_many :reports

  def ban
    update_attribute(:banned, true)
  end

  def unban
    update_attribute(:banned, false)
  end

  def to_s
    authorizations.last.try(:uid)
  end
end
