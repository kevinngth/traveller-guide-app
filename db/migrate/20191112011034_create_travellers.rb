class CreateTravellers < ActiveRecord::Migration[6.0]
  def change
    create_table :travellers do |t|

      t.timestamps
    end
  end
end
