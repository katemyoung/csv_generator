require "rails_helper"

describe Employer do
  describe "initialisation" do
    describe "valid case" do
      it "has an account number" do
        employer = create(:employer, account_number: 1234567)

        expect(employer.account_number).to eq(1234567)
      end

      it "has an employer name" do
        employer = create(:employer, name: "My Company")

        expect(employer.name).to eq("My Company")
      end
    end

    describe "invalid cases" do
      it "fails when trying to create an employer with no account number" do
        employer = build(:employer, account_number: nil)

        expect(employer.save).to be(false)
      end
    end
  end
end
