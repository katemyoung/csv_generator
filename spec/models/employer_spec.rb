require "rails_helper"

describe Employer do
  let(:employer) { Employer.new }

  describe "initialisation" do
    it "has an account number" do
      expect(employer).to respond_to(:account_number)
    end
  end
end