require "rails_helper"

describe "creating a csv report" do
  describe "suggested return date is correct" do
    it "allows a user to generate a csv file report" do
      visit "/enapsa_monthly_report/new"
      fill_in "Employer", with: "My Company" # can change to dropdown menu
      # date will be auto selected
      click_on "Generate report" 
      expect(page).to have_content("Click here to download your file")
      # expect file download
    end
  end

  xdescribe "custom return date is required" do
  end
end
