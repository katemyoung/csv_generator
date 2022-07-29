require "rails_helper"

RSpec.describe "adding an employee" do
  context "valid inputs" do
    it "allows a user to create an employee with Social Security Number(SSN), National ID(NRC), Surname, First Name, Other Name and	Date of Birth" do
      employer = create(:employer)
      
      visit new_employer_employee_path(employer)
      fill_in "Ssn", with: 123456789
      fill_in "Nrc", with: "123456/78/9"
      fill_in "Surname", with: "Banda"
      fill_in "First name", with: "Mary"
      fill_in "Other name", with: "Chungu"
      fill_in "Dob", with: "23/03/1980"
      click_on "Create Employee"
      
      expect(page).to have_content("Mary Banda")
      expect(page).to have_content(123456789)
    end
  end

  context "with invalid input" do
    it "does not allow a user to create an employee without a Social Security Number" do
      employer = create(:employer)
      
      visit new_employer_employee_path(employer)
      fill_in "Nrc", with: "123456/78/9"
      fill_in "Surname", with: "Banda"
      fill_in "First name", with: "Mary"
      fill_in "Other name", with: "Chungu"
      fill_in "Dob", with: "23/03/1980"
      click_on "Create Employee"

      expect(page).not_to have_content("Mary Banda")
    end
  end
end