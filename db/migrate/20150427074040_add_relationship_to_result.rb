class AddRelationshipToResult < ActiveRecord::Migration
  def change
    add_reference :results, :lesson, index: true, foreign_key: true
    add_reference :results, :word, index: true, foreign_key: true
  end
end
