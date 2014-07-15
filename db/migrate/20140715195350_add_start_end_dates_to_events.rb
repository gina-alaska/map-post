class AddStartEndDatesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :starts_at, :datetime
    add_column :events, :ends_at, :datetime
    
    Event.all.each do |event|
      event.starts_at = event.event_at
      event.ends_at = event.event_at + 1.day
      event.save!
    end
  end
end
