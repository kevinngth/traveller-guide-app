class AddGuideToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :guide, :boolean, default: false
  end
end
