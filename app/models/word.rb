class Word < ActiveRecord::Base
  
  belongs_to :category

  has_many :result
  has_many :answers, dependent: :destroy  
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum:20}

  learned_word_ids = "SELECT word_id FROM results JOIN lessons WHERE lessons.user_id = :user_id"
  scope :learned_words, ->user {where "id IN (#{learned_word_ids})", user_id: user.id}

  scope :not_learned_words, ->user {where "id NOT IN (#{learned_word_ids})",
    user_id: user.id}

  scope :filter_category, ->category_id {where category_id: category_id if category_id.present?}

  scope :random_words, ->user {not_learned_words(user).limit(6)
    .order "RANDOM()"}
end
