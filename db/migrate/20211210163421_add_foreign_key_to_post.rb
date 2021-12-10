class AddForeignKeyToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :author_id, null: false, foreign_key: { to_table: :users }
  end
end
