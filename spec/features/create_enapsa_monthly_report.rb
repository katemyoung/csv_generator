require "rails_helper"

describe "creating a csv report" do
  describe "suggested return date is correct for months Feb to Dec" do
    it "allows a user to generate a csv file report" do
      visit "/enapsa_monthly_report/new"
      fill_in "Employer", with: "My Company" # can change to dropdown menu
      # date will be auto selected
      click_on "Generate report"
      expect(page).to have_content("Your file is ready to download")
      # expect file download
    end
  end

  xdescribe "suggested return date is correct for monthh: January" do
  end

  xdescribe "custom return date is required" do
  end
end
