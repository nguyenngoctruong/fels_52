class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|

      t.timestamps null: false
    end
    add_index :lessons, [:user_id, :category_id, :created_at]
  end
end
