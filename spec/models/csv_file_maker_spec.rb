require "rails_helper"
require "csv"

describe CSVFileMaker do
  let(:csv_maker) { CSVFileMaker.new }
  let(:file_path) { "./tmp/test.csv"}
  let(:file) { csv_maker.generate_file(file_path) }
  let(:csv_data) { csv_maker.generate_csv_data }

  describe "#generate_csv_data" do
    let(:account_number) { "1234567" }
    let(:year) { "2022" }

    it "returns an array" do
      expect(csv_data).to be_an(Array)
    end

    it "contains the employer's account number" do
      expect(csv_data).to include(account_number) 
    end

    it "contains the year" do
      expect(csv_data).to include(year) 
    end

  end

  describe "#generate_file" do
    after(:context) { File.delete("./tmp/test.csv") }
    
    it "outputs a csv file" do
      expect(file).to be_a(CSV)
    end

    it "takes a file path and name as an argument" do
      expect(csv_maker).to respond_to(:generate_file).with(1).argument 
    end
 
    it "outputs a csv data contains the employer's account number" do
      expect(CSV.read("#{file_path}")).to include(csv_data) 
    end
  end
end
