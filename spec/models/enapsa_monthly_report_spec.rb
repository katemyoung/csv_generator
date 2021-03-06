require "rails_helper"

describe EnapsaMonthlyReport do
  describe "#generate_file" do
    it "writes the data to a csv file" do
      employer = create(:employer, account_number: 1111111)
      file_path = "#{Rails.root}/public/enapsa_reports/#{employer.name}.csv"
      month = "06"
      year = 2022
      csv_file = instance_double(CSV)
      allow(CSV).to receive(:open).with(file_path, "w").and_yield(csv_file)
      allow(csv_file).to receive(:add_row)
      csv_file_maker = EnapsaMonthlyReport.new(employer, year, month)

      csv_file_maker.generate_file

      expect(CSV).to have_received(:open).with(file_path, "w").once
      expect(csv_file).to have_received(:add_row).with(["1111111", "2022", "06"]).once
    end
  end
end
