require "rails_helper"

describe CSVFileMaker do
  let(:file_maker) { CSVFileMaker.new }

  it "responf to the method generate_file" do
    expect(file_maker).to respond_to(:generate_file)
  end
end