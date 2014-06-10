class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  
  scope :visible, -> { where(visible: true).includes(:user).where(user: { banned: false }) }
  
  validates :title, presence: true
  validates :description, presence: true
  validates :event_at, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
  
  def visible?
    self.visible and not self.user.banned?
  end
  
  def hidden_reason
    if self.visible
      "Event was hidden"
    elsif self.user.banned?
      "User was banned"
    end
  end
end
