class ChangeColumnGuideToIsGuideInUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.rename :guide, :is_guide
    end
  end
end