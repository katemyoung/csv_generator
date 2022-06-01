require "rails_helper"

RSpec.describe "adding an employer" do
  it "allows a user to create an employer with name and eNapsa account number" do
    visit new_employer_path
    fill_in "Name", with: "My Compnay"
    fill_in "Account number", with: 1234567 
    click_on "Create Employer"
    visit employers_path
    expect(page).to have_content("My Compnay")
    expect(page).to have_content(1234567)
  end
end