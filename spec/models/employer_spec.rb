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
end