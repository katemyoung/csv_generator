require "rails_helper"
require "csv"

describe CsvFileMaker do
  let(:account_number) { "123456"}
  let(:name) { "My Company" }
  let(:csv_maker) { CsvFileMaker.new(name)}
  let(:csv_data) { csv_maker.generate_csv_data }

  describe "a new CsvFileMaker" do
    it "is associated with an employer account " do
      employer = Employer.new(name: name)
      allow(employer).to receive(:name).and_return(name)
      expect(csv_maker.employer_name).to eq(employer.name)
    end

    it "finds the accociated employee acount number" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(csv_maker.employer_account_number).to eq(employer.account_number.to_s)
    end
  end

  describe "#employer_account_number" do
    it "returns the employer's account number" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(csv_maker.employer_account_number).to eq(employer.account_number.to_s)
    end
  end

  describe "#generate_csv_data" do
    let(:year) { "2022" }

    it "returns an array" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(csv_data).to be_an(Array)
    end

    it "contains the employer's account number" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(csv_data).to include(employer.account_number.to_s) 
    end

    it "contains the year" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(csv_data).to include(year) 
    end

  end

  describe "#generate_file" do
    let(:file_path) { "./tmp/test.csv"}
    let(:file) { csv_maker.generate_file(file_path) }

    after(:context) { File.delete("./tmp/test.csv") }
    
    it "outputs a csv file" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(file).to be_a(CSV)
    end

    it "takes a file path and name as an argument" do
      expect(csv_maker).to respond_to(:generate_file).with(1).argument 
    end
 
    it "outputs a csv data contains the employer's account number" do
      employer = Employer.create(account_number: account_number, name: name)
      expect(CSV.read("#{file_path}")).to include(csv_data) 
    end
  end
end
