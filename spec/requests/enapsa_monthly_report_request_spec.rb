require "rails_helper"

describe "enapsa monthly report requests" do

  before(:example) do
    ActionMailer::Base.deliveries.clear
  end

  xit "sends an email when a enapsa report is generated" do
    employer = create(:employer)
    report = build(:enapsa_monthly_report)
    allow(report).to receive(:file_path).and_return("#{Rails.root}/tmp/enapsa_reports/#{employer[:name]}.csv")
    allow(report).to receive(:employer_account_number).and_return(employer[:account_number].to_s)
    report.generate_file
    email = ActionMailer::Base.deliveries.first

    expect(ActionMailer::Base.deliveries.size).to eq(1)
    expect(email.subject).to eq("Your eNapsa monthly report has been generated")
    expect(email.to).to eq(["example@example.com"])
    expect(email.body.to_s).to match(/My Company/)
  end

end