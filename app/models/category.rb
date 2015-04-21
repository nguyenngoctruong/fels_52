class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy

  validates :name, presence: true, length: {maximum: 200}
end
