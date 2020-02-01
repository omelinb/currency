class Currency < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :rate, numericality: { greater_than: 0 }, presence: true
end
