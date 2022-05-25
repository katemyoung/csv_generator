class CSVFileMaker
  require "csv"

  def generate_file(file_path)
    CSV.open("#{file_path}", "w") do |csv|
      csv << []
    end
  end
end