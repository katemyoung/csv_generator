require "rails_helper"

describe Employer do
  let(:name) { "My Company" }
  let(:account_number) { 1234567 }
  let(:employer) { FactoryBot.build_stubbed(:employer) }

  describe "initialisation" do
    it "has an account number" do
      expect(employer.account_number).to eq(account_number)
    end

    it "has an employer name" do
      expect(employer.name).to eq(name)
    end
  end
end