require "rails_helper"

RSpec.describe "adding an employer" do
  context "valid inputs" do
  it "allows a user to create an employer with name and eNapsa account number" do
      visit new_employer_path
      fill_in "Name", with: "My Company"
      fill_in "Account number", with: 1234567
      click_on "Create Employer"
      expect(page).to have_content("My Company")
      expect(page).to have_content(1234567)
    end
  end

  context "with invlaid input: no account number" do
    it "does not allow a user to create an employer without an eNapsa account number" do
      visit new_employer_path
      fill_in "Name", with: "My Company"
      click_on "Create Employer"
      expect(page).not_to have_content("My Company")
    end

    it "rerenders the new employer form and dispalys an error message if an invalid or no eNapsa account number is supplied" do
      visit new_employer_path
      fill_in "Name", with: "My Company"
      click_on "Create Employer"
      expect(page).to have_content("Account number is the wrong length (should be 7 characters)")
    end
  end

  context "with invlaid input: no name" do
    it "does not allow a user to create an employer without an name" do
      visit new_employer_path
      fill_in "Account number", with: 1234567
      click_on "Create Employer"
      expect(page).not_to have_content("1234567")
    end

    it "rerenders the new employer form and dispalys an error message if no name is supplied" do
      visit new_employer_path
      fill_in "Account number", with: 1234567
      click_on "Create Employer"
      expect(page).to have_content("Name can't be blank")
    end
  end
end
