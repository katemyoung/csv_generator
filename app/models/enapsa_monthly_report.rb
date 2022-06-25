class EnapsaMonthlyReport
  require "csv"
  attr_accessor :employer_name

  def initialize(employer_name, month=(Time.now.mon - 1))
    @employer_name = employer_name
    @month = month
  end

  def generate_file
    CSV.open(file_path, "w") do |csv|
      csv.add_row(generate_csv_data)
    end
  end

  private

  attr_accessor :month

  def employer_account_number
    Employer.find_by(name: @employer_name).account_number.to_s
  end

  def generate_csv_data
    [employer_account_number, "2022", month.to_s]
  end

  def file_path
    "#{Rails.root}/public/enapsa_reports/#{@employer_name}.csv"
  end
end
