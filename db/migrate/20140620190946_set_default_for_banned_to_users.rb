class SetDefaultForBannedToUsers < ActiveRecord::Migration
  def change
    change_column :users, :banned, :boolean, default: false
  end
end
