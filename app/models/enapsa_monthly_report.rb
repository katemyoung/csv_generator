class EnapsaMonthlyReport
  require "csv"
  attr_accessor :employer, :employee

  ENAPSA_REPORTS_PATH = Rails.root.join("tmp/enapsa_reports").freeze

  def initialize(employer, year, month, employee) 
    @employer = employer # dependency injection - pass in the whole object
    @year = year
    @month = month
    @employee = employee
  end

  def generate_file
    p "This is generate_csv_data #{generate_csv_data}"
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
  
  def generate_csv_data
    p "This is ssn #{ssn}"
    [employer_account_number, year.to_s, month.to_s, ssn, nrc, surname, first_name, other_name, dob] # gross_pay, employer_share, employee_share]
  end

  def file_path
    ENAPSA_REPORTS_PATH.join("#{employer.name}.csv")
  end
end
