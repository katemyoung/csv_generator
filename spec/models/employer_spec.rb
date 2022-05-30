require "rails_helper"

describe Employer do
  let(:account_number) { "123456"}
  let(:employer) { Employer.new(account_number) }

  describe "initialisation" do
    it "has an account number" do
      expect(employer).to respond_to(:account_number)
    end
  end
end