require "rails_helper"

RSpec.describe "adding an employer" do
  it "allows a user to create an employer with name and eNapsa account number" do
    visit new_employer_path
    fill_in "Employer Name", with: "My Compnay"
    fill_in "eNapsa Account Number", with: 1234567 
    click_on "Create Employer"
    visit employers_path
    expect(page).to have_content("My Compnay")
    expect(page).to have_content(1234567)
  end
end