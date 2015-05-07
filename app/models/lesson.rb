class Lesson < ActiveRecord::Base
  include ActivityLogs

  belongs_to :user
  belongs_to :category
  has_many :results
  before_save :update_sum_correct
  after_save :save_activity

  accepts_nested_attributes_for :results, allow_destroy: true

  def update_sum_correct
    self.sum_correct = results.select do |result|
      result.answer == result.answers.correct.first
    end.count
  end

  def save_activity
    create_activity user_id, id, "lesson"
  end

end
