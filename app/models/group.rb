class Group < ActiveRecord::Base
  scope :visible, -> { where(visible: true) }
  scope :available, -> { where(visible: true, restricted: false) }
  
  def to_s 
    "#{name} (#{acronym})"
  end
end
