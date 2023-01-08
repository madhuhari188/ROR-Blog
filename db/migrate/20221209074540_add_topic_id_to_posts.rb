class AddTopicIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :topic_id, :integer
    add_index :posts, :topic_id
  end
end
