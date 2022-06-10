class Employer < ApplicationRecord
  validates :account_number, length: {is: 7}
end
