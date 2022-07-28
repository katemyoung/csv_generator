class EnapsaMonthlyReport
  require "csv"
  attr_accessor :employer, :employee

  def initialize(employer, year, month, employee) 
    @employer = employer # dependency injection - pass in the whole object
    @year = year
    @month = month
    @employee = employee
  end

  def generate_file
    CSV.open(file_path, "w") do |csv|
      csv.add_row(generate_csv_data)
    end
  end

  private

  attr_accessor :month, :year

  def employer_account_number
    employer.account_number.to_s
  end

  def ssn
    employee.ssn.to_s
  end

  def nrc
    employee.nrc
  end

  def surname
    employee.surname
  end

  def first_name
    employee.first_name
  end

  def other_name
    employee.other_name
  end

  def dob
    employee.dob.strftime("%d/%m/%Y")
  end
  
  def gross_pay
    2500.00
  end

  def employer_share
    gross_pay * 0.05
  end

  def employee_share
    gross_pay * 0.05
  end

  def generate_csv_data
    [employer_account_number, year.to_s, month.to_s, ssn, nrc, surname, first_name, other_name, dob, gross_pay, employer_share, employee_share]
  end

  def file_path
    Rails.root.join("tmp/enapsa_reports/#{employer.name}.csv")
  end
end
