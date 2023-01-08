class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :post_rating
      t.integer :post_id

      t.timestamps
    end
    add_index :ratings, :post_id
  end
end
