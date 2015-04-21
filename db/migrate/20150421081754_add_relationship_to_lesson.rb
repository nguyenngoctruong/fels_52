class AddRelationshipToLesson < ActiveRecord::Migration
  def change
    add_reference :lessons, :user, index: true, foreign_key: true
    add_reference :lessons, :category, index: true, foreign_key: true
  end
end
