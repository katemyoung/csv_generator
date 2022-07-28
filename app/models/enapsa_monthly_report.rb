class EnapsaMonthlyReport
  require "csv"
  attr_accessor :employer

  ENAPSA_REPORTS_PATH = Rails.root.join("tmp/enapsa_reports").freeze

  def initialize(employer, year, month) 
    @employer = employer # dependency injection - pass in the whole object
    @month = month
    @year = year
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

  def generate_csv_data
    [employer_account_number, "2022", month.to_s]
  end

  def file_path
    ENAPSA_REPORTS_PATH.join("#{employer.name}.csv")
  end
end
