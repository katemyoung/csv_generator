require "rails_helper"

describe EnapsaMonthlyReportMailer, type: :mailer do
  describe "report_generated_email" do
    it "renders the email" do
      employer = create(:employer)
      report = build(:enapsa_monthly_report)
      mail = EnapsaMonthlyReportMailer.report_generated_email(report)

      expect(mail.subject).to eq("Your eNapsa monthly report has been generated")
      expect(mail.to).to eq(["example@example.com"])
      expect(mail.body.to_s).to match(/My Company/)  
    end
  end
end
