require "rails_helper"

RSpec.describe "creating an eNapsa monthly report" do
  it "allows a user to download a csv report" do
    employer = create(:employer, account_number: 1111111, name: "My Company")
    employee = create(:employee, employer: employer)
    month = Time.now.mon.to_s
    year = Time.now.year.to_s

    visit "/enapsa_monthly_report/new"
    fill_in "Employer", with: "My Company"
    click_on "Generate report"
    click_on "Download eNapsa Report"
    csv = CSV.parse(page.body).transpose

    expect(csv).to eq([["1111111"], [year], [month], ["123456789"], ["123456/78/9"], ["Banda"], ["Mary"], ["Chungu"], ["23/05/1980"]])
  end
end
