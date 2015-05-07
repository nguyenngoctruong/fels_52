class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results
  
  validates :content, presence: true, length: {maximum:20}

  scope :correct, -> {where correct: true}
end
