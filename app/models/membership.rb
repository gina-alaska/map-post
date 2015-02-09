class Membership < ActiveRecord::Base
  include GinaAuthentication::MembershipModel

  def name_with_email
    if user.nil?
      email
    else
      "#{user.name} &lt;#{user.email}&gt;".html_safe
    end
  end

  def admin
    true
  end

  def last_login
    user.nil? ? 'Never' : user.authorizations.last.updated_at
  end
end
