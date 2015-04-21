class ChangeCorrectTypeInAnswer < ActiveRecord::Migration
  def change
    change_column :answers, :correct, :boolean
  end
end
