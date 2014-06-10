class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.references :group, index: true
      t.references :user, index: true
      t.boolean :visible, default: true
      t.datetime :event_at

      t.timestamps
    end
  end
end
