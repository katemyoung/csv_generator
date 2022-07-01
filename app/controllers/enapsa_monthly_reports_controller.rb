class EnapsaMonthlyReportsController < ApplicationController
  def new
  end

  def create
    @@employer = Employer.find_by(name: params[:employer]) # finds the employer object
    @year = params[:date][:year]
    @month = params[:date][:month]
    @report = EnapsaMonthlyReport.new(@@employer, @year, @month) # also need to pass in the month
    @report.generate_file
    EnapsaMonthlyReportMailer.report_generated_email(@report).deliver_now
    redirect_to enapsa_monthly_report_show_path
  end

  def show
  end

  def download_csv
    send_file("#{Rails.root}/public/enapsa_reports/#{@@employer.name}.csv",
      filename: "#{@@employer.name}.csv")
  end
end
