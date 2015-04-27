class Answer < ActiveRecord::Base
  belongs_to :word
  
  validates :content, presence: true, length: {maximum:20}

  scope :correct, -> {where(correct: true)}
end
