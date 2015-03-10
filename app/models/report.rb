class Report < ActiveRecord::Base
  belongs_to :event, counter_cache: true, touch: true
  belongs_to :user
end
