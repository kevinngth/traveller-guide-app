class ChangeColumnInExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :user_id
    add_reference :experiences, :guide, index: true
    add_reference :guides, :user, index: true
    add_column :guides, :active, :boolean
    add_column :guides, :bio, :text
  end
end