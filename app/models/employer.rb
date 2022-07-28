class Employer < ApplicationRecord
  validates :account_number, length: {is: 7}, numericality: { only_integer: true }
  validates :name, presence: true
end
