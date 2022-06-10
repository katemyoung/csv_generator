require "rails_helper"

describe "creating a csv report" do
  it "allows a user to generate a csv file report" do
    visit "/enapsa_monthly_report/new"
    expect(page).to have_content("New eNapsa Report")
  end
end