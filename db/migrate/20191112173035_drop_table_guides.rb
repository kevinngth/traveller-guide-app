class DropTableGuides < ActiveRecord::Migration[6.0]
  def change
    drop_table :guides
    create_table :guides do |t|
      t.references :users
      t.boolean :active
      t.text :bio
      t.timestamps
    end
  end
end