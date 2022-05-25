require "rails_helper"
require "csv"

describe CSVFileMaker do
  describe "#generate_file" do
    after(:context) { File.delete("./tmp/test.csv") }
    let(:csv_maker) { CSVFileMaker.new }
    let(:file_path) { "./tmp/test.csv"}
    
    it "outputs a csv file" do
      expect(csv_maker.generate_file(file_path)).to be_a(CSV)
    end

    it "takes a file path and name as an argument" do
      expect(csv_maker).to respond_to(:generate_file).with(1).argument 
    end
  end
end
