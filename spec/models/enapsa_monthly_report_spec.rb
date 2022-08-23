require "rails_helper"

describe EnapsaMonthlyReport do

  describe "#generate_file" do
    it "writes the data to a csv file" do
      employer = create(:employer, account_number: 1111111)
      employee = create(:employee, employer: employer)
      file_path = Rails.root.join("tmp/enapsa_reports/#{employer.name}.csv")
      month = "06"
      year = 2022
      csv_file = instance_double(CSV)
      allow(CSV).to receive(:open).with(file_path, "w").and_yield(csv_file)
      allow(csv_file).to receive(:add_row)
      csv_file_maker = EnapsaMonthlyReport.new(employer, year, month, employee)

      csv_file_maker.generate_file

      expect(CSV).to have_received(:open).with(file_path, "w").once
      expect(csv_file).to have_received(:add_row).with(["1111111", "2022", "06", "123456789", "123456/78/9", "Banda", "Mary", "Chungu", "23/05/1980", 2500.00, 125.00, 125.00]).once
    end
  end
end
