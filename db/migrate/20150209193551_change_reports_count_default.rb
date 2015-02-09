class ChangeReportsCountDefault < ActiveRecord::Migration
  def up
    change_column :events, :reports_count, :integer, default: 0, nil: false
    Event.where(reports_count: nil).update_all(reports_count: 0)
  end

  def down
    change_column :events, :reports_count, :integer
  end
end
