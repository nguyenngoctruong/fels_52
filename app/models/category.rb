class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons
  
  validates :name, presence: true, length: {maximum: 200}

  def count_words_learned user
    words.learned_words(user).count
  end
end
