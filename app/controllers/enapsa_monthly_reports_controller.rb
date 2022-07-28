class EnapsaMonthlyReportsController < ApplicationController
  before_action :set_employer, only: [:create]
  before_action :set_employee, only: [:create]

  def new
  end

  def create
    @year = params[:date][:year]
    @month = params[:date][:month]
    report = EnapsaMonthlyReport.new(@@employer, @year, @month, @employee)
    redirect_to enapsa_monthly_report_show_path
  end

  def show
  end

  def download_csv
    send_file(file_path, filename: "#{@@employer.name}.csv")
  end

  private
   
  def set_employer
    @@employer = Employer.find_by(name: params[:employer])
  end

  def set_employee
    @employee = Employee.find(1) # only works for the first employee in the database
  end

  def file_path
    Rails.root.join("tmp/enapsa_reports/#{@@employer.name}.csv")  
  end
end




# class EnapsaMonthlyReportsController < ApplicationController
#   def new
#   end

#   def create
#     @@employer = Employer.find_by(name: params[:employer]) # finds the employer object
#     @year = params[:date][:year]
#     @month = params[:date][:month]
#     report = EnapsaMonthlyReport.new(@@employer, @year, @month) # also need to pass in the month
#     report.generate_file
#     redirect_to enapsa_monthly_report_show_path
#   end

#   def show
#   end

#   def download_csv
#     send_file("#{Rails.root}/public/enapsa_reports/#{@@employer.name}.csv",
#       filename: "#{@@employer.name}.csv")
#   end
# end