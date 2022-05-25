require "rails_helper"
require "csv"

describe CSVFileMaker do
  describe "#generate_file" do
    after(:context) { File.delete("./tmp/test.csv") }
    let(:csv_maker) { CSVFileMaker.new }
    let(:file_path) { "./tmp/test.csv"}
    let(:file) { csv_maker.generate_file(file_path) }
    
    it "outputs a csv file" do
      expect(file).to be_a(CSV)
    end

    it "takes a file path and name as an argument" do
      expect(csv_maker).to respond_to(:generate_file).with(1).argument 
    end
 
    it "outputs a csv file containing the employers account number" do
      expect(CSV.read("#{file_path}")).to include(["1234567"])
    end
  end
end
