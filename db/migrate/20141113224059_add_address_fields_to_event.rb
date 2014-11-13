class AddAddressFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :address_1, :string
    add_column :events, :address_2, :string
  end
end
