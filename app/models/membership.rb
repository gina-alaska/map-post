class Membership < ActiveRecord::Base
  include GinaAuthentication::MembershipModel
  
  def name_with_email
    if self.user.nil?
      self.email
    else
      "#{self.user.name} &lt;#{self.user.email}&gt;".html_safe
    end
  end
  
  def admin
    true
  end
  
  def last_login
    self.user.nil? ? 'Never' : self.user.authorizations.last.updated_at
  end
end
