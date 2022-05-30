class CsvFileMaker
  require "csv"
  attr_accessor :employer_name, :employer_account_number
  
  def initialize(employer_name)
    @employer_name = employer_name
    @employer_account_number = "1234567" # get this using Employer.find_by(name: employer_name)
  end

  def generate_csv_data
    [employer_account_number, "2022"]
  end

  def generate_file(file_path)
    CSV.open("#{file_path}", "w") do |csv|
      csv << generate_csv_data
    end
  end
end