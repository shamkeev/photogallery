class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :photo

  validates :rating, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :text, presence: true, length:{maximum: 140}
end
