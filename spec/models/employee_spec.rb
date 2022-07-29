require 'rails_helper'

RSpec.describe Employee, type: :model do
  context "when all the correct attributes are assigned" do
    it "is valid" do
      employer = create(:employer)
      employee = build_stubbed(:employee, ssn: 123456789, surname: "Banda", employer: employer)
      
      expect(employee).to be_valid
    end
  end

  context "invalid cases" do
    it "fails when trying to create an employer with no account number" do
      employer = create(:employer)
      employee = build(:employee, ssn: nil)

      expect(employee.save).to be(false)
    end
  end
end
