class AddSumCorrectToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :sum_correct, :integer
  end
end
