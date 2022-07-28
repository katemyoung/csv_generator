require 'rails_helper'

RSpec.describe Employee, type: :model do
  context "when all the correct attributes are assigned" do
    it "is valid" do
      employer = build_stubbed(:employee, ssn: 123456789, surname: "Banda")
      
      expect(employer).to be_valid
    end
  end

  context "invalid cases" do
    it "fails when trying to create an employer with no account number" do
      employer = build(:employee, ssn: nil)

      expect(employer.save).to be(false)
    end
  end
end
