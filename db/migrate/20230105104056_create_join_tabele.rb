class CreateJoinTabele < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :users ,table_name: :posts_users_read_status do |t|
      t.index :post_id
      t.index :user_id
    end
  end
end
