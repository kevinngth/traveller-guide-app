class AddDpToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dp, :text
  end
end
