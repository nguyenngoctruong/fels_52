class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :correct

      t.timestamps null: false
    end
  end
end
