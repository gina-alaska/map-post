class Group < ActiveRecord::Base
  scope :visible, -> { where(visible: true) }
  scope :available, -> { where(visible: true, restricted: false) }
  
  validates :name, presence: true, uniqueness: true
  validates :acronym, presence: true, uniqueness: true
  
  def to_s 
    "#{name} (#{acronym})"
  end
end
