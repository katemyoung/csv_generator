class CsvFileMaker
  require "csv"
  
  def select_account_number
  end

  def generate_csv_data
    ["1234567", "2022"]
  end

  def generate_file(file_path)
    CSV.open("#{file_path}", "w") do |csv|
      csv << generate_csv_data
    end
  end
end