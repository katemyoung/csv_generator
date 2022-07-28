class Employer < ApplicationRecord
  validates :account_number, length: {is: 7}
  validates :name, presence: true
end
