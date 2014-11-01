class AddReportsCountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :reports_count, :integer
  end
end
