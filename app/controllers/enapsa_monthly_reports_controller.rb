class EnapsaMonthlyReportsController < ApplicationController
  def new
  end

  def create
    @@employer_name = params[:employer] # refactor this in future
    @year = params[:date][:year]
    @month = params[:date][:month]
    report = EnapsaMonthlyReport.new(@@employer_name, @year, @month) # also need to pass in the month
    report.generate_file
    redirect_to enapsa_monthly_report_show_path
  end

  def show
  end

  def download_csv
    send_file("#{Rails.root}/public/enapsa_reports/#{@@employer_name}.csv",
      filename: "#{@@employer_name}.csv")
  end
end
