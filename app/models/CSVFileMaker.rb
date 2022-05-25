class CSVFileMaker
  require "csv"

  def generate_file
    CSV.open("file.csv", "w") do |csv|
      csv << ["moo"]
    end
  end
end