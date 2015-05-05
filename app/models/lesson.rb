class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results

  accepts_nested_attributes_for :results, allow_destroy: true

end
