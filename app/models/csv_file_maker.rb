class CsvFileMaker
  require "csv"
  attr_accessor :employer_name

  def initialize(employer_name)
    @employer_name = employer_name
  end

  def generate_file(file_path)
    CSV.open("#{file_path}", "w") do |csv|
      csv.add_row(generate_csv_data)
    end
  end

  private

  def employer_account_number
    Employer.find_by(name: @employer_name).account_number.to_s
  end

  def generate_csv_data
    [employer_account_number, "2022"]
  end
end
