class Employer < ApplicationRecord
  validates :account_number, presence: true
end