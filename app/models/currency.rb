class Currency < ApplicationRecord
  validates :code, uniqueness: true, presence: true
  validates :name, presence: true
  validates :rate, presence: true
  validates :nominal, presence: true
end
