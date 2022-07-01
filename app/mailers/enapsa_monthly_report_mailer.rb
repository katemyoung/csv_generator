class EnapsaMonthlyReportMailer < ApplicationMailer
  default from: "from@example.com"
  
  def report_generated_email(report)
    @report = report
    mail(to: "example@example.com", subject: "Your eNapsa monthly report has been generated")
  end
end
