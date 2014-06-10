class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :acronym
      t.text :description
      t.boolean :restricted
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
