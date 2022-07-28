require "rails_helper"

RSpec.describe "adding an employee" do
  context "valid inputs" do
    it "allows a user to create an employee with Social Security Number(SSN), National ID(NRC), Surname, First Name, Other Name and	Date of Birth" do
      employer = create(:employer)
      
      visit new_employer_employee_path(employer)
      fill_in "SSN", with: 123-45-6789
      fill_in "NRC", with: "123456/78/9"
      fill_in "Surname", with: "Banda"
      fill_in "First Name", with: "Mary"
      fill_in "Other Name", with: "Chungu"
      fill_in "Date of Birth", with: "23/03/1980"
      click_on "Create Employee"
      expect(page).to have_content("Mary Banda")
      expect(page).to have_content(123-45-6789)
    end
  end

  context "with invalid input" do
    xit "does not allow a user to create an employee without a Social Security Number" do
      visit new_employer_path
      fill_in "NRC", with: "123456/78/9"
      fill_in "Surname", with: "Banda"
      fill_in "First Name", with: "Mary"
      fill_in "Other Name", with: "Chungu"
      fill_in "Date of Birth", with: "23/03/1980"
      click_on "Create Employee"

      expect(page).not_to have_content("Mary Banda")
    end
  end
end