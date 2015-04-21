class Category < ActiveRecord::Base
  # has_may :words
  validates :name, presence: true, length: {maximum: 200}
end
