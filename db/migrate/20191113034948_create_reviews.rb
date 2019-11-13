class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :guide
      t.text :body
      
      t.timestamps
    end
  end
end
