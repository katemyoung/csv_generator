class CSVFileMaker
  require "csv"

  def generate_csv_data
  end

  def generate_file(file_path)
    CSV.open("#{file_path}", "w") do |csv|
      csv << ["1234567"]
    end
  end
end