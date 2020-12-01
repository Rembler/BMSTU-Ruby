class Result < ApplicationRecord
  validates :val1, numericality: { greater_than_or_equal_to: 0 }, uniqueness: true
  validates :gcf, presence: true
end
