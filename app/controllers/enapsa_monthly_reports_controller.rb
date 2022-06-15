class EnapsaMonthlyReportsController < ApplicationController
  def new
  end

  def download
    redirect_to "/enapsa_monthly_report/show"
  end

  def show
  end
end
