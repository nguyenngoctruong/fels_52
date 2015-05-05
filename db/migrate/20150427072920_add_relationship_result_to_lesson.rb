class AddRelationshipResultToLesson < ActiveRecord::Migration
  def change
    add_reference :lessons, :result, index: true, foreign_key: true
  end
end
