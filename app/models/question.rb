class Question < ApplicationRecord
  has_many :answers

  validates :title, presence: true
  validates :body, presence: true
end
