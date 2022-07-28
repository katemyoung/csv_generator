class Employee < ApplicationRecord
  belongs_to :employer
  
  validates :ssn, length: {is: 9}, numericality: { only_integer: true }
  validates :nrc, :surname, :first_name, :dob, presence: true
end
