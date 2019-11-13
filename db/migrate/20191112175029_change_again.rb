class ChangeAgain < ActiveRecord::Migration[6.0]
  def change
    drop_table :guides
    create_table :guides do |t|
      t.references :user
      t.boolean :active, default: true
      t.text :bio
      t.timestamps
    end
  end
end