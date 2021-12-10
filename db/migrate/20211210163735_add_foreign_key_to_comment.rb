class AddForeignKeyToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :author_id, null: false, foreign_key: { to_table: :users }
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
