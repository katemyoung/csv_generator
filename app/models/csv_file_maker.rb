class CsvFileMaker
  require "csv"
  
  def select_account_number
    "1234567"
  end

  def generate_csv_data
    [select_account_number, "2022"]
  end

  def generate_file(file_path)
    CSV.open("#{file_path}", "w") do |csv|
      csv << generate_csv_data
    end
  end
end