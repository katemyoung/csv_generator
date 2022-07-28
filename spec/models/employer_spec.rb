require "rails_helper"

describe Employer do
  context "when all the correct attributes are assigned" do
    it "is valid" do
      employer = build_stubbed(:employer, account_number: 1234567, name: "Test company")
      
      expect(employer).to be_valid
    end
  end

  context "invalid cases" do
    it "fails when trying to create an employer with no account number" do
      employer = build(:employer, account_number: nil)

      expect(employer.save).to be(false)
    end
  end
end
