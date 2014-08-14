class AddUserIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :user_id, :integer
    change_column :groups, :restricted, :boolean, default: false
  end
end
