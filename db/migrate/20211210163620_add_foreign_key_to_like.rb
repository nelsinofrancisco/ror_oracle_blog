class AddForeignKeyToLike < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :author_id, null: false, foreign_key: { to_table: :users }
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
