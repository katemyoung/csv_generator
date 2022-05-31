require "rails_helper"

describe Employer do
  let(:account_number) { "123456"}
  let(:name) { "My Company" }
  let(:employer) { Employer.create(account_number: account_number, name: name) }

  describe "initialisation" do
    it "has an account number" do
      expect(employer).to respond_to(:account_number)
    end

    it "has an employer name" do
      expect(employer).to respond_to(:name) 
    end
  end

  describe ".find_by" do
    it "returns an account number as a string given an employer name" do
      employer_record = Employer.find_by(name: employer.name)
      expect(employer_record.account_number.to_s).to eq(employer.account_number.to_s)
    end
  end
end