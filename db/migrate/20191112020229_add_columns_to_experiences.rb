class AddColumnsToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_reference :experiences, :user, null: false, foreign_key: true
    add_reference :experiences, :category, null: false, foreign_key: true
    add_column :experiences, :title, :string
    add_column :experiences, :description, :text
    add_column :experiences, :img, :text
  end
end