class Activity < ActiveRecord::Base
  enum action: [:lesson, :follow, :unfollow]

  belongs_to :user

  validates :action, presence: true
  validates :target_id, presence: true

  def return_target_object
    lesson? ? Lesson.find(target_id) : User.find(target_id)
  end
end
