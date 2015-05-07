class Activity < ActiveRecord::Base
  enum action: [:lesson, :follow, :unfollow]

  belongs_to :user

  validates :action, presence: true
  validates :target_id, presence: true

  scope :order_time, ->{order created_at: :desc}

  def return_target_object
    lesson? ? Lesson.find_by(id: target_id) : User.find_by(id: target_id)
  end
end
