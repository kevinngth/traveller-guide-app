class AddLastReadAtToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :last_read_at, :datetime
  end
end
