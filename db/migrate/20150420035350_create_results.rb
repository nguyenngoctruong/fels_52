class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|

      t.timestamps null: false
    end
    add_index :results, [:lesson_id, :word_id, :answer_id, :created_at]
  end
end
