require "rails_helper"

describe Employer do
  let(:name) { "My Company" }
  let(:account_number) { 1234567 }

  describe "initialisation" do
    describe "valid case" do
      let(:employer) { FactoryBot.build_stubbed(:employer) }
      it "has an account number" do
        expect(employer.account_number).to eq(account_number)
      end
  
      it "has an employer name" do
        expect(employer.name).to eq(name)
      end
    end

    describe "invalid cases" do
      let(:employer) { FactoryBot.build(:employer, account_number: nil) }
      it "fails when trying to create an employer with no account number" do
        expect(employer.save).to be(false)
      end
    end
  end
end