class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end

  def index
    @employers = Employer.all
  end 

  def create
    employer = Employer.create(name: params[:employer][:name], account_number: params[:employer][:account_number])
    if employer.valid?
      redirect_to employers_path
    else 
      @employer = Employer.new
      render :new
    end
  end
end
