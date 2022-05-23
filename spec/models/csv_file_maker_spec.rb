require "rails_helper"
require "csv"

describe CSVFileMaker do
  let(:file_path) { "tmp/test.csv" }
  let(:file_maker) { CSVFileMaker.new }
   
  describe "#generate_file" do
    let(:csv_maker) { CSVFileMaker.new }
  
    it "outputs a csv file" do
      expect(csv_maker.generate_file).to be_a(CSV)
    end
  end
  
end