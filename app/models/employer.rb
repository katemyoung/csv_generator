class Employer
  attr_accessor :account_number, :name

  def initialize(account_number, name)
    @account_number = account_number
    @name = name
  end
end