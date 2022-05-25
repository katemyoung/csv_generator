class CSVFileMaker
  require "csv"

  def generate_file
    CSV.open("./public/csv_files/file.csv", "w") do |csv|
      csv << ["moo"]
    end
  end
end